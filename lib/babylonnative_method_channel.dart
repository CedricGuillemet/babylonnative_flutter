import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'babylonnative_platform_interface.dart';

/// An implementation of [BabylonnativePlatform] that uses method channels.
class MethodChannelBabylonnative extends BabylonnativePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('babylonnative');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
