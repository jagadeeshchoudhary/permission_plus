import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'permission_plus_platform_interface.dart';

/// An implementation of [PermissionPlusPlatform] that uses method channels.
class MethodChannelPermissionPlus extends PermissionPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('permission_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
