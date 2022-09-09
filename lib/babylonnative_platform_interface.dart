import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'babylonnative_method_channel.dart';

abstract class BabylonnativePlatform extends PlatformInterface {
  /// Constructs a BabylonnativePlatform.
  BabylonnativePlatform() : super(token: _token);

  static final Object _token = Object();

  static BabylonnativePlatform _instance = MethodChannelBabylonnative();

  /// The default instance of [BabylonnativePlatform] to use.
  ///
  /// Defaults to [MethodChannelBabylonnative].
  static BabylonnativePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BabylonnativePlatform] when
  /// they register themselves.
  static set instance(BabylonnativePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
