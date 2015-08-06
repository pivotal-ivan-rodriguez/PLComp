#import <Foundation/Foundation.h>

@interface WatchConnectivity : NSObject

+ (instancetype)sharedInstance;

- (void)setup;
- (void)updateApplicationContext:(NSDictionary *)context;
- (NSDictionary *)receivedApplicationContext;

@end