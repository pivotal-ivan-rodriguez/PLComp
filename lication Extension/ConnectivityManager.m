#import "ConnectivityManager.h"

@import WatchConnectivity;

@interface ConnectivityManager () <WCSessionDelegate>

@end

@implementation ConnectivityManager

#pragma mark - Public

+ (instancetype)sharedInstance {
    static ConnectivityManager *sharedInstance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [ConnectivityManager new];
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
    //handle session state
}

- (void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *, id> *)applicationContext {
    NSLog(@"Received context %@",applicationContext);
    if ([self.delegate conformsToProtocol:@protocol(ConnectivityManagerDelegate)]) {
        [self.delegate didReceiveContext:applicationContext];
    }
}

@end