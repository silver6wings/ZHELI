#import "TabBarController.h"

@implementation TabBarController

-(id)init{
    if((self = [super init])){
        [ShareData sharedInstance].tabBar = self;
    }
    return self;
}

- (void)viewDidLoad {
    
    [self setTabURLs:[NSArray arrayWithObjects: @"tt://nearby/root",
                                                @"tt://activities/root",
                                                @"tt://contact/root",
                                                @"tt://message/root",
                                                @"tt://option/root",
                                                nil]
     ];
    [self setSelectedIndex:0];

//    self.view.frame = CGRectMake(self.view.frame.origin.x+20, self.view.frame.origin.y, self.view.frame.origin.width-40, self.view.frame.origin.height);   
//    UIImageView *myTabView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainTabBarBg.png"]];
//    myTabView.frame = self.tabBar.frame;
//    myTabView.userInteractionEnabled = NO;
//    [self.view addSubview:myTabView];
//    UIImageView *myBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainTabBarBg.png"]];
//    myBgView.frame = CGRectMake(0, 0, 320, 480);
//    myBgView.userInteractionEnabled = NO;
//    [self.view addSubview:myBgView];
    
}


@end
