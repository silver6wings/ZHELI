#import "LastView.h"

@implementation LastView

-(id)init{
    if(self = [super init]){
        self.view = [[[UIView alloc] init] autorelease];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [[[ShareData sharedInstance].tvcNearby.dataSource model] load:TTURLRequestCachePolicyNone more:YES];
}

@end
