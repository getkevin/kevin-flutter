#import "KevinFlutterAccountsPlugin.h"
#if __has_include(<kevin_flutter_accounts_ios/kevin_flutter_accounts_ios-Swift.h>)
#import <kevin_flutter_accounts_ios/kevin_flutter_accounts_ios-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "kevin_flutter_accounts_ios-Swift.h"
#endif

@implementation KevinFlutterAccountsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKevinFlutterAccountsPlugin registerWithRegistrar:registrar];
}
@end
