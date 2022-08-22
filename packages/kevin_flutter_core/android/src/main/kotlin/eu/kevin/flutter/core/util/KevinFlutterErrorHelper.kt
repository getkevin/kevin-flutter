package eu.kevin.flutter.core.util

import eu.kevin.flutter.core.model.KevinErrorCodes
import io.flutter.plugin.common.MethodChannel

object KevinFlutterErrorHelper {
    fun emitUnexpectedFlutterError(
        result: MethodChannel.Result,
        error: Throwable? = null,
        message: String? = null
    ) {
        emitFlutterError(
            result = result,
            code = KevinErrorCodes.ERROR_UNEXPECTED,
            error = error,
            message = message
        )
    }

    fun emitFlutterError(
        result: MethodChannel.Result,
        code: String = KevinErrorCodes.ERROR_GENERAL,
        error: Throwable? = null,
        message: String? = null
    ) {
        result.error(code, message ?: error?.localizedMessage ?: error?.message, null)
    }
}