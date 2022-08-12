package eu.kevin.kevin_flutter.model

import eu.kevin.accounts.accountsession.enums.AccountLinkingType
import kotlinx.serialization.Serializable

internal sealed class KevinActivityResult {
    @Serializable
    data class PaymentSuccess(val paymentId: String) : KevinActivityResult()

    @Serializable
    data class LinkingSuccess(
        val bank: KevinBank?,
        val authorizationCode: String,
        val linkingType: AccountLinkingType,
    ) : KevinActivityResult()

    data class Error(val message: String?) : KevinActivityResult()
    object Cancelled : KevinActivityResult()
}