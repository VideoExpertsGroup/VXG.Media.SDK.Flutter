#import "PlayerSDKPlugin.h"
#if __has_include(<com_vxg_plugin_playersdk/com_vxg_plugin_playersdk-Swift.h>)
#import <com_vxg_plugin_playersdk/com_vxg_plugin_playersdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "com_vxg_plugin_playersdk-Swift.h"
#endif

#import "PlayerSDK.h"
@implementation PlayerSDKPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  //[SwiftPlayerSDKPlugin registerWithRegistrar:registrar];
  PlayerSDKFactory* factory =
      [[PlayerSDKFactory alloc] initWithMessenger:registrar.messenger];
  [registrar registerViewFactory:factory withId:@"playersdkview"];
}
@end
