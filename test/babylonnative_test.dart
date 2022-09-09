import 'package:flutter_test/flutter_test.dart';
import 'package:babylonnative/babylonnative.dart';
import 'package:babylonnative/babylonnative_platform_interface.dart';
import 'package:babylonnative/babylonnative_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBabylonnativePlatform
    with MockPlatformInterfaceMixin
    implements BabylonnativePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BabylonnativePlatform initialPlatform = BabylonnativePlatform.instance;

  test('$MethodChannelBabylonnative is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBabylonnative>());
  });

  test('getPlatformVersion', () async {
    Babylonnative babylonnativePlugin = Babylonnative();
    MockBabylonnativePlatform fakePlatform = MockBabylonnativePlatform();
    BabylonnativePlatform.instance = fakePlatform;

    expect(await babylonnativePlugin.getPlatformVersion(), '42');
  });
}
