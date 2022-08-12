package eu.kevin.kevin_flutter.entity

import kotlinx.serialization.Serializable

@Serializable
internal data class PaymentSessionConfigurationEntity(
    val paymentId: String,
    val paymentType: String,
    val preselectedCountry: String?,
    val disableCountrySelection: Boolean,
    val countryFilter: List<String>,
    val bankFilter: List<String>,
    val preselectedBank: String?,
    val skipBankSelection: Boolean,
    val skipAuthentication: Boolean,
)