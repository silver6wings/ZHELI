#import "ActivityMineController.h"


@implementation ActivityMineController

-(id)init{
    if((self = [super init])){
        [ShareData sharedInstance].tvcActMine = self;
    }
    return self;
}

- (void) loadView {   
    [super loadView];       
    
    self.variableHeightRows = YES;
    self.dataSource = [ActivityMineDataSource pageDataSource];
    
    //******* left button *******
    
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
    [button1 addTarget:self 
                action:@selector(finished) 
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setImage:[UIImage imageNamed:@"btComplete.png"] 
             forState:UIControlStateNormal];
    
    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.leftBarButtonItem = buttonItem1;
    [buttonItem1 release];
    [button1 release];
}

- (id <TTTableViewDelegate>) createDelegate {
    TTTableViewDragRefreshDelegate *delegate = [[TTTableViewDragRefreshDelegate alloc] initWithController:self];
    return [delegate autorelease];
}

- (void) finished{
    [self dismissModalViewControllerAnimated:YES];
}

@end
