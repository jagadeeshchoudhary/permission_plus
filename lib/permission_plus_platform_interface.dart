import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'permission_plus_method_channel.dart';

abstract class PermissionPlusPlatform extends PlatformInterface {
  /// Constructs a PermissionPlusPlatform.
  PermissionPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static PermissionPlusPlatform _instance = MethodChannelPermissionPlus();

  /// The default instance of [PermissionPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelPermissionPlus].
  static PermissionPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PermissionPlusPlatform] when
  /// they register themselves.
  static set instance(PermissionPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
