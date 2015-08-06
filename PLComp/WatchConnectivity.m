#import "WatchConnectivity.h"

@import WatchConnectivity;

@interface WatchConnectivity () <WCSessionDelegate>

@end

@implementation WatchConnectivity

#pragma mark - Public

+ (instancetype)sharedInstance {
    static WatchConnectivity *sharedInstance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [WatchConnectivity new];
    });
    
    return sharedInstance;
}

- (void)setup {
    WCSession *session = [WCSession defaultSession];
    session.delegate = self;
    [session activateSession];
}

- (void)updateApplicationContext:(NSDictionary *)context {
    WCSession *session = [WCSession defaultSession];
    @try {
        NSError *error = nil;
        [session updateApplicationContext:context error:&error];
        
    } @catch (NSException *exception) {
        //handle error
    }
}

- (NSDictionary *)receivedApplicationContext {
    WCSession *session = [WCSession defaultSession];
    return session.receivedApplicationContext;
}

#pragma mark - <WCSessionDelegate>

- (void)sessionWatchStateDidChange:(WCSession *)session {
    
}

@end