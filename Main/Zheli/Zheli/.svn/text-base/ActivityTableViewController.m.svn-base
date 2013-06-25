#import "ActivityTableViewController.h"

@implementation ActivityTableViewController

- (id)initWithCode:(NSString *)code {
    if ((self = [super init])) {
        UIImage* image = [UIImage imageNamed:@"activity_tab_button_normal2.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
        self.title = @"活动";
        [ShareData sharedInstance].tvcAct = self;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.variableHeightRows = YES;
    self.dataSource = [ActivityPageDataSource pageDataSource];
    
    //******* left button *******
    
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 75, 29)];
    [button1 addTarget:self 
                action:@selector(actMine:)
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setImage:[UIImage imageNamed:@"btMyActivity.png"] 
             forState:UIControlStateNormal];
    
    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.leftBarButtonItem = buttonItem1;
    [buttonItem1 release];
    [button1 release];
    
    //******* right button *******
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 75, 29)];
    [button2 addTarget:self 
                action:@selector(actRecommend:)
      forControlEvents:UIControlEventTouchUpInside];
    [button2 setImage:[UIImage imageNamed:@"btActivityRecommend.png"] 
             forState:UIControlStateNormal];
    
    UIBarButtonItem * buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:button2];
    self.navigationItem.rightBarButtonItem = buttonItem2;
    [buttonItem2 release];
    [button2 release];
}

- (id <TTTableViewDelegate>) createDelegate {
    TTTableViewDragRefreshDelegate *delegate = [[TTTableViewDragRefreshDelegate alloc] initWithController:self];
    return [delegate autorelease];
}


- (IBAction) actMine:(id)sender{
    UINavigationController * nav = [[UINavigationController alloc] init];
    ActivityMineController * activityMineController = [[ActivityMineController alloc] init];
        
    [nav pushViewController:activityMineController animated:NO]; 
    
    [self presentModalViewController:nav animated:YES];
    [activityMineController release];
    
    [nav release];
}

- (IBAction) actRecommend:(id)sender{
    UINavigationController * nav = [[UINavigationController alloc] init];
    ActivityRecommendController * activityRecommendController = [[ActivityRecommendController alloc] init];
    
    [nav pushViewController:activityRecommendController animated:NO]; 
    
    [self presentModalViewController:nav animated:YES];
    [activityRecommendController release];
    
    [nav release];
}

@end