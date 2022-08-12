package eu.kevin.kevin_flutter.entity

import kotlinx.serialization.Serializable

@Serializable
internal data class PaymentsConfigurationEntity(
    val callbackUrl: String,
)