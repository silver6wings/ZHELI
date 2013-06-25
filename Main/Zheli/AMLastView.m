#import "AMLastView.h"

@implementation AMLastView

-(id)init{
    if(self = [super init]){
        self.view = [[[UIView alloc] init] autorelease];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [[[ShareData sharedInstance].tvcActMine.dataSource model] load:TTURLRequestCachePolicyNone more:YES];
}

@end
