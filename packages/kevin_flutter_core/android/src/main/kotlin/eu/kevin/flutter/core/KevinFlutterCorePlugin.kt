package eu.kevin.flutter.core

import android.app.Activity
import androidx.annotation.NonNull
import eu.kevin.core.plugin.Kevin
import eu.kevin.flutter.core.model.KevinMethod
import eu.kevin.flutter.core.model.KevinMethodArguments
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import java.util.Locale

class KevinFlutterCorePlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel

    private var activity: Activity? = null

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
            KevinMethod.SET_THEME -> onSetTheme(call, result)
            KevinMethod.SET_SANDBOX -> onSetSandbox(call, result)
            KevinMethod.SET_DEEP_LINKING_ENABLED -> onSetDeepLinkingEnabled(call, result)
            KevinMethod.GET_LOCALE -> onGetLocale(result)
            KevinMethod.IS_SANDBOX -> onIsSandbox(result)
            KevinMethod.IS_DEEP_LINKING_ENABLED -> onIsDeepLinkingEnabled(result)
            else -> result.notImplemented()
        }
    }

    private fun onSetLocale(call: MethodCall, result: MethodChannel.Result) {
        val lang = call.argument<String>(KevinMethodArguments.languageCode)
        val locale = lang?.let { Locale(it) }
        Kevin.setLocale(locale)
        result.success(null)
    }

    private fun onSetTheme(call: MethodCall, result: MethodChannel.Result) {
        val activity = this.activity
        val themeName = call.argument<String>(KevinMethodArguments.themeAndroid)

        if (activity == null || themeName == null) {
            result.success(false)
            return
        }

        val resourceId =
            activity.resources?.getIdentifier(themeName, "style", activity.packageName)

        if (resourceId?.equals(0) == false) {
            Kevin.setTheme(resourceId)
            result.success(true)
            return
        }

        result.success(false)
    }

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

    private fun onGetLocale(result: MethodChannel.Result) {
        val locale = Kevin.getLocale()?.toString()
        result.success(locale)
    }

    private fun onIsSandbox(result: MethodChannel.Result) {
        result.success(Kevin.isSandbox())
    }

    private fun onIsDeepLinkingEnabled(result: MethodChannel.Result) {
        result.success(Kevin.isDeepLinkingEnabled())
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }
}