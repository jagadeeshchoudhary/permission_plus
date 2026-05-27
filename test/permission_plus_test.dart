import 'package:flutter_test/flutter_test.dart';
import 'package:permission_plus/permission_plus.dart';
import 'package:permission_plus/permission_plus_platform_interface.dart';
import 'package:permission_plus/permission_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPermissionPlusPlatform
    with MockPlatformInterfaceMixin
    implements PermissionPlusPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PermissionPlusPlatform initialPlatform = PermissionPlusPlatform.instance;

  test('$MethodChannelPermissionPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPermissionPlus>());
  });

  test('getPlatformVersion', () async {
    PermissionPlus permissionPlusPlugin = PermissionPlus();
    MockPermissionPlusPlatform fakePlatform = MockPermissionPlusPlatform();
    PermissionPlusPlatform.instance = fakePlatform;

    expect(await permissionPlusPlugin.getPlatformVersion(), '42');
  });
}
