
import 'dart:io';

import 'device_identify_platform_interface.dart';

class DeviceIdentify {
  /// 判断是否是安卓平台
  static bool get isAndroid {
    return Platform.isAndroid;
  }

  Future<void> register() async {
    DeviceIdentifyPlatform.instance.register();
  }

  /// 获取安卓ID，可能为空
  Future<String?> getAndroidID() async {
    return DeviceIdentifyPlatform.instance.getAndroidID();
  }

  /// 获取IMEI，只支持Android 10之前的系统，需要READ_PHONE_STATE权限，可能为空
  Future<String?> getIMEI() async {
    return DeviceIdentifyPlatform.instance.getIMEI();
  }

  /// 获取OAID/AAID，可能为空
  Future<String?>  getOaid() async {
    return DeviceIdentifyPlatform.instance.getOaid();
  }

  /// 获取UA
  Future<String?> getUA() async {
    return DeviceIdentifyPlatform.instance.getUA();
  }

  Future<String?> getPlatformVersion() {
    return DeviceIdentifyPlatform.instance.getPlatformVersion();
  }
}
