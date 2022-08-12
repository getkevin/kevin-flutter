package eu.kevin.kevin_flutter.model

import eu.kevin.accounts.bankselection.entities.Bank
import kotlinx.serialization.Serializable

@Serializable
internal data class KevinBank(
    val id: String,
    val name: String,
    val officialName: String? = null,
    val imageUri: String,
    val bic: String? = null,
)

internal fun Bank.toKevinBank() = KevinBank(id, name, officialName, imageUri, bic)