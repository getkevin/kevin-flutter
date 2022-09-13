package eu.kevin.flutter.accounts.entity

import kotlinx.serialization.Serializable

@Serializable
internal data class AccountsConfigurationEntity(
    val callbackUrl: String,
    val showUnsupportedBanks: Boolean,
)