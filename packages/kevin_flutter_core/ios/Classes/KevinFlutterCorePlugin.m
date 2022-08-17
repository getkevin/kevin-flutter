#import "KevinFlutterCorePlugin.h"
#if __has_include(<kevin_flutter_core/kevin_flutter_core-Swift.h>)
#import <kevin_flutter_core/kevin_flutter_core-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "kevin_flutter_core-Swift.h"
#endif

@implementation KevinFlutterCorePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKevinFlutterCorePlugin registerWithRegistrar:registrar];
}
@end
