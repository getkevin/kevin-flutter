package eu.kevin.flutter.accounts

import android.content.Intent
import eu.kevin.accounts.KevinAccountsConfiguration
import eu.kevin.accounts.KevinAccountsPlugin
import eu.kevin.accounts.accountsession.AccountSessionActivity
import eu.kevin.accounts.accountsession.AccountSessionContract
import eu.kevin.accounts.accountsession.AccountSessionResult
import eu.kevin.accounts.accountsession.entities.AccountSessionConfiguration
import eu.kevin.core.entities.SessionResult
import eu.kevin.core.enums.KevinCountry
import eu.kevin.flutter.accounts.entity.AccountSessionConfigurationEntity
import eu.kevin.flutter.accounts.entity.AccountsConfigurationEntity
import eu.kevin.flutter.accounts.model.KevinAccountsMethod
import eu.kevin.flutter.accounts.model.toKevinAccountResult
import eu.kevin.flutter.core.extension.emitError
import eu.kevin.flutter.core.extension.emitUnexpectedError
import eu.kevin.flutter.core.extension.toJsonElement
import eu.kevin.flutter.core.model.KevinErrorCode
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.decodeFromJsonElement

class KevinFlutterAccountsPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    PluginRegistry.ActivityResultListener {

    private lateinit var channel: MethodChannel

    private var pluginBinding: ActivityPluginBinding? = null

    private var accountResult: MethodChannel.Result? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kevin_flutter_accounts_android")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (KevinAccountsMethod.getByKey(call.method)) {
            KevinAccountsMethod.SET_ACCOUNTS_CONFIGURATION -> onSetAccountsConfiguration(
                call,
                result
            )
            KevinAccountsMethod.START_ACCOUNT_LINKING -> onStartAccountLinking(call, result)
            KevinAccountsMethod.GET_CALLBACK_URL -> onGetCallbackUrl(result)
            KevinAccountsMethod.IS_SHOW_UNSUPPORTED_BANKS -> onIsShowUnsupportedBanks(result)
            else -> result.notImplemented()
        }
    }

    private fun onSetAccountsConfiguration(call: MethodCall, result: MethodChannel.Result) {
        val data = call.arguments<Map<String, Any?>>()

        if (data == null) {
            result.emitUnexpectedError(message = "Accounts configuration can not be null")
            return
        }

        val configuration = try {
            getAccountConfiguration(data)
        } catch (error: Throwable) {
            result.emitUnexpectedError(error = error)
            return
        }

        KevinAccountsPlugin.configure(configuration)
        result.success(null)
    }

    private fun onStartAccountLinking(call: MethodCall, result: MethodChannel.Result) {
        val data = call.arguments<Map<String, Any?>>()

        if (data == null) {
            result.emitUnexpectedError(message = "Account linking session configuration can not be null")
            return
        }

        val accountLinkingConfiguration = try {
            getAccountSessionConfiguration(data)
        } catch (error: Throwable) {
            result.emitUnexpectedError(error = error)
            return
        }

        this.accountResult = result

        val intent = Intent(pluginBinding?.activity, AccountSessionActivity::class.java)
        intent.putExtra(AccountSessionContract.CONFIGURATION_KEY, accountLinkingConfiguration)

        pluginBinding?.activity?.startActivityForResult(intent, REQUEST_CODE_LINKING)
    }

    private fun onGetCallbackUrl(result: MethodChannel.Result) {
        try {
            result.success(KevinAccountsPlugin.getCallbackUrl())
        } catch (error: Throwable) {
            result.emitUnexpectedError(error = error)
        }
    }

    private fun onIsShowUnsupportedBanks(result: MethodChannel.Result) {
        try {
            result.success(KevinAccountsPlugin.isShowUnsupportedBanks())
        } catch (error: Throwable) {
            result.emitUnexpectedError(error = error)
            return
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        val result = getActivityResult(requestCode, data)

        if (result == null) {
            this.accountResult?.emitUnexpectedError(message = "Account linking result can not be null")
            this.accountResult = null
            return false
        }

        emitActivityResult(result)
        this.accountResult = null
        return true
    }

    private fun getActivityResult(
        requestCode: Int,
        data: Intent?
    ): SessionResult<AccountSessionResult>? {
        return when {
            requestCode == REQUEST_CODE_LINKING && data != null -> {
                data.getParcelableExtra(AccountSessionContract.RESULT_KEY)
            }
            else -> null
        }
    }

    private fun emitActivityResult(result: SessionResult<AccountSessionResult>) {
        when (result) {
            is SessionResult.Success -> onSessionResultSuccess(result.value)
            is SessionResult.Failure -> this.accountResult?.emitError(error = result.error)
            is SessionResult.Canceled -> this.accountResult?.emitError(code = KevinErrorCode.CANCELLED)
        }
    }

    private fun onSessionResultSuccess(result: AccountSessionResult) {
        try {
            val linkingResult = Json.encodeToString(result.toKevinAccountResult())
            this.accountResult?.success(linkingResult)
        } catch (error: Throwable) {
            this.accountResult?.emitUnexpectedError(error = error)
        }
    }

    private fun getAccountConfiguration(data: Map<String, Any?>): KevinAccountsConfiguration {
        val configurationData =
            Json.decodeFromJsonElement<AccountsConfigurationEntity>(data.toJsonElement())

        return KevinAccountsConfiguration.builder()
            .setCallbackUrl(configurationData.callbackUrl)
            .setShowUnsupportedBanks(configurationData.showUnsupportedBanks)
            .build()
    }

    private fun getAccountSessionConfiguration(data: Map<String, Any?>): AccountSessionConfiguration {
        val configurationData =
            Json.decodeFromJsonElement<AccountSessionConfigurationEntity>(data.toJsonElement())

        val preselectedCountry = KevinCountry.parse(configurationData.preselectedCountry)
        val countryFilter = configurationData.countryFilter.mapNotNull { KevinCountry.parse(it) }

        val configurationBuilder = AccountSessionConfiguration.Builder(configurationData.state)
            .setPreselectedCountry(preselectedCountry)
            .setDisableCountrySelection(configurationData.disableCountrySelection)
            .setCountryFilter(countryFilter)
            .setBankFilter(configurationData.bankFilter)
            .setSkipBankSelection(configurationData.skipBankSelection)

        configurationData.preselectedBank?.let { configurationBuilder.setPreselectedBank(it) }

        return configurationBuilder.build()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        pluginBinding = binding
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        pluginBinding?.removeActivityResultListener(this)
        pluginBinding = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        pluginBinding = binding
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        pluginBinding?.removeActivityResultListener(this)
        pluginBinding = null
    }

    private companion object {
        const val REQUEST_CODE_LINKING = 100
    }
}