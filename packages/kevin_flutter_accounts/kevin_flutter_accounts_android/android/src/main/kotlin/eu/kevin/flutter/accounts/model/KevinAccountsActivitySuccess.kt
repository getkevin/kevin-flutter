package eu.kevin.flutter.accounts.model

import eu.kevin.accounts.accountsession.AccountSessionResult
import eu.kevin.accounts.accountsession.enums.AccountLinkingType
import kotlinx.serialization.Serializable

@Serializable
internal data class KevinAccountsActivitySuccess(
    val bank: KevinBank?,
    val authorizationCode: String,
    val linkingType: AccountLinkingType,
)

internal fun AccountSessionResult.toKevinAccountResult() =
    KevinAccountsActivitySuccess(bank?.toKevinBank(), authorizationCode, linkingType)