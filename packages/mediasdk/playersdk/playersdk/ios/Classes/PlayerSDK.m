#import "PlayerSDK.h"
#import "MediaPlayerSDK.xcframework/ios-arm64_arm64e_armv7_armv7s/MediaPlayerSDK.framework/Headers/MediaPlayer.h"
#import "MediaPlayerSDK.xcframework/ios-arm64_arm64e_armv7_armv7s/MediaPlayerSDK.framework/Headers/MediaPlayerConfig.h"

@implementation PlayerSDKFactory {
    NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    self = [super init];
    if (self) {
        _messenger = messenger;
    }
    return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args {
    PlayerSDKController* controller = [[PlayerSDKController alloc] initWithWithFrame:frame
                                           viewIdentifier:viewId
                                                arguments:args
                                          binaryMessenger:_messenger];
    return controller;
}

@end

@interface PlayerSDKController () <MediaPlayerCallback> {
}
@end

@implementation PlayerSDKController {
    MediaPlayer* player;
    int64_t _viewId;
    FlutterMethodChannel* _channel;
}

- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    if ([super init]) {
        _viewId = viewId;
        player = [[MediaPlayer alloc] initWithBounds:CGRectMake( 0, 0, 100, 100 ) andGraphicLayer:GRAPHIC_METAL];

        NSString* channelName = [NSString stringWithFormat:@"playersdkview_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        //NSObject<FlutterTaskQueue>* taskQueue = [messenger makeBackgroundTaskQueue];
        //_channel = [[FlutterMethodChannel alloc] initWithName:channelName
        //                                      binaryMessenger:messenger
        //                                                codec:[FlutterStandardMethodCodec sharedInstance]
        //                                            taskQueue:taskQueue];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
            [weakSelf onMethodCall:call result:result];
        }];
    }
    return self;
}

- (UIView*)view {
    return [player contentView];
}

// entry point for channel
- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([[call method] isEqualToString:@"open"]) {
        [self open:call result:result];
    } else if ([[call method] isEqualToString:@"close"]) {
        [self onClose:call result:result];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

// methods
- (void)open:(FlutterMethodCall*)call result:(FlutterResult)result {
    if (![self open:call.arguments]) {
        result([FlutterError errorWithCode:@"open"
                                   message:@"Failed parsing the URL"
                                   details:[NSString stringWithFormat:@"URL was: '%@'", "x"]]);
    } else {
        result(nil);
    }
}

- (void)onClose:(FlutterMethodCall*)call result:(FlutterResult)result {
    [self close];
    result(nil);
}

- (bool) open:(NSDictionary*)config {
    NSDictionary* mapConfig = config[@"config"];

    MediaPlayerConfig* conf = [[MediaPlayerConfig alloc] init];
    conf.connectionUrl = mapConfig[@"connectionUrl"];
    conf.connectionDetectionTime = [mapConfig[@"connectionDetectionTime"] integerValue];
    conf.connectionBufferingTime = [mapConfig[@"connectionBufferingTime"] integerValue];
    conf.decodingType = [mapConfig[@"decodingType"] integerValue];
    conf.synchroEnable = [mapConfig[@"synchroEnable"] integerValue];
    conf.synchroNeedDropVideoFrames = [mapConfig[@"synchroNeedDropVideoFrames"] integerValue];
    conf.aspectRatioMode = [mapConfig[@"aspectRatioMode"] integerValue];
    conf.licenseKey = mapConfig[@"licenseKey"];

    //conf.enableInternalGestureRecognizers = [mapConfig[@"enableInternalGestureRecognizers"] integerValue];

    [player Open:conf callback:self];
    return true;
}

- (void) close {
    [player Close];
}

- (int) Status: (MediaPlayer*)player1 args: (int)arg {
    NSLog(@"PlayerSDKController: Status called: arg code is %d for instance %@", arg, player1);
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInt:arg] forKey:@"status"];
    [_channel invokeMethod:@"onStatus" arguments:params result:^(id _Nullable result) { }];
    return 0;
}

-(int) OnReceiveData: (MediaPlayer*)player
              buffer: (void*)buffer
                size: (int) size
                 pts: (long) pts {
    NSLog(@"PlayerSDKController: OnReceiveData called");
    return 0;
}

@end
