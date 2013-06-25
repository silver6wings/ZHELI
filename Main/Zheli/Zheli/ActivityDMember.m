#import "ActivityDMember.h"


@implementation ActivityDMember

- (id)initWithId : (NSString*)Id {
    if ((self = [super init])) {
        [[ShareData sharedInstance] setSStrUid:Id];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
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
    
    self.variableHeightRows = YES;
    self.dataSource = [ActivityDMemberDataSource pageDataSource];
}

- (IBAction)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
