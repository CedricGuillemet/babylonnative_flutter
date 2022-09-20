import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:babylonnative/babylonnative.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _babylonnativePlugin = Babylonnative();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _babylonnativePlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'BabylonNative';
    // Pass parameters to the platform side.
    const Map<String, dynamic> creationParams = <String, dynamic>{};

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter BabylonNative'),
        ),
        body: PlatformViewLink(
          viewType: viewType,
          surfaceFactory: (context, controller) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers: const <
                  Factory<OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
          onCreatePlatformView: (params) {
            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
              onFocus: () {
                params.onFocusChanged(true);
              },
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..create();
          },
        ),
      ),
    );
  }
  /*
  Widget build(BuildContext context) {
	  

	  return PlatformViewLink(
		viewType: viewType,
		surfaceFactory:
			(context, controller) {
		  return AndroidViewSurface(
			controller: controller as AndroidViewController,
			gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
			hitTestBehavior: PlatformViewHitTestBehavior.opaque,
		  );
		},
		onCreatePlatformView: (params) {
		  return PlatformViewsService.initSurfaceAndroidView(
			id: params.id,
			viewType: viewType,
			layoutDirection: TextDirection.ltr,
			creationParams: creationParams,
			creationParamsCodec: const StandardMessageCodec(),
			onFocus: () {
			  params.onFocusChanged(true);
			},
		  )
			..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
			..create();
		},
	  );
	}*/
}
