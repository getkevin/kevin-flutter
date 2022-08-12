package eu.kevin.kevin_flutter.entity

import kotlinx.serialization.Serializable

@Serializable
internal data class AccountSessionConfigurationEntity(
    val state: String,
    val preselectedCountry: String?,
    val disableCountrySelection: Boolean,
    val countryFilter: List<String>,
    val bankFilter: List<String>,
    val preselectedBank: String?,
    val skipBankSelection: Boolean,
    val accountLinkingType: String,
)