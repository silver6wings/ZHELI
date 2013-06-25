#import "CardViewController.h"


@implementation CardViewController
@synthesize myID, myInfo, friends;

- (id)initWithCard:(NSString *)card
          isFriend:(NSString *)isf{
    if((self = [super init])){
        SYSOUT(SW_STRADD2(@"CardUserId:", card));
        self.myID = card;
        self.friends = isf;
        self.hidesBottomBarWhenPushed = YES;
        self.view.backgroundColor = [UIColor blackColor];
    }
    return self;
}

-(void) dealloc{
    [super dealloc];
}

- (void) loadView{
    [super loadView];
    
    UIImageView * bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cardBg4.png"]];
    bgImageView.frame = CGRectMake(0, 0, 320, 416);
    [self.view addSubview:bgImageView];
    [bgImageView release];
    
    // === Add bottom button ===
    
    if([self.friends isEqualToString:@"NO"]){
        UIButton * button = [[UIButton alloc] init];
        button.frame = CGRectMake(18, 360, 283, 35);
        [button setBackgroundImage:[UIImage imageNamed:@"sendCard2.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(sendCard:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button release];
    } else if([self.friends isEqualToString:@"YES"]){
        UIButton * button1 = [[UIButton alloc] init];
        button1.frame = CGRectMake(13, 360, 140, 35);
        [button1 setBackgroundImage:[UIImage imageNamed:@"btMsgSend2.png"] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(sendMsg:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button1];
        [button1 release];
        
        UIButton * button2 = [[UIButton alloc] init];
        button2.frame = CGRectMake(167, 360, 140, 35);
        [button2 setBackgroundImage:[UIImage imageNamed:@"btMsgRemove2.png"] forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button2];
        [button2 release];
    }
    
    if(![myID isEqualToString:@"self"]){
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
    }
    
    [self update];
}

- (void)update{
    // ==== get data from server ====
    if([myID isEqualToString:@"self"]){
        //    NSArray * keyList = [NSArray arrayWithObjects:@"city",@"headURL",@"identity",@"intro",
        //                         @"like",@"name",@"organization",@"personalTag",@"province",
        //                         @"site",@"status",@"userId",@"vocate",@"weiboSite",nil];
        //    NSArray * keyList2 = [NSArray arrayWithObjects:@"birthday",@"email",@"isMarrayed",
        //                          @"mobile",@"msn",@"phone",@"qq",@"sex",nil];
        //        [[ZheliURLRequest instance] sendCardforSelf:self];
        myID = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
        SYSOUT(myID);
        [[ZheliURLRequest instance] sendCard:self
                                     forUser:myID];
        
        
    } else {
        [[ZheliURLRequest instance] sendCard:self
                                     forUser:myID];
    } 
}

- (void)refresh{
    
    int leftEdge = 20;
    int topEdge = 21;
    
    imgIcon = [[TTImageView alloc] init];
    imgIcon.frame = CGRectMake(240, 20, 60, 60);
    imgIcon.urlPath = [myInfo objectForKey:@"headURL"];
    [self.view addSubview:imgIcon];
    [imgIcon release];
    
    NSString * tName = [SWString nullString:[myInfo objectForKey:@"name"]];
    tName = SW_STRADD2(@"姓名：", tName);
    lbName = 
    [CardViewController addLabel:lbName toController:self withFontSize:16
                               x:leftEdge y:18 width:200 height:25];
    lbName.text = tName;
    
    
    NSString * tIntro = [SWString nullString:[myInfo objectForKey:@"intro"]];
    CGSize lbSize = [tIntro sizeWithFont:[UIFont boldSystemFontOfSize:18.0]
                   constrainedToSize:CGSizeMake(240, 100)
                       lineBreakMode:UILineBreakModeCharacterWrap];
    
    lbIntro = 
    [CardViewController addLabel:lbIntro toController:self withFontSize:14
                               x:leftEdge y:260 width:lbSize.width height:lbSize.height];
    lbIntro.text = tIntro;
    
    SYSOUT(@"================================");
    
    for (NSString * tStr in [myInfo allKeys]) {
        if (![SWString isEmpty:[myInfo objectForKey:tStr]]) {
            NSString * tText = @"";
            UILabel * tlb;
            
            
            if([tStr isEqualToString:@"friendsCount"]){
                tText = [SWString nullString:[myInfo objectForKey:@"friendsCount"]];
                tText = SW_STRADD3(@"好友：", tText, @"人");
                topEdge += 20;
            }
            
            if([tStr isEqualToString:@"location"]){
                tText = [SWString nullString:[myInfo objectForKey:@"location"]];
                tText = SW_STRADD2(@"地址：", tText);
                topEdge += 20;
            }
            
            if([tStr isEqualToString:@"vocation"]){
                tText = [SWString nullString:[myInfo objectForKey:@"vocation"]];
                tText = SW_STRADD2(@"行业：", tText);
                topEdge += 20;
            }
            
            if([tStr isEqualToString:@"personalTag"]){
                tText = [SWString nullString:[myInfo objectForKey:@"personalTag"]];
                tText = SW_STRADD2(@"标签：", tText);
                topEdge += 20;
            }
            
            if([tStr isEqualToString:@"like"]){
                tText = [SWString nullString:[myInfo objectForKey:@"like"]];
                tText = SW_STRADD2(@"爱好：", tText);
                topEdge += 20;
            }
            
            if([tStr isEqualToString:@"identity"]){
                tText = [SWString nullString:[myInfo objectForKey:@"identity"]];
                tText = SW_STRADD2(@"职业：", tText);
                topEdge += 20;
            }
            
            if([tStr isEqualToString:@"organization"]){
                tText = [SWString nullString:[myInfo objectForKey:@"organization"]];
                tText = SW_STRADD2(@"公司：", tText);
                topEdge += 20;
            }
            
            if([tStr isEqualToString:@"weiboSite"]){
                tText = [SWString nullString:[myInfo objectForKey:@"weiboSite"]];
                tText = SW_STRADD2(@"微博：", tText);
                topEdge += 20;
            }
            
            if([tStr isEqualToString:@"status"]){
                tText = [SWString nullString:[myInfo objectForKey:@"status"]];
                tText = SW_STRADD2(@"状态：", tText);
                topEdge += 20;
            }
            
            if([tStr isEqualToString:@"position"]){
                tText = [SWString nullString:[myInfo objectForKey:@"position"]];
                tText = SW_STRADD2(@"职位：", tText);
                topEdge += 20;
            }
            
            if (topEdge > 100) {
                tlb = [CardViewController addLabel:tlb toController:self withFontSize:12
                                                 x:leftEdge y:topEdge width:280 height:20];
            } else {
                tlb = [CardViewController addLabel:tlb toController:self withFontSize:12
                                                 x:leftEdge y:topEdge width:220 height:20];
            }
            tlb.text = tText;
            
//            NSLog(@"%@:%@",tStr,[myInfo objectForKey:tStr]);
        }
    }    
}

- (IBAction)sendCard:(id)sender{
    NSLog(@"%@",myID);
    UINavigationController * nav = [[UINavigationController alloc] init];
    CardSendController * csc = [[CardSendController alloc] initWithID:myID];
    
    [nav pushViewController:csc animated:NO]; 
    [self presentModalViewController:nav animated:YES];
}

- (IBAction)sendMsg:(id)sender{
    SessionController * tsc = [[SessionController alloc] initWithCode:myID];
    [self.navigationController pushViewController:tsc animated:YES];
    [tsc release];
}

- (IBAction)delete:(id)sender{
    [[ZheliURLRequest instance] sendDeleteCard:self userId:myID];
}

- (IBAction)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

// ******************************************************************************
+ (UILabel *)addLabel:(UILabel *)label 
         toController:(UIViewController *)controller
         withFontSize:(int)fontSize
                    x:(int)x
                    y:(int)y
                width:(int)width
               height:(int)height{
    
    label = [[UILabel alloc] init];
    label.frame = CGRectMake(x, y, width, height);
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    label.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = UITextAlignmentLeft;
    
    [controller.view addSubview:label];
    [label release];
    
    return label;
}

@end
