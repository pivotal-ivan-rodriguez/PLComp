#import "InterfaceController.h"
#import "ConnectivityManager.h"

@interface InterfaceController() <ConnectivityManagerDelegate>

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *contextLabel;

@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [[ConnectivityManager sharedInstance] setDelegate:self];
}

- (void)willActivate {
    [super willActivate];
    
    NSDictionary *context = [[ConnectivityManager sharedInstance] receivedApplicationContext];
    NSString *text = context[@"text"];
    if (text) {
        [self.contextLabel setText:text];
    }
}

- (void)didDeactivate {
    [super didDeactivate];
}

- (void)didReceiveContext:(NSDictionary *)context {
    NSString *text = context[@"text"];
    if (text) {
        [self.contextLabel setText:text];
    }
}

@end