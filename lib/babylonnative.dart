
import 'babylonnative_platform_interface.dart';

class Babylonnative {
  Future<String?> getPlatformVersion() {
    return BabylonnativePlatform.instance.getPlatformVersion();
  }
}
