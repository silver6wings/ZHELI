#import "CardSendController.h"

@implementation CardSendController
@synthesize txtInfo, sendID;

- (id)initWithID:(NSString *)sendId{
    self = [super init];
    if (self) {
        self.title = @"发送名片";
        self.view.backgroundColor = RGBCOLOR(200, 200, 200);
        self.sendID = sendId;
    }
    return self;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)loadView{
    [super loadView];
}
- (void)viewDidLoad{
    [super viewDidLoad];    
    
    //******* left button *******
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
    [button1 addTarget:self 
                action:@selector(finished:) 
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setImage:[UIImage imageNamed:@"btComplete.png"] 
             forState:UIControlStateNormal];
    
    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.leftBarButtonItem = buttonItem1;
    [buttonItem1 release];
    [button1 release];
    
    //******* right button *******
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
    [button2 addTarget:self 
                action:@selector(send:) 
      forControlEvents:UIControlEventTouchUpInside];
    [button2 setImage:[UIImage imageNamed:@"btSend.png"] 
             forState:UIControlStateNormal];
    
    UIBarButtonItem * buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:button2];
    self.navigationItem.rightBarButtonItem = buttonItem2;
    [buttonItem2 release];
    [button2 release];
       
    //******* txtField  *******
    txtInfo = [[UITextField alloc]initWithFrame:CGRectMake(30, 30, 260, 30)];
//    txtInfo.delegate = self;
    txtInfo.borderStyle = UITextBorderStyleRoundedRect;
    txtInfo.autocorrectionType = UITextAutocorrectionTypeNo;
    txtInfo.returnKeyType = UIReturnKeyNext;
    txtInfo.text = @"您好，很高兴认识你。";
    txtInfo.clearButtonMode = UITextFieldViewModeWhileEditing;
    [txtInfo becomeFirstResponder];
    [self.view addSubview:txtInfo];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction) send:(id)sender{
    NSString * tnote = txtInfo.text;
    [[ZheliURLRequest instance] sendSendingCard:self
                                         toUser:sendID
                                       withNote:tnote];
    
}
- (IBAction) finished:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

@end
