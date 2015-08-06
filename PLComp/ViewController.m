#import "ViewController.h"
#import "WatchConnectivity.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - <UITextFieldDelegate>

- (void)textFieldDidBeginEditing:(nonnull UITextField *)textField {
    
}

- (void)textFieldDidEndEditing:(nonnull UITextField *)textField {
    if (textField.text.length > 0) {
        [[WatchConnectivity sharedInstance] updateApplicationContext:@{@"text":textField.text}];
    }
}

@end