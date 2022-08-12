package eu.kevin.kevin_flutter

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
import eu.kevin.core.plugin.Kevin
import eu.kevin.inapppayments.KevinPaymentsConfiguration
import eu.kevin.inapppayments.KevinPaymentsPlugin
import eu.kevin.inapppayments.paymentsession.PaymentSessionActivity
import eu.kevin.inapppayments.paymentsession.PaymentSessionContract
import eu.kevin.inapppayments.paymentsession.PaymentSessionResult
import eu.kevin.inapppayments.paymentsession.entities.PaymentSessionConfiguration
import eu.kevin.inapppayments.paymentsession.enums.PaymentType
import eu.kevin.kevin_flutter.entity.AccountSessionConfigurationEntity
import eu.kevin.kevin_flutter.entity.AccountsConfigurationEntity
import eu.kevin.kevin_flutter.entity.PaymentSessionConfigurationEntity
import eu.kevin.kevin_flutter.entity.PaymentsConfigurationEntity
import eu.kevin.kevin_flutter.extension.toJsonElement
import eu.kevin.kevin_flutter.model.KevinActivityResult
import eu.kevin.kevin_flutter.model.KevinMethod
import eu.kevin.kevin_flutter.model.KevinMethodArguments
import eu.kevin.kevin_flutter.model.toKevinBank
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.decodeFromJsonElement
import java.util.Locale

/** KevinFlutterPlugin */
class KevinFlutterPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    PluginRegistry.ActivityResultListener {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    private var activity: Activity? = null

