package eu.kevin.flutter.core.model

internal enum class KevinMethod(val key: String) {
    SET_LOCALE("setLocale"),
    SET_THEME("setTheme"),
    SET_SANDBOX("setSandbox"),
    SET_DEEP_LINKING_ENABLED("setDeepLinkingEnabled");

    companion object {
        private val methods = values()
            .associateBy(KevinMethod::key)

        internal fun getByKey(key: String): KevinMethod? = methods[key]
    }
}