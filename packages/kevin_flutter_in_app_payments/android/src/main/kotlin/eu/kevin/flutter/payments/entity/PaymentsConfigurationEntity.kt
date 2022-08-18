package eu.kevin.flutter.payments.entity

import kotlinx.serialization.Serializable

@Serializable
internal data class PaymentsConfigurationEntity(
    val callbackUrl: String,
)