    private var result: Result? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kevin_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (KevinMethod.getByKey(call.method)) {
            KevinMethod.SET_LOCALE -> onSetLocale(call, result)
            KevinMethod.SET_THEME -> onSetTheme(call)
            KevinMethod.SET_SANDBOX -> onSetSandbox(call, result)
            KevinMethod.SET_DEEP_LINKING_ENABLED -> onSetDeepLinkingEnabled(call, result)
            KevinMethod.SET_PAYMENTS_CONFIGURATION -> onSetPaymentsConfiguration(
                call,
                result
            )
            KevinMethod.SET_ACCOUNTS_CONFIGURATION -> onSetAccountsConfiguration(
                call,
                result
            )
            KevinMethod.START_ACCOUNT_LINKING -> onStartAccountLinking(call, result)
            KevinMethod.START_PAYMENT -> onStartPayment(call, result)
            else -> result.notImplemented()
        }
    }

    private fun onSetLocale(call: MethodCall, result: Result) {
        val lang = call.argument<String>(KevinMethodArguments.languageCode)
        val locale = lang?.let { Locale(it) }
        Kevin.setLocale(locale)
        result.success(null)
    }

    private fun onSetTheme(call: MethodCall) {}

    private fun onSetSandbox(call: MethodCall, result: Result) {
        val isSandbox = call.argument<Boolean>(KevinMethodArguments.sandbox) ?: false
        Kevin.setSandbox(isSandbox)
        result.success(null)
    }

    private fun onSetDeepLinkingEnabled(call: MethodCall, result: Result) {
        val isDeepLinkingEnabled =
            call.argument<Boolean>(KevinMethodArguments.deepLinkingEnabled) ?: false
        Kevin.setDeepLinkingEnabled(isDeepLinkingEnabled)
        result.success(null)
    }

    private fun onSetPaymentsConfiguration(call: MethodCall, result: Result) {
        val data = call.arguments<Map<String, Any?>>()

        if (data == null) {
            result.error(ERROR_GENERAL, "Payments configuration can not be null", null)
            return
        }

        val configuration = getPaymentsConfiguration(data)
        KevinPaymentsPlugin.configure(configuration)
        result.success(null)
    }

    private fun onSetAccountsConfiguration(call: MethodCall, result: Result) {
        val data = call.arguments<Map<String, Any?>>()

        if (data == null) {
            result.error(ERROR_GENERAL, "Accounts configuration can not be null", null)
            return
        }

        val configuration = getAccountConfiguration(data)
        KevinAccountsPlugin.configure(configuration)
        result.success(null)
    }

    private fun onStartAccountLinking(call: MethodCall, result: Result) {
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

        this.result = result

        val intent = Intent(activity, AccountSessionActivity::class.java)
        intent.putExtra(AccountSessionContract.CONFIGURATION_KEY, accountLinkingConfiguration)

        activity?.startActivityForResult(intent, REQUEST_CODE_LINKING)
    }

    private fun onStartPayment(call: MethodCall, result: Result) {
        val data = call.arguments<Map<String, Any?>>()

        if (data == null) {
            result.error(ERROR_GENERAL, "Payment session configuration can not be null", null)
            return
        }

        this.result = result

        val paymentConfiguration = getPaymentSessionConfiguration(data)

        val intent = Intent(activity, PaymentSessionActivity::class.java)
        intent.putExtra(PaymentSessionContract.CONFIGURATION_KEY, paymentConfiguration)

        activity?.startActivityForResult(intent, REQUEST_CODE_PAYMENT)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        val result = getActivityResult(requestCode, data)

        // Unexpected result
        if (result == null) {
            this.result?.success(null)
            this.result = null
            return false
        }

        emitActivityResult(result)
        this.result = null
        return true
    }

    private fun getActivityResult(requestCode: Int, data: Intent?) = when {
        requestCode == REQUEST_CODE_LINKING && data != null -> {
            handleAccountLinking(data)
        }
        requestCode == REQUEST_CODE_PAYMENT && data != null -> {
            handlePayment(data)
        }
        else -> null
    }

    private fun emitActivityResult(result: KevinActivityResult) {
        when (result) {
            is KevinActivityResult.LinkingSuccess -> {
                val linkingResult = Json.encodeToString(result)
                this.result?.success(linkingResult)
            }
            is KevinActivityResult.PaymentSuccess -> {
                val paymentResult = Json.encodeToString(result)
                this.result?.success(paymentResult)
            }
            is KevinActivityResult.Error -> this.result?.error(ERROR_GENERAL, result.message, null)
            is KevinActivityResult.Cancelled -> this.result?.error(ERROR_CANCELLED, null, null)
        }
    }

    private fun handleAccountLinking(data: Intent): KevinActivityResult? {
        val result =
            data.getParcelableExtra<SessionResult<AccountSessionResult>>(AccountSessionContract.RESULT_KEY)

        return when (result) {
            is SessionResult.Success ->
                KevinActivityResult.LinkingSuccess(
                    result.value.bank?.toKevinBank(),
                    result.value.authorizationCode,
                    result.value.linkingType
                )
            is SessionResult.Failure -> KevinActivityResult.Error(
                result.error.localizedMessage ?: result.error.message
            )
            is SessionResult.Canceled -> KevinActivityResult.Cancelled
            else -> null
        }
    }

    private fun handlePayment(data: Intent): KevinActivityResult? {
        val result =
            data.getParcelableExtra<SessionResult<PaymentSessionResult>>(PaymentSessionContract.RESULT_KEY)

        return when (result) {
            is SessionResult.Success ->
                KevinActivityResult.PaymentSuccess(result.value.paymentId)
            is SessionResult.Failure -> KevinActivityResult.Error(
                result.error.localizedMessage ?: result.error.message
            )
            is SessionResult.Canceled -> KevinActivityResult.Cancelled
            else -> null
        }
    }

    private fun getPaymentsConfiguration(data: Map<String, Any?>): KevinPaymentsConfiguration {
        val configurationData =
            Json.decodeFromJsonElement<PaymentsConfigurationEntity>(data.toJsonElement())

        return KevinPaymentsConfiguration.builder()
            .apply {
                setCallbackUrl(configurationData.callbackUrl)
            }
            .build()
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

    private fun getPaymentSessionConfiguration(data: Map<String, Any?>): PaymentSessionConfiguration {
        val configurationData =
            Json.decodeFromJsonElement<PaymentSessionConfigurationEntity>(data.toJsonElement())

        val paymentType = PaymentType.valueOf(configurationData.paymentType.uppercase())
        val preselectedCountry = KevinCountry.parse(configurationData.preselectedCountry)
        val countryFilter = configurationData.countryFilter.mapNotNull { KevinCountry.parse(it) }

        return PaymentSessionConfiguration.Builder(configurationData.paymentId)
            .apply {
                setPaymentType(paymentType)
                setPreselectedCountry(preselectedCountry)
                setDisableCountrySelection(configurationData.disableCountrySelection)
                setCountryFilter(countryFilter)
                setBankFilter(configurationData.bankFilter)
                configurationData.preselectedBank?.let { setPreselectedBank(it) }
                setSkipBankSelection(configurationData.skipBankSelection)
                setSkipAuthentication(configurationData.skipAuthentication)
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
        const val REQUEST_CODE_PAYMENT = 101

        const val ERROR_GENERAL = "general"
        const val ERROR_CANCELLED = "cancelled"
    }
}