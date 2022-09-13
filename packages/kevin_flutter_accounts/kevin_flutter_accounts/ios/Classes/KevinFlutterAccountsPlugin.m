#import "KevinFlutterAccountsPlugin.h"
#if __has_include(<kevin_flutter_accounts/kevin_flutter_accounts-Swift.h>)
#import <kevin_flutter_accounts/kevin_flutter_accounts-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "kevin_flutter_accounts-Swift.h"
#endif

@implementation KevinFlutterAccountsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKevinFlutterAccountsPlugin registerWithRegistrar:registrar];
}
@end
