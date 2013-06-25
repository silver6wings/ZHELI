#import "NearbyViewController.h"


@implementation UINavigationBar (CustomImage)

- (void)drawRect:(CGRect)rect {
	UIImage * image = [UIImage imageNamed: @"navigationBarBg.png"];
	[image drawInRect:CGRectMake(0, 0, 320, 44)];
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation NearbyViewController

- (id)initWithCode:(NSString*)code {
    if ((self = [super init])) {
        UIImage* image = [UIImage imageNamed:@"zheli_tabbar1.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
        self.title = @"附近";
        [ShareData sharedInstance].tvcNearby = self;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.variableHeightRows = YES;
    self.dataSource = [NearbyPageDataSource pageDataSource];
    
    //******* left button *******
//    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
//    [button1 addTarget:self 
//                action:@selector(chooseButtonClick:) 
//      forControlEvents:UIControlEventTouchUpInside];
//    [button1 setImage:[UIImage imageNamed:@"btChoose.png"] 
//             forState:UIControlStateNormal];
//    
//    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
//    self.navigationItem.leftBarButtonItem = buttonItem1;
//    [buttonItem1 release];
//    [button1 release];
    
    //******* right button ********
//    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
//    [button2 addTarget:self 
//                action:@selector(refreshClick:) 
//      forControlEvents:UIControlEventTouchUpInside];
//    [button2 setImage:[UIImage imageNamed:@"btRefresh.png"] 
//             forState:UIControlStateNormal];
//    
//    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:button2];
//    self.navigationItem.rightBarButtonItem = buttonItem2;
//    [buttonItem2 release];
//    [button2 release];
    
    // ==== back button ====
    
    UIButton * btBack = [[UIButton alloc] init];
    [btBack setImage:[UIImage imageNamed:@"btChoose.png"] 
            forState:UIControlStateNormal];
    
    UIBarButtonItem * btiBack = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btBack.png"] 
                                                                 style:UIBarButtonItemStyleDone 
                                                                target:nil 
                                                                action:nil];
    
//    UIBarButtonItem * btiBack = [[UIBarButtonItem alloc] initWithCustomView:btBack];
    self.navigationItem.backBarButtonItem = btiBack;
    [btiBack release];
    [btBack release];

}


- (id <TTTableViewDelegate>) createDelegate {
    TTTableViewDragRefreshDelegate * delegate = [[TTTableViewDragRefreshDelegate alloc] initWithController:self];
    return [delegate autorelease];
}

-(void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath{
    
}

- (IBAction)chooseButtonClick:(id)sender{}
- (IBAction)refreshClick:(id)sender{}


@end
