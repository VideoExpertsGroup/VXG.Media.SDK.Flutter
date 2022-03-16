// @dart=2.12


import 'dart:async';
import 'package:com_vxg_plugin_playersdk/playersdkcommon.dart';
import 'package:com_vxg_plugin_playersdk/playersdkconfig.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

// typedef void PlayerSDKViewCreatedCallback(PlayerSDKController controller);
//
// class PlayerSDK extends StatefulWidget {
//
//   final PlayerSDKViewCreatedCallback onPlayerSDKCreated;
//
//   PlayerSDK(this.onPlayerSDKCreated);
//
//   @override
//   _NativePlayerSDKState createState() => _NativePlayerSDKState();
// }
//
// class _NativePlayerSDKState extends State<PlayerSDK> {
//
//   // This is used in the platform side to register the view.
//   final String viewType = 'playersdk';
//
//   @override
//   Widget build(BuildContext context) {
//     if(defaultTargetPlatform == TargetPlatform.android) {
//       // Virtual Display variant
//       // return AndroidView(
//       //   viewType: 'playersdk',
//       //   onPlatformViewCreated: onPlatformViewCreated,
//       //   creationParamsCodec: const StandardMessageCodec(),
//       // );
//
//       // Hybrid variant
//       // Pass parameters to the platform side.
//       final Map<String, dynamic> creationParams = <String, dynamic>{};
//       return PlatformViewLink(
//         viewType: viewType,
//         surfaceFactory:
//             (BuildContext context, PlatformViewController controller) {
//           return AndroidViewSurface(
//             controller: controller as AndroidViewController,
//             gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
//             hitTestBehavior: PlatformViewHitTestBehavior.opaque,
//           );
//         },
//         onCreatePlatformView: (PlatformViewCreationParams params) {
//           return PlatformViewsService.initSurfaceAndroidView(
//             id: params.id,
//             viewType: viewType,
//             layoutDirection: TextDirection.ltr,
//             creationParams: creationParams,
//             creationParamsCodec: StandardMessageCodec(),
//           )
//           ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
//           ..addOnPlatformViewCreatedListener((int id) {
//             if (onPlatformViewCreated == null) {
//               return;
//             }
//             onPlatformViewCreated(id);
//           })
//           ..create();
//         },
//       );
//
//     } else if(defaultTargetPlatform == TargetPlatform.iOS) {
//       return UiKitView(
//         viewType: viewType,
//         onPlatformViewCreated: onPlatformViewCreated,
//         creationParamsCodec: const StandardMessageCodec(),
//       );
//     }
//
//     return new Text('$defaultTargetPlatform is not yet supported by this plugin');
//   }
//
//   Future<void> onPlatformViewCreated(id) async {
//     if (widget.onPlayerSDKCreated == null) {
//       return;
//     }
//     widget.onPlayerSDKCreated(new PlayerSDKController.init(id));
//   }
//
// }
//
// typedef StatusHandler = int Function(PlayerSDKNotifyCodes status);
//
// class PlayerSDKController {
//
//   late MethodChannel _channel;
//   StatusHandler? statusHandler;
//
//   PlayerSDKController.init(int id) {
//     _channel =  new MethodChannel('playersdk_$id');
//     _channel.setMethodCallHandler(platformCallHandler);
//   }
//
//   Future<void> open(PlayerSDKConfig config, StatusHandler? callbackStatus) async {
//     this.statusHandler = callbackStatus;
//     return _channel.invokeMethod('open', {'config': config.toMap()});
//   }
//
//   Future<void> close() async {
//     return _channel.invokeMethod('close');
//   }
//
//   Future platformCallHandler(MethodCall call) async {
//     switch (call.method) {
//       case 'onStatus':
//         if (statusHandler != null) {
//           //final args = call.arguments as Map<String, dynamic>;
//           print('PlayerSDK: onStatus: ${call.arguments['status']}');
//           statusHandler!(
//             PlayerSDKNotifyCodes.forValue(call.arguments['status']!),
//           );
//         }
//         break;
//       default:
//         print('Unknowm method ${call.method}');
//     }
//   }
//
// }

typedef void PlayerSDKViewViewCreatedCallback(PlayerSDKViewController controller);
typedef void PlayerSDKViewViewAttachedCallback();

class PlayerSDKView extends StatefulWidget {

  final PlayerSDKViewViewCreatedCallback onPlayerSDKViewCreated;
  final PlayerSDKViewViewAttachedCallback onPlayerSDKViewAttached;

  PlayerSDKView(Key key, this.onPlayerSDKViewCreated, this.onPlayerSDKViewAttached) : super(key: key);

