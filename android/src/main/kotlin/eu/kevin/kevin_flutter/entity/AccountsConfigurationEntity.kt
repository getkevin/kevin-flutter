package eu.kevin.kevin_flutter.entity

import kotlinx.serialization.Serializable

@Serializable
internal data class AccountsConfigurationEntity(
    val callbackUrl: String,
    val showUnsupportedBanks: Boolean,
)