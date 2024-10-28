import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_identify_platform_interface.dart';

/// An implementation of [DeviceIdentifyPlatform] that uses method channels.
class MethodChannelDeviceIdentify extends DeviceIdentifyPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('device_identify');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<void> register() async {
    await methodChannel.invokeMethod<String>('register');
  }

  @override
  Future<String?> getUA() async {
    final version = await methodChannel.invokeMethod<String>('getUA');
    return version;
  }

  @override
  Future<String?> getOaid() async{
    final version = await methodChannel.invokeMethod<String>('getOaid');
    return version;
  }

  @override
  Future<String?> getIMEI() async{
    final version = await methodChannel.invokeMethod<String>('getIMEI');
    return version;
  }

  @override
  Future<String?> getAndroidID() async{
    final version = await methodChannel.invokeMethod<String>('getAndroidID');
    return version;
  }
}