  @override
  NativePlayerSDKViewState createState() => NativePlayerSDKViewState();
}

class NativePlayerSDKViewState extends State<PlayerSDKView> {

  // This is used in the platform side to register the view.
  final String viewType = 'playersdkview';
  late PlayerSDKViewController controller;

  var commandPipe = const MethodChannel('playersdkview/commandPipe');

  @override
  void initState() {
    print('TestPlugin: _NativePlayerSDKViewState: initState');
    commandPipe.setMethodCallHandler((call) async {
      if (call.method == 'attached') {
        print('TestPlugin: _NativePlayerSDKViewState: commandPipe: attached');
        widget.onPlayerSDKViewAttached();
      } else if (call.method == 'getViewType') {
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    print('TestPlugin: _NativePlayerSDKViewState: dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.android) {
      print('TestPlugin: _NativePlayerSDKViewState: create view');
      // Virtual Display variant
      // return AndroidView(
      //   viewType: 'cloudplayerview',
      //   onPlatformViewCreated: onPlatformViewCreated,
      //   creationParamsCodec: const StandardMessageCodec(),
      // );

      // Hybrid variant
      // Pass parameters to the platform side.
      final Map<String, dynamic> creationParams = <String, dynamic>{};
      return PlatformViewLink(
        viewType: viewType,
        surfaceFactory:
            (BuildContext context, PlatformViewController controller) {
          return AndroidViewSurface(
            controller: controller as AndroidViewController,
            gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          );
        },
        onCreatePlatformView: (PlatformViewCreationParams params) {
          //SystemChannels.platform_views.invokeMethod<void>('synchronizeToNativeViewHierarchy',yes);
          PlatformViewsService.synchronizeToNativeViewHierarchy(true);
          return PlatformViewsService.initSurfaceAndroidView(
            id: params.id,
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: creationParams,
            creationParamsCodec: StandardMessageCodec(),
          )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..addOnPlatformViewCreatedListener((int id) {
              print('TestPlugin: _NativePlayerSDKViewState: addOnPlatformViewCreatedListener');
              if (onPlatformViewCreated == null) {
                return;
              }
              onPlatformViewCreated(id);
            })
            ..create();
        },
      );

    } else if(defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: viewType,
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }

    return new Text('$defaultTargetPlatform is not yet supported by this plugin');
  }

  Future<void> onPlatformViewCreated(id) async {
    print('TestPlugin: _NativePlayerSDKViewState: onPlatformViewCreated');
    if (widget.onPlayerSDKViewCreated == null) {
      return;
    }
    controller = new PlayerSDKViewController.init(id);
    widget.onPlayerSDKViewCreated(controller);
  }

  Future<void> update() async {
    setState(() {
      print('TestPlugin: _NativePlayerSDKViewState: update');
    });
  }

}

typedef StatusHandler = int Function(PlayerSDKNotifyCodes status);

class PlayerSDKViewController {

  late MethodChannel _channel;
  StatusHandler? statusHandler;

  PlayerSDKViewController.init(int id) {
    _channel =  new MethodChannel('playersdkview_$id');
    _channel.setMethodCallHandler(platformCallHandler);
  }

  Future<void> open(PlayerSDKConfig config, StatusHandler? callbackStatus) async {
    this.statusHandler = callbackStatus;
    return _channel.invokeMethod('open', {'config': config.toMap()});
  }

  Future<void> close() async {
    return _channel.invokeMethod('close');
  }

  Future<void> handleZoom(bool isGrow) async {
    return _channel.invokeMethod('handleZoom', {'isGrow': isGrow ? 1 : 0});
  }

  Future<void> handleDoubleTap() async {
    return _channel.invokeMethod('handleDoubleTap');
  }

  Future<void> handleMoveContinue(int x, int y) async {
    return _channel.invokeMethod('handleMoveContinue', {'x': x, 'y': y});
  }

  Future<void> handleTouchBegin(int x, int y) async {
    return _channel.invokeMethod('handleTouchBegin', {'x': x, 'y': y});
  }

  Future<void> handleTouchEnd(int x, int y) async {
    return _channel.invokeMethod('handleTouchEnd', {'x': x, 'y': y});
  }

  Future platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'onStatus':
        if (statusHandler != null) {
          //final args = call.arguments as Map<String, dynamic>;
          print('PlayerSDK: onStatus: ${call.arguments['status']}');
          statusHandler!(
            PlayerSDKNotifyCodes.forValue(call.arguments['status']!),
          );
        }
        break;
      default:
        print('Unknowm method ${call.method}');
    }
  }

}
