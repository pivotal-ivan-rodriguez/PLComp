#import "ExtensionDelegate.h"
#import "ConnectivityManager.h"

@implementation ExtensionDelegate

- (void)applicationDidFinishLaunching {
    [[ConnectivityManager sharedInstance] setup];
}

- (void)applicationDidBecomeActive {
}

- (void)applicationWillResignActive {
}

@end