#import "BabylonnativePlugin.h"

@implementation BabylonnativePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"babylonnative"
            binaryMessenger:[registrar messenger]];
  BabylonnativePlugin* instance = [[BabylonnativePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];

  NativeViewFactory* factory =
      [[NativeViewFactory alloc] initWithMessenger:registrar.messenger];
  [registrar registerViewFactory:factory withId:@"BabylonNative"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
