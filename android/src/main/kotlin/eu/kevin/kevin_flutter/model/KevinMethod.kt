package eu.kevin.kevin_flutter.model

internal enum class KevinMethod(val key: String) {
    SET_LOCALE("setLocale"),
    SET_THEME("setTheme"),
    SET_SANDBOX("setSandbox"),
    SET_DEEP_LINKING_ENABLED("setDeepLinkingEnabled"),
    SET_PAYMENTS_CONFIGURATION("setPaymentsConfiguration"),
    SET_ACCOUNTS_CONFIGURATION("setAccountsConfiguration"),
    START_ACCOUNT_LINKING("startAccountLinking"),
    START_PAYMENT("startPayment");

    companion object {
        private val methods = values()
            .associateBy(KevinMethod::key)

        internal fun getByKey(key: String): KevinMethod? = methods[key]
    }
}