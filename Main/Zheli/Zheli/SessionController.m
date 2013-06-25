#import "SessionController.h"

#define REFRESH_INTERV 10.0

@implementation SessionController
@synthesize toID,chatList,vwInput,txtInput,usCont;

- (id)initWithCode:(NSString*)code {
    if ((self = [super init])) {
        self.toID = code;
        self.chatList = [NSArray array];
        self.hidesBottomBarWhenPushed = YES;
        
        //******* back button *******
        UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 29)];
        [button1 addTarget:self 
                    action:@selector(back:)
          forControlEvents:UIControlEventTouchUpInside];
        [button1 setImage:[UIImage imageNamed:@"btBack.png"] 
                 forState:UIControlStateNormal];
        
        UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
        self.navigationItem.leftBarButtonItem = buttonItem1;
        [buttonItem1 release];
        [button1 release];
        
        // ==== Set usContent View ====
        usCont = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, 320, 376)];
        usCont.backgroundColor = RGBCOLOR(200, 200, 200);
        usCont.contentSize = CGSizeMake(320, 800);
        usCont.showsVerticalScrollIndicator = NO;
        usCont.pagingEnabled = YES;
        usCont.delegate = self;
        [self.view addSubview:usCont];
        [usCont release];
        
        // ==== Set vwinput View ====
        vwinput = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        vwinput.backgroundColor = RGBCOLOR(100, 100, 100); 
        [self.view addSubview:vwinput]; 
        
        // ==== Set txtField ====
        txtInput = [[UITextField alloc] initWithFrame:CGRectMake(7, 7, 305, 25)];      
        txtInput.delegate = self;
        txtInput.borderStyle = UITextBorderStyleRoundedRect;
        txtInput.autocorrectionType = UITextAutocorrectionTypeNo;
        txtInput.returnKeyType = UIReturnKeySend;   
        txtInput.placeholder = @"在此输入信息:";
        txtInput.clearButtonMode = UITextFieldViewModeWhileEditing;
        [vwinput addSubview:txtInput]; 
        
        [self update];
    }
    return self;
}

-(void)dealloc{
    [myTimer invalidate];
    [vwinput release];
    [txtInput release];
    [super dealloc];
}

- (void)loadView {
    [super loadView];
}

- (void)refreshView{
    [usCont removeAllSubviews];        
    
    // ==== Set return button ====
    UIButton * btReturn = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 376)] autorelease];
    [btReturn addTarget:self action:@selector(returnKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
    [btReturn setBackgroundColor:[UIColor clearColor]];
    [usCont addSubview:btReturn];
    
    // ==== Set style ====
    {
        stSend = [TTShapeStyle styleWithShape:[TTSpeechBubbleShape shapeWithRadius:5 
                                                                     pointLocation:316
                                                                        pointAngle:0
                                                                         pointSize:CGSizeMake(10,10)] 
                                         next:[TTSolidFillStyle styleWithColor:RGBCOLOR(240, 240, 240)
                                                                          next:[TTSolidBorderStyle styleWithColor:RGBCOLOR(158, 163, 172) 
                                                                                                            width:1 
                                                                                                             next:nil]
                                               ]
                  ];
        stReceive = [TTShapeStyle styleWithShape:[TTSpeechBubbleShape shapeWithRadius:5 
                                                                        pointLocation:224
                                                                           pointAngle:180
                                                                            pointSize:CGSizeMake(10,10)] 
                                            next:[TTSolidFillStyle styleWithColor:RGBCOLOR(217, 228, 128) 
                                                                             next:[TTSolidBorderStyle styleWithColor:RGBCOLOR(158, 163, 172) 
                                                                                                               width:1 
                                                                                                                next:nil]
                                                  ]
                     ];
    }
    
    NSDictionary * td;
    NSString *tmsg, *ttoid, *tfrom, *ttime;
    int pxmg = 10;
    int pxpd = 10;
    int pxpd2 = pxpd * 2;
    int pxjg = 10;
    
    int twidth = 320;
    int theight = pxmg;
    int tleft = 5;
    int tright = twidth - 5;
    
    for (int i = 0; i < [self.chatList count]; i++) {
        td = [chatList objectAtIndex:i];
        tmsg = SW_OBJ2STR([td objectForKey:@"msg"]);
        ttoid = SW_OBJ2STR([td objectForKey:@"touid"]);
        tfrom = SW_OBJ2STR([td objectForKey:@"fromuid"]);
        ttime = SW_OBJ2STR([td objectForKey:@"msgtime"]);
        
        TTView * view = [[TTView alloc] init];
        view.backgroundColor = usCont.backgroundColor;
        
        UILabel * label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.text = tmsg;
        label.font = [UIFont boldSystemFontOfSize:14];
        label.numberOfLines = 0;
        label.lineBreakMode = UILineBreakModeCharacterWrap;
        
        CGSize lbSize = [tmsg sizeWithFont:[UIFont boldSystemFontOfSize:14.0] 
                         constrainedToSize:CGSizeMake(260, 1000)
                             lineBreakMode:UILineBreakModeCharacterWrap];
        
        if(![ttoid isEqualToString:toID]){
            // user send
            view.style = stSend;
            view.frame = CGRectMake(tleft, theight, lbSize.width + pxpd2+10, lbSize.height + pxpd2);
            label.frame = CGRectMake(tleft + pxpd + 10, theight + pxpd, lbSize.width, lbSize.height);
        } else {
            // user receive
            view.style = stReceive;
            view.frame = CGRectMake(tright - lbSize.width - pxpd2 - 10, theight, lbSize.width + pxpd2 + 10, lbSize.height + pxpd2);
            label.frame = CGRectMake(tright - lbSize.width - pxpd - 10, theight + pxpd, lbSize.width, lbSize.height);
        }
        
        
        [usCont addSubview:view];
        [view release];
        [usCont addSubview:label];
        [label release];
        
        theight += lbSize.height + pxpd2;
        theight += pxjg;
    }
    
    usCont.contentSize = CGSizeMake(320, theight);
}

- (void)update{
    if(myTimer == nil){
        myTimer = [NSTimer scheduledTimerWithTimeInterval:REFRESH_INTERV
                                                   target:self 
                                                 selector:@selector(timer) 
                                                 userInfo:nil 
                                                  repeats:YES];
    }
    
    [[ZheliURLRequest instance] sendChatList:self 
                                      userId:toID];
}

- (void)timer{
    [self update];
}

#pragma textField

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    SYSOUT(@"Message Sent....");
    [[ZheliURLRequest instance] sendChatMsgSend:self userId:toID withMsg:txtInput.text];
    return YES;
}

- (IBAction)returnKeyBoard:(id)sender{
    [txtInput resignFirstResponder];
}

- (IBAction)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    [myTimer invalidate];
    myTimer = nil;
}

@end
