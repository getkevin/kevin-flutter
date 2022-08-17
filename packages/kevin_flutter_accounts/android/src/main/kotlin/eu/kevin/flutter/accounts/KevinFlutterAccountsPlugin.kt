package eu.kevin.flutter.accounts

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import eu.kevin.accounts.KevinAccountsConfiguration
import eu.kevin.accounts.KevinAccountsPlugin
import eu.kevin.accounts.accountsession.AccountSessionActivity
import eu.kevin.accounts.accountsession.AccountSessionContract
import eu.kevin.accounts.accountsession.AccountSessionResult
import eu.kevin.accounts.accountsession.entities.AccountSessionConfiguration
import eu.kevin.accounts.accountsession.enums.AccountLinkingType
import eu.kevin.core.entities.SessionResult
import eu.kevin.core.enums.KevinCountry
import eu.kevin.flutter.accounts.entity.AccountSessionConfigurationEntity
import eu.kevin.flutter.accounts.entity.AccountsConfigurationEntity
import eu.kevin.flutter.accounts.model.KevinMethod
import eu.kevin.flutter.accounts.model.toKevinAccountResult
import eu.kevin.kevin_flutter.extension.toJsonElement
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

    private var activity: Activity? = null

    private var accountResult: MethodChannel.Result? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kevin_flutter_accounts")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (KevinMethod.getByKey(call.method)) {
            KevinMethod.SET_ACCOUNTS_CONFIGURATION -> onSetAccountsConfiguration(
                call,
                result
            )
            KevinMethod.START_ACCOUNT_LINKING -> onStartAccountLinking(call, result)
            KevinMethod.GET_CALLBACK_URL -> onGetCallbackUrl(result)
            KevinMethod.IS_SHOW_UNSUPPORTED_BANKS -> onIsShowUnsupportedBanks(result)
            else -> result.notImplemented()
        }
    }

    private fun onSetAccountsConfiguration(call: MethodCall, result: MethodChannel.Result) {
        val data = call.arguments<Map<String, Any?>>()

        if (data == null) {
            result.error(ERROR_GENERAL, "Accounts configuration can not be null", null)
            return
        }

        val configuration = getAccountConfiguration(data)
        KevinAccountsPlugin.configure(configuration)
        result.success(null)
    }

    private fun onStartAccountLinking(call: MethodCall, result: MethodChannel.Result) {
        val data = call.arguments<Map<String, Any?>>()

        if (data == null) {
            result.error(
                ERROR_GENERAL,
                "Account linking session configuration can not be null",
                null
            )
            return
        }

        val accountLinkingConfiguration = getAccountSessionConfiguration(data)

        this.accountResult = result

        val intent = Intent(activity, AccountSessionActivity::class.java)
        intent.putExtra(AccountSessionContract.CONFIGURATION_KEY, accountLinkingConfiguration)

        activity?.startActivityForResult(intent, REQUEST_CODE_LINKING)
    }

    private fun onGetCallbackUrl(result: MethodChannel.Result) {
        result.success(KevinAccountsPlugin.getCallbackUrl())
    }

    private fun onIsShowUnsupportedBanks(result: MethodChannel.Result) {
        result.success(KevinAccountsPlugin.isShowUnsupportedBanks())
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        val result = getActivityResult(requestCode, data)

        // Unexpected result
        if (result == null) {
            this.accountResult?.success(null)
            this.accountResult = null
            return false
        }

        emitActivityResult(result)
        this.accountResult = null
        return true
    }

    private fun getActivityResult(requestCode: Int, data: Intent?) = when {
        requestCode == REQUEST_CODE_LINKING && data != null -> {
            data.getParcelableExtra<SessionResult<AccountSessionResult>>(AccountSessionContract.RESULT_KEY)
        }
        else -> null
    }

    private fun emitActivityResult(result: SessionResult<AccountSessionResult>) {
        when (result) {
            is SessionResult.Success -> {
                val linkingResult = Json.encodeToString(result.value.toKevinAccountResult())
                this.accountResult?.success(linkingResult)
            }
            is SessionResult.Failure -> this.accountResult?.error(
                ERROR_GENERAL,
                result.error.localizedMessage ?: result.error.message,
                null
            )
            is SessionResult.Canceled -> this.accountResult?.error(ERROR_CANCELLED, null, null)
        }
    }

    private fun getAccountConfiguration(data: Map<String, Any?>): KevinAccountsConfiguration {
        val configurationData =
            Json.decodeFromJsonElement<AccountsConfigurationEntity>(data.toJsonElement())

        return KevinAccountsConfiguration.builder()
            .apply {
                setCallbackUrl(configurationData.callbackUrl)
                setShowUnsupportedBanks(configurationData.showUnsupportedBanks)
            }
            .build()
    }

    private fun getAccountSessionConfiguration(data: Map<String, Any?>): AccountSessionConfiguration {
        val configurationData =
            Json.decodeFromJsonElement<AccountSessionConfigurationEntity>(data.toJsonElement())

        val preselectedCountry = KevinCountry.parse(configurationData.preselectedCountry)
        val countryFilter = configurationData.countryFilter.mapNotNull { KevinCountry.parse(it) }
        val accountLinkingType =
            AccountLinkingType.valueOf(configurationData.accountLinkingType.uppercase())

        return AccountSessionConfiguration.Builder(configurationData.state)
            .apply {
                setPreselectedCountry(preselectedCountry)
                setDisableCountrySelection(configurationData.disableCountrySelection)
                setCountryFilter(countryFilter)
                setBankFilter(configurationData.bankFilter)
                configurationData.preselectedBank?.let { setPreselectedBank(it) }
                setSkipBankSelection(configurationData.skipBankSelection)
                setLinkingType(accountLinkingType)
            }
            .build()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    private companion object {
        const val REQUEST_CODE_LINKING = 100

        const val ERROR_GENERAL = "general"
        const val ERROR_CANCELLED = "cancelled"
    }
}