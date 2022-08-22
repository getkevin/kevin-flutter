package eu.kevin.flutter.accounts.model

internal enum class KevinAccountsMethod(val key: String) {
    SET_ACCOUNTS_CONFIGURATION("setAccountsConfiguration"),
    START_ACCOUNT_LINKING("startAccountLinking"),
    GET_CALLBACK_URL("getCallbackUrl"),
    IS_SHOW_UNSUPPORTED_BANKS("isShowUnsupportedBanks");

    companion object {
        private val methods = values()
            .associateBy(KevinAccountsMethod::key)

        internal fun getByKey(key: String): KevinAccountsMethod? = methods[key]
    }
}