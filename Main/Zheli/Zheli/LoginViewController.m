#import "LoginViewController.h"


@implementation LoginViewController

@synthesize txtName;
@synthesize txtPassword;

- (id)initWithNavController:(UINavigationController *)nav{
    self = [super init];
    if (self) {
        navController = nav;
        sw = [[SWLocation alloc] init];
    }
    return self;
}


// ***************
- (id)initWithNavigatorURL:(NSURL*)URL query:(NSDictionary*)query {
    
    NSLog(@"Suggest1 initWithNavigator");
    
    if (self == [self init]){
//        self.dibitsID = [[query objectForKey:@"ID"] integerValue];
//        self.userID = [[query objectForKey:@"userID"] integerValue];
//        self.thingID = [[query objectForKey:@"thingID"] integerValue];
//        self.coolCount = [[query objectForKey:@"coolCount"] integerValue];
    }
    return self;
}

//- (void) useAction{
//    TTURLAction * action = [[
//                            [TTURLAction actionWithURLPath:@"tt://post/suggest1"]
//                            applyQuery:[NSDictionary dictionaryWithObjectsAndKeys:
//                                        [NSNumber numberWithInteger:[item intID]],
//                                        @"ID",
//                                        [NSNumber numberWithInteger:[item intUserID]],
//                                        @"userID",
//                                        [NSNumber numberWithInteger:[item intThingID]],
//                                        @"thingID",
//                                        [NSNumber numberWithInteger:[item intCoolCount]],
//                                        @"coolCount",
//                                        [NSNumber numberWithInteger:[item intReplyCount]],
//                                        @"replyCount",
//                                        [NSNumber numberWithBool:[item isUserCool]],
//                                        @"isUserCool",
//                                        [item strUserPhotoURL],
//                                        @"userPhotoURL",
//                                        [item strThingPhotoURL],
//                                        @"thingPhotoURL",
//                                        [item strUserName],
//                                        @"userName",
//                                        [item strThingName],
//                                        @"thingName",
//                                        [item strContent]==nil?@"":[item strContent],
//                                        @"content",
//                                        [item strTime],
//                                        @"time",
//                                        item,
//                                        @"item",
//                                        cell,
//                                        @"cell",
//                                        nil]]
//                           applyAnimated:YES];
//    
//    [[TTNavigator navigator] openURLAction:action];
//}


// ***************


- (void)dealloc{
//    [weibo release];
    [txtName release];
    [txtPassword release];
    [swcAutoLogin release];
    [swcAutoLogin release];
    [sw release];
    [super dealloc];
}

- (void)loadView{
    [super loadView];
    [self setTitle:@"这里网"];
    
    UIImageView * bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgLogin2.png"]];
    bgImageView.frame = CGRectMake(0, 0, 320, 416);
    [self.view addSubview:bgImageView];
    [bgImageView release];
    
    int txtLeft = 55;
    int txtTop = 20;
    
    //******* txtField name *******
    txtName = [[UITextField alloc]initWithFrame:CGRectMake(txtLeft, txtTop, 200, 30)];
    txtName.delegate = self;
    txtName.borderStyle = UITextBorderStyleRoundedRect;
    txtName.autocorrectionType = UITextAutocorrectionTypeNo;
    txtName.keyboardType = UIKeyboardTypeEmailAddress;
    txtName.returnKeyType = UIReturnKeyNext;
    txtName.placeholder = @"帐户";
    txtName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:txtName];
    
    //******** txtField password *******
    txtPassword = [[UITextField alloc]initWithFrame:CGRectMake(txtLeft, txtTop+35, 200, 30)];
    txtPassword.delegate = self;
    txtPassword.borderStyle = UITextBorderStyleRoundedRect;
    txtPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    txtPassword.returnKeyType = UIReturnKeyDone;
    txtPassword.placeholder = @"密码";
    txtPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPassword.secureTextEntry = YES;
    [self.view addSubview:txtPassword];
    
    //******* auto Save *******
    swcAutoSave = [[UISwitch alloc] initWithFrame:CGRectMake(150, 100, 0, 0)];
    [swcAutoSave setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"autoSave"] animated:NO];
    [self.view addSubview:swcAutoSave];
    
    lbAutoSave = [[UILabel alloc] initWithFrame:CGRectMake(60, 100, 90, 20)];
    lbAutoSave.text = @"记住信息";
    lbAutoSave.textAlignment = UITextAlignmentCenter;
    lbAutoSave.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lbAutoSave];
    
    //******* auto Login *******
    swcAutoLogin = [[UISwitch alloc] initWithFrame:CGRectMake(150, 140, 0, 0)];
    [swcAutoLogin setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"autoLogin"] animated:NO];
    [swcAutoLogin addTarget:self action:@selector(autoLoginSetted:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:swcAutoLogin];
    
    lbAutoLogin = [[UILabel alloc] initWithFrame:CGRectMake(60, 140, 90, 20)];
    lbAutoLogin.text = @"自动登录";
    lbAutoLogin.textAlignment = UITextAlignmentCenter;
    lbAutoLogin.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lbAutoLogin];
    
    // ==== Weibo login button ====
