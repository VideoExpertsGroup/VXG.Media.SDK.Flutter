package vxg.playersdk

import io.flutter.plugin.common.PluginRegistry.Registrar

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import vxg.playersdk.PlayerSDKFactory

import android.app.Activity

//import com.vxg.cloudsdk.CloudSDK;
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

/** PlayerSDKPlugin */
//class PlayerSDKPlugin {
//  companion object {
//    @JvmStatic
//    fun registerWith(registrar: Registrar): Unit {
//      registrar.platformViewRegistry().registerViewFactory( "playersdk", PlayerSDKFactory(registrar))
//    }
//  }
//}

class PlayerSDKPlugin: FlutterPlugin, ActivityAware {
  private var factory: PlayerSDKFactory? = null

  private var methodChannel: MethodChannel? = null

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar): Unit {
      println("PlayerSDKPlugin: registerWith")
      registrar.platformViewRegistry().registerViewFactory("playersdkview", PlayerSDKFactory(registrar))
    }
  }

  // Version 2 of plugin creation
  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    println("PlayerSDKPlugin: onAttachedToEngine")
    factory = PlayerSDKFactory(binding.applicationContext, binding.binaryMessenger)
    binding.platformViewRegistry.registerViewFactory("playersdkview", factory)
    methodChannel = MethodChannel(binding.binaryMessenger, "playersdkview/commandPipe")

  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    println("TestPlugin: PlayerSDKPlugin: onDetachedFromEngine")
  }

  override fun onDetachedFromActivity() {
    println("PlayerSDKPlugin: onDetachedFromActivity")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    println("PlayerSDKPlugin: onReattachedToActivityForConfigChanges")
    onAttachedToActivity(binding);
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    println("PlayerSDKPlugin: onAttachedToActivity")
    factory!!.context = binding.activity
    methodChannel!!.invokeMethod("attached", null)
    //CloudSDK.setContext(binding.activity)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    println("PlayerSDKPlugin: onDetachedFromActivityForConfigChanges")
    onDetachedFromActivity();
  }
}
