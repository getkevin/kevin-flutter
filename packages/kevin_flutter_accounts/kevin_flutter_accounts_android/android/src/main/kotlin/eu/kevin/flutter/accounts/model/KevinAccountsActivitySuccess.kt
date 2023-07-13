package eu.kevin.flutter.accounts.model

import eu.kevin.accounts.accountsession.AccountSessionResult
import kotlinx.serialization.Serializable

@Serializable
internal data class KevinAccountsActivitySuccess(
    val bank: KevinBank?,
    val authorizationCode: String,
)

internal fun AccountSessionResult.toKevinAccountResult() =
    KevinAccountsActivitySuccess(bank?.toKevinBank(), authorizationCode)