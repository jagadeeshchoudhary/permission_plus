// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

import 'permission_plus_platform_interface.dart';

/// A web implementation of the PermissionPlusPlatform of the PermissionPlus plugin.
class PermissionPlusWeb extends PermissionPlusPlatform {
  /// Constructs a PermissionPlusWeb
  PermissionPlusWeb();

  static void registerWith(Registrar registrar) {
    PermissionPlusPlatform.instance = PermissionPlusWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }
}
