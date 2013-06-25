#import "CLastView.h"

@implementation CLastView

-(id)init{
    if(self = [super init]){
        self.view = [[[UIView alloc] init] autorelease];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [[[ShareData sharedInstance].tvcContact.dataSource model] load:TTURLRequestCachePolicyNone more:YES];
}

@end
