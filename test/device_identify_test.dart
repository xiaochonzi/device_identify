import 'package:flutter_test/flutter_test.dart';
import 'package:device_identify/device_identify.dart';
import 'package:device_identify/device_identify_platform_interface.dart';
import 'package:device_identify/device_identify_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceIdentifyPlatform
    with MockPlatformInterfaceMixin
    implements DeviceIdentifyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getAndroidID() {
    // TODO: implement getAndroidID
    throw UnimplementedError();
  }

  @override
  Future<String?> getIMEI() {
    // TODO: implement getIMEI
    throw UnimplementedError();
  }

  @override
  Future<String?> getOaid() {
    // TODO: implement getOaid
    throw UnimplementedError();
  }

  @override
  Future<String?> getUA() {
    // TODO: implement getUA
    throw UnimplementedError();
  }

  @override
  Future<void> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}

void main() {
  final DeviceIdentifyPlatform initialPlatform = DeviceIdentifyPlatform.instance;

  test('$MethodChannelDeviceIdentify is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceIdentify>());
  });

  test('getPlatformVersion', () async {
    DeviceIdentify deviceIdentifyPlugin = DeviceIdentify();
    MockDeviceIdentifyPlatform fakePlatform = MockDeviceIdentifyPlatform();
    DeviceIdentifyPlatform.instance = fakePlatform;

    expect(await deviceIdentifyPlugin.getPlatformVersion(), '42');
  });
}
