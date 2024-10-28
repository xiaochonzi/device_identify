package org.github.device_identify;

import android.app.Application;
import android.content.Context;

import androidx.annotation.NonNull;

import com.github.gzuliyujiang.oaid.DeviceID;
import com.github.gzuliyujiang.oaid.DeviceIdentifier;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** DeviceIdentifyPlugin */
public class DeviceIdentifyPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "device_identify");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }else if(call.method.equals("register")){
      DeviceIdentifier.register((Application)context);
    } else if(call.method.equals("getUA")){
      String ua = System.getProperty("http.agent");
      result.success(ua);
    } else if(call.method.equals("getOaid")){
      if(DeviceID.supportedOAID(context)){
        String oaid = DeviceIdentifier.getOAID(context);
        result.success(oaid);
      }else{
        result.success(null);
      }
    } else if(call.method.equals("getIMEI")){
      String imei = DeviceIdentifier.getIMEI(context);
      result.success(imei);
    } else if(call.method.equals("getAndroidID")){
      String androidId = DeviceIdentifier.getAndroidID(context);
      result.success(androidId);
      DeviceIdentifier.getClientId();
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
