#import "ActivityDetailController.h"

@implementation ActivityDetailController
@synthesize Joined, myID, myIntro, lbDetail, uiScroll;

- (id)initWithID:(NSString *)ID{
    if ((self = [super init])){
        NSLog(@"acitivityId:%@",ID);
        self.title = @"活动详细"; 
        self.hidesBottomBarWhenPushed = YES; 
        self.myID = ID;
    }
    return self;
}

- (void)dealloc{
    [super dealloc];
}

- (void)loadView {
    [super loadView];
    [[ZheliURLRequest instance] sendIsAttendto:self actId:myID];
    [[ZheliURLRequest instance] sendActDetail:self actId:myID];
    
    //******* back button *******
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 29)];
    [button1 addTarget:self 
                action:@selector(back:)
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setImage:[UIImage imageNamed:@"btBack.png"] 
             forState:UIControlStateNormal];
    
    UIBarButtonItem * buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.leftBarButtonItem = buttonItem1;
    [buttonItem1 release];
    [button1 release];
    
    
//    int contentHeight = 140;
//    int buttonHeight = 40;
//    int viewHeight = 300;
//    
//    UIButton * btIntro = [[UIButton alloc] initWithFrame:CGRectMake(10, contentHeight, 100, buttonHeight)];
//    btIntro.backgroundColor = [UIColor blackColor];
//    [uiScroll addSubview:btIntro];
//    [btIntro release];
//    
//    UIButton * btAddr = [[UIButton alloc] initWithFrame:CGRectMake(110, contentHeight, 100, buttonHeight)];
//    btAddr.backgroundColor = [UIColor brownColor];
//    [uiScroll addSubview:btAddr];
//    [btAddr release];
//    
//    UIButton * btCont = [[UIButton alloc] initWithFrame:CGRectMake(210, contentHeight, 100, buttonHeight)];
//    btCont.backgroundColor = [UIColor blueColor];
//    [uiScroll addSubview:btCont];
//    [btCont release];
//    
//    UIView * uiView = [[UIView alloc] initWithFrame:CGRectMake(0, contentHeight + buttonHeight, 320, viewHeight)];
//    uiView.backgroundColor = [UIColor yellowColor];
//    [uiScroll addSubview:uiView];
//    
//    uiScroll.contentSize = CGSizeMake(320, contentHeight + buttonHeight + viewHeight);

}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    UINavigationController * navViewController = [[UINavigationController alloc] init];
//    LoginViewController* loginViewController = [[LoginViewController alloc] init];
//    
//    [navViewController pushViewController:loginViewController animated:YES];
//    [self presentModalViewController:navViewController animated:YES];
//    
//    [navViewController release];
//    [loginViewController release];
//}


- (void)refreshJoined{
    UIButton * btAct = [[UIButton alloc] initWithFrame:CGRectMake(0, 315+48 , 320, 45)];
    [self.view addSubview:btAct];
    
    if (Joined) {
        //******* right button *******
        UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
        [button2 addTarget:self 
                    action:@selector(toMember:)
          forControlEvents:UIControlEventTouchUpInside];
        [button2 setImage:[UIImage imageNamed:@"btMembers.png"] 
                 forState:UIControlStateNormal];
        
        UIBarButtonItem * buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:button2];
        self.navigationItem.rightBarButtonItem = buttonItem2;
        [buttonItem2 release];
        [button2 release];
        // ==== Exit ====
        [btAct setImage:[UIImage imageNamed:@"btActivityExit.png"]  forState:UIControlStateNormal];
        [btAct addTarget:self action:@selector(actExit:) forControlEvents:UIControlEventTouchUpInside];
    } else {
        // ==== Join ====
        [btAct setImage:[UIImage imageNamed:@"btActivityJoin.png"]  forState:UIControlStateNormal];
        [btAct addTarget:self action:@selector(actJoin:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)refreshIntro{
    // ==== Scroll View ====
    uiScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 368+48 - 50)];
    [self.view addSubview:uiScroll]; 
    [uiScroll release];
    
    // ==== Add intro ====
    
    lbDetail = [[UILabel alloc] initWithFrame:CGRectZero];
    [uiScroll addSubview:lbDetail];
    [lbDetail release];
    
    lbDetail.text = @"Loading...";
    lbDetail.textAlignment = UITextAlignmentLeft;
    lbDetail.textColor = [UIColor blackColor];
    lbDetail.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
    lbDetail.backgroundColor = [UIColor clearColor];
    lbDetail.font = [UIFont boldSystemFontOfSize:16];
    lbDetail.numberOfLines = 0;
    lbDetail.lineBreakMode = UILineBreakModeCharacterWrap;
    
    CGSize lbSize = [myIntro sizeWithFont:[UIFont boldSystemFontOfSize:18.0] 
                        constrainedToSize:CGSizeMake(280, 1000)
                            lineBreakMode:UILineBreakModeCharacterWrap];
    
    lbDetail.frame = CGRectMake(20, 10, lbSize.width, lbSize.height);        
    lbDetail.text = myIntro;
    uiScroll.contentSize = CGSizeMake(320, lbSize.height +20);
}

- (IBAction)toMember:(id)sender{
    ActivityDMember * adm = [[ActivityDMember alloc] initWithId : myID];
    
    [self.navigationController pushViewController:adm animated:YES];
    [adm release];
}

- (IBAction)actJoin:(id)sender{
    [[ZheliURLRequest instance]sendActJoin:self actId:myID];
}

- (IBAction)actExit:(id)sender{
    [[ZheliURLRequest instance]sendActExit:self actId:myID];
}

- (IBAction)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

//- (IBAction)segmentAction{
//    
//    if (segmentedControl.selectedSegmentIndex == 0) {
//        [adjTableController viewWillAppear:NO];
//        [self.view removeAllSubviews];
//        [self.view addSubview:adjTableController.view];
//    } else {
//        [adwTableController viewWillAppear:NO];
//        [self.view removeAllSubviews];
//        [self.view addSubview:adwTableController.view];
//    }
//    
//}

@end
