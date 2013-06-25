#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import <extThree20JSON/extThree20JSON.h>

#import "SWUtils.h"
#import "RegisterViewController.h"
#import "ZheliURLRequest.h"
#import "SWLocation.h"

//#import "WBConnect.h"

@interface LoginViewController : TTViewController 
                                <UITextFieldDelegate> {
    UINavigationController * navController;
    
    UITextField * txtName;
    UITextField * txtPassword;
    
    UILabel * lbAutoLogin;
    UILabel * lbAutoSave;
    
    UISwitch * swcAutoLogin;
    UISwitch * swcAutoSave;
    
    UIButton * btWeibo;
    
    SWLocation * sw;
//    WeiBo * weibo;
}

@property (nonatomic, retain) UITextField * txtName;
@property (nonatomic, retain) UITextField * txtPassword;

- (void) pageJump;
- (id) initWithNavController:(UINavigationController *)nav;

- (IBAction) login:(id)sender;
- (IBAction) regist:(id)sender;
- (IBAction) autoLoginSetted:(id)sender;

@end
