#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import <extThree20JSON/extThree20JSON.h>

#import "ZheliURLRequest.h"

@interface RegisterViewController : TTTableViewController{
    
    TTListDataSource *registerDataSource;
    
    UITextField* registerNameTextField;
    TTTableControlItem* registerNameItem;
    
    UITextField* registerPasswordTextField;
    TTTableControlItem* registerPasswordItem;
    
    UITextField* registerConfirmPasswordTextField;
    TTTableControlItem* registerConfirmPasswordItem;
    
    UITextField* emailTextField;
    TTTableControlItem* emailItem;    
}

@end
