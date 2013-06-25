#import "ALastView.h"

@implementation ALastView

-(id)init{
    if(self = [super init]){
        self.view = [[[UIView alloc] init] autorelease];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [[[ShareData sharedInstance].tvcAct.dataSource model] load:TTURLRequestCachePolicyNone more:YES];
}

@end
