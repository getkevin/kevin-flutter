package eu.kevin.flutter.core.model

internal enum class KevinMethod(val key: String) {
    SET_LOCALE("setLocale"),
    SET_THEME("setTheme"),
    SET_SANDBOX("setSandbox"),
    SET_DEEP_LINKING_ENABLED("setDeepLinkingEnabled"),
    GET_LOCALE("getLocale"),
    IS_SANDBOX("isSandbox"),
    IS_DEEP_LINKING_ENABLED("isDeepLinkingEnabled");


    companion object {
        private val methods = values()
            .associateBy(KevinMethod::key)

        internal fun getByKey(key: String): KevinMethod? = methods[key]
    }
}