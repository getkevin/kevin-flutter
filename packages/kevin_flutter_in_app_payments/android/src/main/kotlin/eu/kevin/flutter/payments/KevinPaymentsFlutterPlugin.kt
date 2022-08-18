package eu.kevin.flutter.payments

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import eu.kevin.core.entities.SessionResult
import eu.kevin.core.enums.KevinCountry
import eu.kevin.flutter.payments.entity.PaymentSessionConfigurationEntity
import eu.kevin.flutter.payments.entity.PaymentsConfigurationEntity
import eu.kevin.flutter.payments.extension.toJsonElement
import eu.kevin.flutter.payments.model.KevinPaymentsMethod
import eu.kevin.flutter.payments.model.toKevinPaymentResult
import eu.kevin.inapppayments.KevinPaymentsConfiguration
import eu.kevin.inapppayments.KevinPaymentsPlugin
import eu.kevin.inapppayments.paymentsession.PaymentSessionActivity
import eu.kevin.inapppayments.paymentsession.PaymentSessionContract
import eu.kevin.inapppayments.paymentsession.PaymentSessionResult
import eu.kevin.inapppayments.paymentsession.entities.PaymentSessionConfiguration
import eu.kevin.inapppayments.paymentsession.enums.PaymentType
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

class KevinPaymentsFlutterPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    PluginRegistry.ActivityResultListener {

    private lateinit var channel: MethodChannel

    private var pluginBinding: ActivityPluginBinding? = null

    private var paymentResult: MethodChannel.Result? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kevin_flutter_payments")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (KevinPaymentsMethod.getByKey(call.method)) {
            KevinPaymentsMethod.SET_PAYMENTS_CONFIGURATION -> onSetPaymentsConfiguration(
                call,
                result
            )
            KevinPaymentsMethod.START_PAYMENT -> onStartPayment(call, result)
            KevinPaymentsMethod.GET_CALLBACK_URL -> onGetCallbackUrl(result)
            else -> result.notImplemented()
        }
    }

    private fun onSetPaymentsConfiguration(call: MethodCall, result: MethodChannel.Result) {
        val data = call.arguments<Map<String, Any?>>()

        if (data == null) {
            result.error(ERROR_GENERAL, "Payments configuration can not be null", null)
            return
        }

        val configuration = getPaymentsConfiguration(data)
        KevinPaymentsPlugin.configure(configuration)
        result.success(null)
    }

    private fun onStartPayment(call: MethodCall, result: MethodChannel.Result) {
        val data = call.arguments<Map<String, Any?>>()

        if (data == null) {
            result.error(ERROR_GENERAL, "Payment session configuration can not be null", null)
            return
        }

        this.paymentResult = result

        val paymentConfiguration = getPaymentSessionConfiguration(data)

        val intent = Intent(pluginBinding?.activity, PaymentSessionActivity::class.java)
        intent.putExtra(PaymentSessionContract.CONFIGURATION_KEY, paymentConfiguration)

        pluginBinding?.activity?.startActivityForResult(intent, REQUEST_CODE_PAYMENT)
    }

    private fun onGetCallbackUrl(result: MethodChannel.Result) {
        result.success(KevinPaymentsPlugin.getCallbackUrl())
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        val result = getActivityResult(requestCode, data)

        if (result == null) {
            this.paymentResult?.error(ERROR_GENERAL, "Payment result can not be null", null)
            this.paymentResult = null
            return false
        }

        emitActivityResult(result)
        this.paymentResult = null
        return true
    }

    private fun getActivityResult(
        requestCode: Int,
        data: Intent?
    ): SessionResult<PaymentSessionResult>? {
        return when {
            requestCode == REQUEST_CODE_PAYMENT && data != null -> {
                data.getParcelableExtra(PaymentSessionContract.RESULT_KEY)
            }
            else -> null
        }
    }

    private fun emitActivityResult(result: SessionResult<PaymentSessionResult>) {
        when (result) {
            is SessionResult.Success -> {
                val paymentResult = Json.encodeToString(result.value.toKevinPaymentResult())
                this.paymentResult?.success(paymentResult)
            }
            is SessionResult.Failure -> this.paymentResult?.error(
                ERROR_GENERAL,
                result.error.localizedMessage ?: result.error.message,
                null
            )
            is SessionResult.Canceled -> this.paymentResult?.error(
                ERROR_CANCELLED,
                null,
                null
            )
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

    private fun getPaymentSessionConfiguration(data: Map<String, Any?>): PaymentSessionConfiguration {
        val configurationData =
            Json.decodeFromJsonElement<PaymentSessionConfigurationEntity>(data.toJsonElement())

        val paymentType = PaymentType.valueOf(configurationData.paymentType.uppercase())
        val preselectedCountry = KevinCountry.parse(configurationData.preselectedCountry)
        val countryFilter = configurationData.countryFilter.mapNotNull { KevinCountry.parse(it) }

        val configurationBuilder = PaymentSessionConfiguration.Builder(configurationData.paymentId)
            .setPaymentType(paymentType)
            .setPreselectedCountry(preselectedCountry)
            .setDisableCountrySelection(configurationData.disableCountrySelection)
            .setCountryFilter(countryFilter)
            .setBankFilter(configurationData.bankFilter)
            .setSkipBankSelection(configurationData.skipBankSelection)
            .setSkipAuthentication(configurationData.skipAuthentication)

        configurationData.preselectedBank?.let {
            configurationBuilder.setPreselectedBank(it)
        }

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
        const val REQUEST_CODE_PAYMENT = 100

        const val ERROR_GENERAL = "general"
        const val ERROR_CANCELLED = "cancelled"
    }
}