#import "ZheliURLRequest.h"

static ZheliURLRequest * _instance;

@implementation ZheliURLRequest
@synthesize delegate;

+ (ZheliURLRequest *)instance{
	@synchronized(self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
            srandom(time(NULL));
        }
    }
    return _instance;
}

- (void)sendLogin:(id)delegator
                 :(NSString *)strName
                 :(NSString *)strPassword{   
    
    self.delegate = delegator;
    NSString * tmpPassword = [SW_STRADD2(strName, [strPassword getMD5]) getMD5];
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/user/login?", @"loginName=%@&password=%@&json=1") ,
                       strName,tmpPassword];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    request.userInfo = @"requestLogin";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    request.cachePolicy = TTURLRequestCachePolicyNetwork;
    [request send];
}

- (void)sendLoginAuto:(id)delegator
                     :(NSString *)strName
                     :(NSString *)strPassword{
    
    self.delegate = delegator;
    NSString * tmpPassword = [SW_STRADD2(strName, [strPassword getMD5]) getMD5];
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/user/login?", @"loginName=%@&password=%@&json=1") ,
                       strName,tmpPassword];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    request.userInfo = @"requestLoginAuto";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    request.cachePolicy = TTURLRequestCachePolicyNetwork;
    [request send];
}

- (void)sendLogout:(id)delegator{        
    self.delegate = delegator;
    
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/user/logout?", @"secretkey=%@&json=1") ,
                       key];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    request.userInfo = @"requestLogOut";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    [request send];
}

- (void)sendRegister:(id)delegator
                    :(NSString *)strName
                    :(NSString *)strPassword
                    :(NSString *)strEmail{
    self.delegate = delegator;
    NSString * tloginName = strEmail;
    NSString * tpassword = strPassword;
    NSString * tuserName = strName;
    tuserName = [tuserName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    tuserName = [tuserName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/user/register?", @"loginName=%@&password=%@&userName=%@&sex=1&json=1"),
                       tloginName,tpassword,tuserName];
    TTURLRequest* request = [TTURLRequest requestWithURL:turl
                                                delegate:self];
    NSLog(@"%@",turl);
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    request.userInfo = @"requestRegister";
    request.cachePolicy = TTURLRequestCachePolicyNetwork;
    [request send];
}

- (void)sendCardforSelf:(id)delegator{
    self.delegate = delegator;
    
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    NSString * ran = [NSString stringWithFormat:@"%d",random()];
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/user/mycard/view?", @"secretkey=%@&json=1&random=%@") ,
                       key,ran];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    request.userInfo = @"requestCardforSelf";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    [request send];
}

- (void)sendCard:(id)delegator 
         forUser:(NSString *)userId{
    
    self.delegate = delegator;
    
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/user/card/view?", @"userId=%@&secretkey=%@&json=1") ,
                       userId, key];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    request.userInfo = @"requestCardforUserId";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    [request send];
}

- (void)sendSendingCard:(id)delegator 
                 toUser:(NSString *)userId
               withNote:(NSString *)note{
    
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    
    NSString * tNote = note;
    tNote = SW_ENCODEURI(tNote);
    tNote = SW_ENCODEURI(tNote);
    
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/user/mycard/send?", @"userId=%@&note=%@&secretkey=%@&json=1"),
                       userId,tNote,key];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];

    request.userInfo = @"requestSendSendingCard";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    [request send];
}

- (void)sendDeleteCard:(id)delegator
                userId:(NSString *)uid{
    
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/user/contact/delete?", @"userId=%@&secretkey=%@&json=1"),
                       uid,key];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    
    request.userInfo = @"requestSendDeleteCard";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    [request send];
}

- (void)sendIsAttendto:(id)delegator
                 actId:(NSString *)actId{
    self.delegate = delegator;
    
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/activity/attenduser/status/view?", @"activityId=%@&secretkey=%@&json=1") ,
                       actId, key];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    request.userInfo = @"requestIsAttendTo";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    [request send];
}

