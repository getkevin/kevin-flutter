package eu.kevin.flutter.payments.model

internal enum class KevinPaymentsMethod(val key: String) {
    SET_PAYMENTS_CONFIGURATION("setPaymentsConfiguration"),
    START_PAYMENT("startPayment"),
    GET_CALLBACK_URL("getCallbackUrl");

    companion object {
        private val methods = values()
            .associateBy(KevinPaymentsMethod::key)

        internal fun getByKey(key: String): KevinPaymentsMethod? = methods[key]
    }
}