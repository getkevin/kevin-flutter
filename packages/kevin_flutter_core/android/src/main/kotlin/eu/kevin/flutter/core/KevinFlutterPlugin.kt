package eu.kevin.flutter.core

import androidx.annotation.NonNull
import eu.kevin.core.plugin.Kevin
import eu.kevin.flutter.core.model.KevinMethod
import eu.kevin.flutter.core.model.KevinMethodArguments
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import java.util.Locale

class KevinFlutterPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kevin_flutter_core")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (KevinMethod.getByKey(call.method)) {
            KevinMethod.SET_LOCALE -> onSetLocale(call, result)
            KevinMethod.SET_THEME -> onSetTheme(call)
            KevinMethod.SET_SANDBOX -> onSetSandbox(call, result)
            KevinMethod.SET_DEEP_LINKING_ENABLED -> onSetDeepLinkingEnabled(call, result)
            else -> result.notImplemented()
        }
    }

    private fun onSetLocale(call: MethodCall, result: MethodChannel.Result) {
        val lang = call.argument<String>(KevinMethodArguments.languageCode)
        val locale = lang?.let { Locale(it) }
        Kevin.setLocale(locale)
        result.success(null)
    }

    private fun onSetTheme(call: MethodCall) {}

    private fun onSetSandbox(call: MethodCall, result: MethodChannel.Result) {
        val isSandbox = call.argument<Boolean>(KevinMethodArguments.sandbox) ?: false
        Kevin.setSandbox(isSandbox)
        result.success(null)
    }

    private fun onSetDeepLinkingEnabled(call: MethodCall, result: MethodChannel.Result) {
        val isDeepLinkingEnabled =
            call.argument<Boolean>(KevinMethodArguments.deepLinkingEnabled) ?: false
        Kevin.setDeepLinkingEnabled(isDeepLinkingEnabled)
        result.success(null)
    }
}