- (void)sendActJoin:(id)delegator
              actId:(NSString *)actId{
    self.delegate = delegator;
    
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/activity/act/attend?", @"activityId=%@&secretkey=%@&json=1") ,
                       actId, key];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    
    request.userInfo = @"requestActJoin";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    [request send];
}


- (void)sendActExit:(id)delegator
              actId:(NSString *)actId{
    self.delegate = delegator;
    
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/activity/act/quit?", @"activityId=%@&secretkey=%@&json=1") ,
                       actId, key];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    request.userInfo = @"requestActExit";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    [request send];
}

- (void)sendActDetail:(id)delegator
                actId:(NSString *)actId{
    self.delegate = delegator;
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/activity/detail/nohtml/view?", @"activityId=%@&json=1") ,
                       actId];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    request.userInfo = @"requestActDetail";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    [request send];   
}

- (void)sendChatList:(id)delegator
              userId:(NSString *)userId{
    self.delegate = delegator;
    
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    NSString * ran = [NSString stringWithFormat:@"%d",random()];
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/chat/msg/list?", @"ruid=%@&secretkey=%@&json=1&random=%@") ,
                       userId,key,ran];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    
    request.userInfo = @"requestChatList";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    [request send];       
}

- (void)sendChatMsgSend:(id)delegator
                 userId:(NSString *)uid 
                withMsg:(NSString *)msg{
    self.delegate = delegator;
    
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    NSString * tmsg = msg;
    tmsg = [tmsg stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    tmsg = [tmsg stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // ==== Get ====
    
    NSString * turl = [NSString stringWithFormat:
                       SW_STRADD3(SW_URL, @"/chat/msg/send?", @"ruid=%@&msg=%@&secretkey=%@&json=1") ,
                       uid,tmsg,key];
    TTURLRequest * request = [TTURLRequest requestWithURL:turl
                                                 delegate:self];
    request.userInfo = @"requestChatMsgSend";
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    [request send];       
    
    NSLog(@"%@",turl);

    // ==== Post ====
    
//    NSString * turl = [NSString stringWithFormat:
//                       SW_STRADD3(SW_URL, @"/chat/msg/send?", @"ruid=%@&secretkey=%@&json=1") ,
//                       uid,key];
//    TTURLRequest * request = [TTURLRequest requestWithURL:turl
//                                                 delegate:self];
//    
//    request.httpMethod = @"POST";
//    request.cachePolicy = TTURLRequestCachePolicyNoCache;
//    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
//    
//    NSDictionary * user = [NSDictionary dictionaryWithObjectsAndKeys:msg, @"msg", nil];
//    NSString * json = [user JSONRepresentation];
//    NSData * jsonData = [NSData dataWithBytes:[json UTF8String]
//                                       length:[json length]];
//    [request setHttpBody:jsonData];
//    
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[NSString stringWithFormat:@"%d", [jsonData length]] forHTTPHeaderField:@"Content-Length"];
//
//    request.userInfo = @"requestChatMsgSend";
//    [request send];

    // ==== Post End ====
}

#pragma URLRequest

- (void)requestDidStartLoad:(TTURLRequest *)request {
    NSLog(@"Request Loading Beginning...");
}

- (void)requestDidFinishLoad:(TTURLRequest*)request {
    NSString * userInfo = request.userInfo;
    NSLog(@"Request Finished : %@",userInfo);
    
    TTURLJSONResponse * response = (TTURLJSONResponse *)request.response; // Get data from response
//    TTDASSERT([response.rootObject isKindOfClass:[NSDictionary class]]); // Check data type
    NSDictionary * rootObject = response.rootObject;
    
    // ==== Finished ====
    {
        if([userInfo isEqualToString:@"requestLogin"] || 
           [userInfo isEqualToString:@"requestLoginAuto"]){
            // ==== When get login & login AUTOrequest feedback ====
            NSLog(@"Login Start");
            
            NSMutableArray * array = [[NSMutableArray alloc] initWithArray:[rootObject objectForKey:@"actionErrors"]];
            
            if ([array count] == 0){
                // get user data
                NSDictionary * cookie = [rootObject objectForKey:@"mobilecookies"];
                NSString * userId = [cookie objectForKey:@"userId"];
                NSString * key = [cookie objectForKey:@"key"];
                NSLog(@"userId:%@",userId);
                NSLog(@"key:%@",key);
                NSLog(@"Login success!");
                // write local  file
                [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
                [[NSUserDefaults standardUserDefaults] setObject:key forKey:@"key"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                // deal with view
                LoginViewController * t = (LoginViewController *)self.delegate;
                [t viewWillDisappear:YES];
                [t dismissModalViewControllerAnimated:YES]; // Hide Login View
                [t pageJump];
            } else {
                TTAlertNoTitle([array objectAtIndex:0]);
            }      
        }
        
        if([userInfo isEqualToString:@"requestLogOut"]){
            // ==== When get Logout request feedback ====
            NSLog(@"Logout start");
            NSMutableArray * array = [[NSMutableArray alloc] initWithArray:[rootObject objectForKey:@"actionErrors"]];
            
            if ([array count] == 0){
                OptionTableViewController * t = (OptionTableViewController *)self.delegate;
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                                message:@"注销成功！"
                                                               delegate:t 
                                                      cancelButtonTitle:nil 
                                                      otherButtonTitles:@"OK", nil
                                      ];
                [alert show];
                [alert release];
            } else {
                TTAlertNoTitle([array objectAtIndex:0]);
            }     
        }
        
        if([userInfo isEqualToString:@"requestRegister"]){
            // ==== When get Register request feedback ====
            RegisterViewController * t = (RegisterViewController *)self.delegate;
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            
            if ([err count] == 0) {
                NSArray * tarr = [rootObject objectForKey:@"actionMessages"];
                NSString * tstr = [tarr objectAtIndex:0];
                TTAlertNoTitle(tstr);
                [t dismissModalViewControllerAnimated:YES];
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
        }
        
        if([userInfo isEqualToString:@"requestCardforSelf"]){
            // ==== When get self card ====            
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            
            if ([err count] == 0) {
                // === Put all elements in to one dictionary ===
                NSMutableDictionary * tmd = [NSMutableDictionary dictionary];
                
                NSDictionary * tuc = [rootObject objectForKey:@"userCard"];
                CardViewController * t = (CardViewController *)self.delegate;
                for (NSString * tkey in [tuc allKeys]){
                    if (![tkey isEqualToString:@"privacyInfo"])
                        [tmd setObject:SW_OBJ2STR([tuc objectForKey:tkey]) forKey:tkey];
                }
                
                NSDictionary * tpi = [tuc objectForKey:@"privacyInfo"];
                for (NSString * tkey in [tpi allKeys]){
                    [tmd setObject:SW_OBJ2STR([tuc objectForKey:tkey]) forKey:tkey];
                }
                
                t.myInfo = tmd;
                [t refresh];
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
            
        }
        
        if([userInfo isEqualToString:@"requestCardforUserId"]){
            // ==== When get userId card ====
            
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            if ([err count] == 0) {
                // === Put all elements in to one dictionary ===
                CardViewController * t = (CardViewController *)self.delegate;
                NSMutableDictionary * tmd = [NSMutableDictionary dictionary];
                NSDictionary * tuc = [rootObject objectForKey:@"userDetail"];
                
                for (NSString * tkey in [tuc allKeys]){
                    if (![tkey isEqualToString:@"privacyInfo"])
                        [tmd setObject:SW_OBJ2STR([tuc objectForKey:tkey]) forKey:tkey];
                }
                
                if(![[tuc objectForKey:@"privacyInfo"] isKindOfClass:[NSNull class]]){
                    t.friends = @"YES";
                    NSDictionary * tpi = [tuc objectForKey:@"privacyInfo"];
                    for (NSString * tkey in [tpi allKeys]){
                        [tmd setObject:SW_OBJ2STR([tuc objectForKey:tkey]) forKey:tkey];
                    }
                }else{
                    t.friends = @"NO";
                }
                
                t.myInfo = tmd;
                [t refresh];
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
            
        }
        
        if([userInfo isEqualToString:@"requestSendSendingCard"]){
            // ==== When Send sending card ====
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            CardViewController * t = (CardViewController *)self.delegate;
            
            if ([err count] == 0) { 
                NSArray * tam = [rootObject mutableArrayValueForKey:@"actionMessages"];
                for (int i = 0 ; i < [tam count]; i++) {
                    TTAlertNoTitle([tam objectAtIndex:i]);
                }
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
            [t dismissModalViewControllerAnimated:YES];
        }
        
        if([userInfo isEqualToString:@"requestSendDeleteCard"]){
            // ==== When Send sending card ====
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            CardViewController * t = (CardViewController *)self.delegate;
            
            if ([err count] == 0) { 
                TTAlertNoTitle(@"删除成功");
                [[ShareData sharedInstance].tvcContact.tableView reloadData];
                [[ShareData sharedInstance].tvcContact reload];
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
            [t.navigationController popViewControllerAnimated:YES];
        }
        
        if([userInfo isEqualToString:@"requestIsAttendTo"]){
            // ==== When Is Attend TO XXX ====
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            
            if ([err count] == 0) { 
                NSString * tas = SW_OBJ2STR([rootObject objectForKey:@"attendstatus"]);
                
                ActivityDetailController * t = (ActivityDetailController *)self.delegate;
                t.Joined = [tas isEqualToString:@"1"];
                [t refreshJoined];
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
        }
        
        if([userInfo isEqualToString:@"requestActJoin"]){
            // ==== When Activity Join ====
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            if ([err count] == 0) { 
                NSArray * tam = [rootObject mutableArrayValueForKey:@"actionMessages"];
                TTAlertNoTitle([tam objectAtIndex:0]);
                
//                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil
//                                                                message:
//                                                               delegate:delegate
//                                                      cancelButtonTitle:nil 
//                                                      otherButtonTitles:@"OK", nil
//                                      ];
//                [alert show];
//                [alert release];
                
                ActivityDetailController * t = (ActivityDetailController *)self.delegate;
                [t.navigationController popViewControllerAnimated:YES];
               
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
        }
        
        if([userInfo isEqualToString:@"requestActExit"]){
            // ==== When Activity Exit ====
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            
            if ([err count] == 0) { 
                NSArray * tam = [rootObject mutableArrayValueForKey:@"actionMessages"];
                TTAlertNoTitle([tam objectAtIndex:0]);
                
                ActivityDetailController * t = (ActivityDetailController *)self.delegate;
                [t.navigationController popViewControllerAnimated:YES];
                
                [[ShareData sharedInstance].tvcActMine.tableView reloadData];
                [[ShareData sharedInstance].tvcActMine reload];
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
        }
        
        if([userInfo isEqualToString:@"requestActDetail"]){
            // ==== When Activity Detail ====
            
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            
            if ([err count] == 0) { 
                NSDictionary * tac = [rootObject objectForKey:@"activities"];
                NSString * tin = [tac objectForKey:@"info"];
                
                ActivityDetailController * t = (ActivityDetailController *)self.delegate;
                t.myIntro = tin;
                [t refreshIntro];
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
        }
        
        if([userInfo isEqualToString:@"requestChatList"]){
            // ==== When Chat List ====
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            
            if ([err count] == 0) { 
                NSMutableArray * tcl = [rootObject mutableArrayValueForKey:@"chatlogList"];
                SessionController * t = (SessionController *)self.delegate;
                t.chatList = tcl;
                [t refreshView];
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
        }
        
        if([userInfo isEqualToString:@"requestChatMsgSend"]){
            // ==== When Chat Send ====        
            NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
            
            if ([err count] == 0) { 
                SYSOUT(@"Message Send Success!");
                SessionController * t = (SessionController *)self.delegate;
                t.txtInput.text = @"";
                [t update];
            } else {
                for (int i = 0 ; i < [err count]; i++) {
                    TTAlertNoTitle([err objectAtIndex:i]);
                }
            }
        }
    }// ==== end Finished ====
    
    

    
}

- (void)request:(TTURLRequest*)request didFailLoadWithError:(NSError *)error {    
    NSString * userInfo = request.userInfo;
    NSLog(@"Request Loading Error!  << UserInfo:%@ >>",userInfo);
}

@end

