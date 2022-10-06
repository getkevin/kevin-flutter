package eu.kevin.flutter.payments.model

import eu.kevin.inapppayments.paymentsession.PaymentSessionResult
import kotlinx.serialization.Serializable

@Serializable
internal data class KevinPaymentsActivitySuccess(val paymentId: String)

internal fun PaymentSessionResult.toKevinPaymentResult() = KevinPaymentsActivitySuccess(paymentId);
