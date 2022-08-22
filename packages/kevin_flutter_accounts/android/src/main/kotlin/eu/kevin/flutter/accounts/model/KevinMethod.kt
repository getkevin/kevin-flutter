package eu.kevin.flutter.accounts.model

internal enum class KevinMethod(val key: String) {
    SET_ACCOUNTS_CONFIGURATION("setAccountsConfiguration"),
    START_ACCOUNT_LINKING("startAccountLinking"),
    GET_CALLBACK_URL("getCallbackUrl"),
    IS_SHOW_UNSUPPORTED_BANKS("isShowUnsupportedBanks");

    companion object {
        private val methods = values()
            .associateBy(KevinMethod::key)

        internal fun getByKey(key: String): KevinMethod? = methods[key]
    }
}