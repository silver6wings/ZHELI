#import "MessageTableViewController.h"

@implementation MessageTableViewController

- (id)initWithCode:(NSString*)code {
    if ((self = [super init])) {
        UIImage * image = [UIImage imageNamed:@"message_tab_button_normal2.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
        self.title = @"对话";
        [ShareData sharedInstance].tvcMsg = self;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.variableHeightRows = YES;
    self.dataSource = [MessageDataSource pageDataSource];
    
//    //******* left button *******
//    
//    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
//    [button1 addTarget:self 
//                action:nil 
//      forControlEvents:UIControlEventTouchUpInside];
//    [button1 setImage:[UIImage imageNamed:@"btRefresh.png"] 
//             forState:UIControlStateNormal];
//    
//    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
//    self.navigationItem.leftBarButtonItem = buttonItem1;
//    [buttonItem1 release];
//    [button1 release];
//    
//    //******* right button ********
//    
//    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
//    [button2 addTarget:self 
//                action:nil 
//      forControlEvents:UIControlEventTouchUpInside];
//    [button2 setImage:[UIImage imageNamed:@"btAdd.png"] 
//             forState:UIControlStateNormal];
//    
//    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:button2];
//    self.navigationItem.rightBarButtonItem = buttonItem2;
//    [buttonItem2 release];
//    [button2 release];
}

- (id <TTTableViewDelegate>) createDelegate {
    TTTableViewDragRefreshDelegate *delegate = [[TTTableViewDragRefreshDelegate alloc] initWithController:self];
    return [delegate autorelease];
}

@end
