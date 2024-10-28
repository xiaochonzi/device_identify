import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_identify_method_channel.dart';

abstract class DeviceIdentifyPlatform extends PlatformInterface {
  /// Constructs a DeviceIdentifyPlatform.
  DeviceIdentifyPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceIdentifyPlatform _instance = MethodChannelDeviceIdentify();

  /// The default instance of [DeviceIdentifyPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceIdentify].
  static DeviceIdentifyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceIdentifyPlatform] when
  /// they register themselves.
  static set instance(DeviceIdentifyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> register() async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// 获取安卓ID，可能为空
  Future<String?> getAndroidID() async {
    throw UnimplementedError('getAndroidID() has not been implemented.');
  }

  /// 获取IMEI，只支持Android 10之前的系统，需要READ_PHONE_STATE权限，可能为空
  Future<String?> getIMEI() async {
    throw UnimplementedError('getIMEI() has not been implemented.');
  }

  /// 获取OAID/AAID，可能为空
  Future<String?> getOaid() async {
    throw UnimplementedError('getOaid() has not been implemented.');
  }

  /// 获取UA
  Future<String?> getUA() async {
    throw UnimplementedError('getUA() has not been implemented.');
  }
}
