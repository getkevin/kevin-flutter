package eu.kevin.flutter.core.extension

import eu.kevin.flutter.core.model.KevinErrorCode
import io.flutter.plugin.common.MethodChannel

fun MethodChannel.Result.emitUnexpectedError(error: Throwable? = null, message: String? = null) =
    this.emitError(code = KevinErrorCode.UNEXPECTED, error = error, message = message)

fun MethodChannel.Result.emitError(
    code: KevinErrorCode = KevinErrorCode.GENERAL,
    error: Throwable? = null,
    message: String? = null
) = this.error(code.key, message ?: error?.localizedMessage ?: error?.message, null)