//    btWeibo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btWeibo.frame = CGRectMake(60, 200, 180, 50);
//	  [btWeibo setTitle:@"用新浪微博登陆" forState:UIControlStateNormal];
//    [btWeibo addTarget:self action:@selector(wblogin:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btWeibo];
    
    // ==== get saved user info ====
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"autoSave"]) {
        txtName.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
        txtPassword.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"userPassword"];
    }
    
    // ******* Left button *******
    UIButton * buttonR = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 30)];
    UIBarButtonItem * buttonItemR = [[UIBarButtonItem alloc] initWithCustomView:buttonR];
    
    [buttonR setImage:[UIImage imageNamed:@"btRegister.png"] forState:UIControlStateNormal];
    [buttonR addTarget:self action:@selector(regist:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = buttonItemR;
    
    // ******* Right button *******
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 30)];
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    [button setImage:[UIImage imageNamed:@"btLogin.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = buttonItem;
    
    // ******* Auto login request send proccess *******
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"autoLogin"] == YES){
        NSString * strName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
        NSString * strPassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"userPassword"];
        if (!((strName == nil) || [strName isEqualToString:@""])) {
            [[ZheliURLRequest instance] sendLoginAuto:self:strName :strPassword];
        }
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
    if ([textField.placeholder isEqualToString:@"帐户"]) {
        [txtPassword becomeFirstResponder];
        return YES;
    }
    return YES;
}

- (void)pageJump{    
    [txtName resignFirstResponder];
    [txtPassword resignFirstResponder];
    [navController popViewControllerAnimated:NO];
    
    [[TTNavigator navigator] openURLAction:[[TTURLAction actionWithURLPath:@"tt://tabBar"] applyAnimated:YES]]; // Page jump
    
    // Second Login Need To Refresh
    if (![ShareData sharedInstance].firstLogin) {
        [[ShareData sharedInstance].tvcNearby.tableView reloadData];
        [[ShareData sharedInstance].tvcNearby reload];
        
        [[ShareData sharedInstance].tvcAct.tableView reloadData];
        [[ShareData sharedInstance].tvcAct reload];
        
        [[ShareData sharedInstance].tvcContact.tableView reloadData];
        [[ShareData sharedInstance].tvcContact reload];
        
        [[ShareData sharedInstance].tvcMsg.tableView reloadData];
        [[ShareData sharedInstance].tvcMsg reload];
    }
    
    [ShareData sharedInstance].firstLogin = NO;
}

- (IBAction) login:(id)sender{
    // === Check input ===
    NSString * strName = txtName.text;
    NSString * strPassword = txtPassword.text;  
    
    if ((strName == nil) || [strName isEqualToString:@""]) {
        TTAlertNoTitle(NSLocalizedString(@"用户名不能为空！",nil));
        return;
    }
    if ((strPassword == nil) || [strPassword isEqualToString:@""]) {
        TTAlertNoTitle(NSLocalizedString(@"密码不能为空!",nil));
        return;
    }
    
    //=== Write local files ===
    [[NSUserDefaults standardUserDefaults] setBool:swcAutoSave.on forKey:@"autoSave"];
    [[NSUserDefaults standardUserDefaults] setBool:swcAutoLogin.on forKey:@"autoLogin"];
    
    [[NSUserDefaults standardUserDefaults] setObject:strName forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] setObject:strPassword forKey:@"userPassword"];
    
    //=== Send request ===
    [[ZheliURLRequest instance] sendLogin:self:strName:strPassword];
}

- (IBAction) regist:(id)sender{
    UINavigationController * nav = [[UINavigationController alloc] init];
    RegisterViewController * reg = [[RegisterViewController alloc] init];
    
    [nav pushViewController:reg animated:NO];
    [self presentModalViewController:nav animated:YES];
    
    [nav release];
    [reg release];
}

- (IBAction) autoLoginSetted:(id)sender{
    if (swcAutoLogin.on) {
        [swcAutoSave setOn:YES animated:YES];
        [swcAutoSave setEnabled:NO];
    } else {
        [swcAutoSave setEnabled:YES];
    }
}

//- (IBAction) wblogin:(id)sender{
//    NSLog(@"weibo");
//    if( weibo )	{
//		[weibo release];
//		weibo = nil;
//	}
//
//	weibo = [[WeiBo alloc]initWithAppKey:ZHELI_APPKEY
//						   withAppSecret:ZHELI_APPSECRET];
//    
//	weibo.delegate = self;
//	[weibo startAuthorize];
//}

//#pragma WBSessionDelegate
//
//- (void)weiboDidLogin{    
//	UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil 
//													   message:@"用户验证已成功！" 
//													  delegate:nil 
//											 cancelButtonTitle:@"确定" 
//											 otherButtonTitles:nil];
//    NSLog(@"用户ID：%@",[weibo userID]);
//    
//    NSLog(@"Token:%@",[weibo accessToken]);
//    NSLog(@"TokenSecret:%@",[weibo accessTokenSecret]);
//    
//        
//	[alertView show];
//	[alertView release];
//}
//
//- (void)weiboLoginFailed:(BOOL)userCancelled withError:(NSError*)error{
//	UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"用户验证失败！"  
//													   message:userCancelled?@"用户取消操作":[error description]  
//													  delegate:nil
//											 cancelButtonTitle:@"确定" 
//											 otherButtonTitles:nil];
//	[alertView show];
//	[alertView release];
//}
//
//- (void)weiboDidLogout{
//	
//	UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil 
//													   message:@"用户已成功退出！" 
//													  delegate:nil 
//											 cancelButtonTitle:@"确定" 
//											 otherButtonTitles:nil];
//	[alertView show];
//	[alertView release];
//}


@end
