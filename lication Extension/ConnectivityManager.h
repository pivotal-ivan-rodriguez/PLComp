#import <Foundation/Foundation.h>

@protocol ConnectivityManagerDelegate <NSObject>
- (void)didReceiveContext:(NSDictionary *)context;
@end

@interface ConnectivityManager : NSObject

+ (instancetype)sharedInstance;

- (void)setup;
- (NSDictionary *)receivedApplicationContext;

@property (nonatomic, weak) id<ConnectivityManagerDelegate> delegate;

@end