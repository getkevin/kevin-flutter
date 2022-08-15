package eu.kevin.flutter.accounts.model

internal enum class KevinMethod(val key: String) {
    SET_ACCOUNTS_CONFIGURATION("setAccountsConfiguration"),
    START_ACCOUNT_LINKING("startAccountLinking");

    companion object {
        private val methods = values()
            .associateBy(KevinMethod::key)

        internal fun getByKey(key: String): KevinMethod? = methods[key]
    }
}