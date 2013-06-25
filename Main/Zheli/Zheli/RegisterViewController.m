#import "RegisterViewController.h"


@implementation RegisterViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"注册";
        self.tableViewStyle = UITableViewStyleGrouped;
        self.autoresizesForKeyboard = YES;
        self.variableHeightRows = YES;
        //        self.tableView.style = UITableViewStyleGrouped;
    }
    return self;
}

- (void)dealloc{
    TT_RELEASE_SAFELY(registerDataSource);
    TT_RELEASE_SAFELY(registerNameTextField);
    TT_RELEASE_SAFELY(registerNameItem);
    TT_RELEASE_SAFELY(registerPasswordTextField);
    TT_RELEASE_SAFELY(registerPasswordItem);
    TT_RELEASE_SAFELY(registerConfirmPasswordTextField);
    TT_RELEASE_SAFELY(registerConfirmPasswordItem);
    TT_RELEASE_SAFELY(emailTextField);
    TT_RELEASE_SAFELY(emailItem);
    
    [super dealloc];
}

-(void)loadView{    
    [super loadView];
    
    // ******* prepared for regist *******
    
    registerNameTextField = [[UITextField alloc] init];
    registerNameTextField.placeholder = NSLocalizedString(@"在此输入真实姓名",nil);
    registerNameTextField.font = TTSTYLEVAR(font);
    registerNameItem = [[TTTableControlItem alloc] init];
    registerNameItem.caption = NSLocalizedString(@"真实姓名：",nil);
    registerNameItem.control = registerNameTextField;
    
    registerPasswordTextField = [[UITextField alloc] init];
    registerPasswordTextField.placeholder = NSLocalizedString(@"在此输入密码",nil);
    registerPasswordTextField.font = TTSTYLEVAR(font);
    registerPasswordTextField.secureTextEntry = YES;
    registerPasswordItem = [[TTTableControlItem alloc] init];
    registerPasswordItem.caption = NSLocalizedString(@"用户密码：",nil);
    registerPasswordItem.control = registerPasswordTextField;
    
    registerConfirmPasswordTextField = [[UITextField alloc] init];
    registerConfirmPasswordTextField.placeholder = NSLocalizedString(@"在此重复输入一遍密码",nil);
    registerConfirmPasswordTextField.font = TTSTYLEVAR(font);
    registerConfirmPasswordTextField.secureTextEntry = YES;
    registerConfirmPasswordItem = [[TTTableControlItem alloc] init];
    registerConfirmPasswordItem.caption = NSLocalizedString(@"密码确认：",nil);
    registerConfirmPasswordItem.control = registerConfirmPasswordTextField;
    
    emailTextField = [[UITextField alloc] init];
    emailTextField.placeholder = NSLocalizedString(@"在此输入登陆邮箱",nil);
    emailTextField.font = TTSTYLEVAR(font);
    emailItem = [[TTTableControlItem alloc] init];
    emailItem.caption = NSLocalizedString(@"邮箱地址：",nil);
    emailItem.control = emailTextField;
    
    // === test data ===
    
//    registerNameTextField.text = @"测试03";
//    registerPasswordTextField.text = @"123456";
//    registerConfirmPasswordTextField.text = @"123456";
//    emailTextField.text = @"test03@gmail.com";
    
    // ******* left button *******
    
    UIButton * cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 30)];
    
    [cancelButton setImage:[UIImage imageNamed:@"btCancel.png"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButton) forControlEvents:UIControlEventTouchUpInside]; 
    
    UIBarButtonItem * cancelItem = [[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    self.navigationItem.leftBarButtonItem = cancelItem;
    
    // ******* right button *******
    
    UIButton * registerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 30)];
    
    [registerButton setImage:[UIImage imageNamed:@"btSubmit.png"] forState:UIControlStateNormal];
    [registerButton setImage:[UIImage imageNamed:@"button_complete_down.png"] forState:UIControlStateHighlighted];
    [registerButton addTarget:self action:@selector(registerButton) forControlEvents:UIControlEventTouchUpInside]; 
    
    UIBarButtonItem * registerItem = [[UIBarButtonItem alloc] initWithCustomView:registerButton];
    self.navigationItem.rightBarButtonItem = registerItem;
    
    // ******* data source *******
    
    self.dataSource = [TTListDataSource dataSourceWithObjects:
                       emailItem, 
                       registerNameItem, 
                       registerPasswordItem, 
                       registerConfirmPasswordItem, 
                       nil];
}

- (IBAction) cancelButton{
    [self dismissModalViewControllerAnimated:YES];  
}

- (IBAction) registerButton{
    NSString * strName = registerNameTextField.text;
    NSString * strPassword = registerPasswordTextField.text;
    NSString * strConfirmPassword = registerConfirmPasswordTextField.text;
    NSString * strEmail = emailTextField.text;
    
    if ((strName == nil) || [strName isEqualToString:@""]) {
        TTAlertNoTitle(NSLocalizedString(@"用户名不能为空！",nil));
        return;
    }
    
    if ((strPassword == nil) || [strPassword isEqualToString:@""]) {
        TTAlertNoTitle(NSLocalizedString(@"密码不能为空！",nil));
        return;
    }
    
    if ((strConfirmPassword == nil) || [strConfirmPassword isEqualToString:@""]) {
        TTAlertNoTitle(NSLocalizedString(@"密码确认不能为空！",nil));
        return;
    } else if(![strConfirmPassword isEqualToString:strPassword]) {
        TTAlertNoTitle(NSLocalizedString(@"两次密码不一致！",nil));
        return;
    }
    
    if ((strEmail == nil) || [strEmail isEqualToString:@""]) {
        TTAlertNoTitle(NSLocalizedString(@"邮箱不能为空！",nil));
        return;
    }
    
    [[ZheliURLRequest instance] sendRegister:self :strName :strPassword :strEmail];
}

@end
