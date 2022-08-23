package eu.kevin.flutter.core.util

import eu.kevin.flutter.core.model.KevinErrorCode
import io.flutter.plugin.common.MethodChannel

object KevinFlutterErrorHelper {
    fun emitUnexpectedFlutterError(
        result: MethodChannel.Result,
        error: Throwable? = null,
        message: String? = null
    ) {
        emitFlutterError(
            result = result,
            code = KevinErrorCode.UNEXPECTED,
            error = error,
            message = message
        )
    }

    fun emitFlutterError(
        result: MethodChannel.Result,
        code: KevinErrorCode = KevinErrorCode.GENERAL,
        error: Throwable? = null,
        message: String? = null
    ) {
        result.error(code.key, message ?: error?.localizedMessage ?: error?.message, null)
    }
}