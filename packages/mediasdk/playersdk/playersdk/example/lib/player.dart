import 'package:vxg_playersdk/playersdk.dart';
import 'package:vxg_playersdk/playersdkcommon.dart';
import 'package:vxg_playersdk/playersdkconfig.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PlayerView extends StatefulWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> with WidgetsBindingObserver {

  PlayerSDKViewController? controller;
  bool isLoading = false;

  bool _isControlsVisible = true;
  bool _isError = false;
  String _statusText = "";

  double _scaleFactor = 1.0;
  final double _baseScaleFactor = 1.0;

  bool _isTouchMoved = false;
  bool _isTouchDouble = false;
  Duration _lastPointerDown = const Duration();

  PlayerSDKView? playersdk;

  final GlobalKey<NativePlayerSDKViewState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    playersdk = new PlayerSDKView(_key, onPlayerSDKViewCreated, onPlayerSDKViewAttached);
  }

  @override
  void dispose() {
    this.controller!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          if (Platform.isIOS)
            Listener(
              onPointerMove: (PointerEvent details) {
                print('TestPlugin: _PlayerViewState: Listener: onPointerMove: ${details.timeStamp.toString()}');
                _isTouchMoved = true;
              },
              onPointerDown: (PointerEvent details) {
                _isTouchMoved = false;
                var delta = (details.timeStamp - _lastPointerDown);
                _isTouchDouble = (delta.inMilliseconds <= 300);
                _lastPointerDown = details.timeStamp;
                print('TestPlugin: _PlayerViewState: Listener: onPointerDown: ${details.timeStamp.toString()}, delta: ${delta.inMilliseconds}, _isTouchDouble: $_isTouchDouble');
              },
              onPointerUp: (PointerEvent details) {
                print('TestPlugin: _PlayerViewState: Listener: onPointerUp: ${details.timeStamp.toString()}');
                if (!_isTouchDouble) {
                  Future.delayed(const Duration(milliseconds: 300), () {
                    setState(() {
                      print('TestPlugin: _PlayerViewState: Listener: onPointerUp: handle: _isTouchDouble: $_isTouchDouble');
                      if (!_isTouchMoved && !_isTouchDouble) {
                        _isControlsVisible = !_isControlsVisible;
                      }
                      _isTouchMoved = false;
                      _isTouchDouble = false;
                    });
                  });
                }
              },
              child: Stack(
                children: <Widget>[
                  playersdk!,
                  Container(
                    color: Colors.transparent,
                    constraints: _isControlsVisible ? const BoxConstraints.expand(height: kToolbarHeight * 2) : const BoxConstraints.expand(height: 0.0), // ← this guy
                    child: IgnorePointer(
                      ignoring: !_isControlsVisible,
                      child: AnimatedOpacity(
                        opacity: _isControlsVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 300),
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                          titleSpacing: 10.0,
                          title: Text("VXG PlayerSDK Test"),
                          centerTitle: true,
                          leading: InkWell(
                            onTap: () {
                              this.controller!.close();
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (Platform.isAndroid)
            Container(
              color: Colors.black,
              child: Stack(
                children: <Widget>[
                  playersdk!,
                  if (isLoading || _isError)
                    Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 120,
                          child: Column (
                            children: [
                              SizedBox(
                                width: 56,
                                height: 56,
                                child: isLoading ? CircularProgressIndicator() : Container(height: 0),
                              ),
                              Flexible(child: Container(height: 18)),
                              Expanded (
                                child: Text(_statusText,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  textWidthBasis: TextWidthBasis.longestLine,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: const TextStyle( color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        _isControlsVisible = !_isControlsVisible;
                      });
                    },
                    onDoubleTap: () {
                      this.controller!.handleDoubleTap();
                    },
                    child: Container(
                        color: Colors.transparent
                    ),
                ),
                ],
              ),
            ),
          if (Platform.isAndroid)
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  _isControlsVisible = !_isControlsVisible;
                });
              },
              onDoubleTap: () {
                this.controller!.handleDoubleTap();
              },
              onScaleStart: (details) {
                if (details.pointerCount == 1) {
                  this.controller!.handleTouchBegin(details.localFocalPoint.dx.toInt(), details.localFocalPoint.dy.toInt());
                  return;
                }
                _scaleFactor = _baseScaleFactor;
              },
              onScaleUpdate: (details) {
                if (details.pointerCount == 1) {
                  this.controller!.handleMoveContinue(details.localFocalPoint.dx.toInt(), details.localFocalPoint.dy.toInt());
                  return;
                }
                bool isGrow = details.scale > _scaleFactor;
                this.controller!.handleZoom(isGrow);
                _scaleFactor = details.scale;
              },
              onScaleEnd: (details) {
                if (details.pointerCount == 1) {
                  this.controller!.handleTouchEnd(0, 0);
                  return;
                }
                _scaleFactor = _baseScaleFactor;
              },
              child: AnimatedOpacity(
                opacity: _isControlsVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  titleSpacing: 10.0,
                  title: Text("VXG PlayerSDK Test"),
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      this.controller!.close();
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> onPlayerSDKViewAttached() async {
    print('onCloudPlayerViewAttached: start');
    //_onPlay();
  }

  void onPlayerSDKViewCreated(controller) {
    print('onCloudPlayerViewCreated: start');
    this.controller = controller;
    if (kIsWeb) {
    } else {
      _onPlay();

      setState(() {
        print('onCloudPlayerViewCreated: _isControlsVisible');
        _isControlsVisible = true;
      });
    }

  }

  void _onPlay() async {
    print('_onPlay: start getConfigAsMap');
    var url = "http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8";//widget.item.url;
    var lisenseKey = "";
    if (kIsWeb) {
    } else {
      if (Platform.isIOS) {
        //lisenceKey = Constants.iosLicenseKey;
      } else {
      }
    }

    var config = PlayerSDKConfig();
    config.connectionUrl = url;
    config.licenseKey = lisenseKey;
    config.decodingType = 1;
    config.aspectRatioMode = 4201;
    config.enableInternalGestureRecognizers = 1;
    this.controller?.open(config, (status) {
      print('onPlayerSDKCreated: onStatus: ${status.value}');
      switch (status) {
        case PlayerSDKNotifyCodes.CP_CONNECT_STARTING: {
          _statusText = "Connecting...";
          _isError = false;
          showProgress(true);
          break;
        }
        case PlayerSDKNotifyCodes.VRP_FIRSTFRAME: {
          _statusText = "";
          _isError = false;
          _isControlsVisible = false;
          showProgress(false);
          break;
        }

        case PlayerSDKNotifyCodes.CP_CONNECT_FAILED:
        case PlayerSDKNotifyCodes.PLP_BUILD_FAILED:
        case PlayerSDKNotifyCodes.PLP_PLAY_FAILED:
        case PlayerSDKNotifyCodes.PLP_ERROR:
        case PlayerSDKNotifyCodes.CP_ERROR_DISCONNECTED: {
          _statusText = "The source cannot be played";
          _isError = true;
          showProgress(false);
          break;
        }

        case PlayerSDKNotifyCodes.CP_ERROR_NODATA_TIMEOUT: {
          break;
        }
      }
      return 0;
    });
  }

  void _handleZoom(bool isGrow) async {
    if (!Platform.isAndroid) {
      return;
    }

    this.controller?.handleZoom(isGrow);
  }

  void _handleDoubleTap() async {
    if (!Platform.isAndroid) {
      return;
    }

    this.controller?.handleDoubleTap();
  }

  void _handleMoveContinue(int x, int y) async {
    if (!Platform.isAndroid) {
      return;
    }

    this.controller?.handleMoveContinue(x, y);
  }

  void _handleTouchBegin(int x, int y) async {
    if (!Platform.isAndroid) {
      return;
    }

    this.controller?.handleTouchBegin(x, y);
  }

  void _handleTouchEnd(int x, int y) async {
    if (!Platform.isAndroid) {
      return;
    }

    this.controller?.handleTouchEnd(x, y);
  }

  void showProgress(bool show) {
    isLoading = show;
    setState(() {
    });
  }
}
