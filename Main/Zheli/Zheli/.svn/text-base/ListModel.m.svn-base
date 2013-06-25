#import "ListModel.h"

@implementation ListModel
@synthesize pageList,parentDS,page,_loadmore;

- (id)initWithParentDS:(NSString *)pds{
    if ((self = [super init])) {
        self.parentDS = pds;
        self.page = 1;
        srandom(time(NULL));
    }
    return self;
}

- (void)dealloc {
	TT_RELEASE_SAFELY(pageList);
	[super dealloc];
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
    TTURLRequest * request;
    NSString * turl;
    
    if(more){
        page ++;
        _loadmore = YES;
        NSLog(@"Loading more....");
    } else {
        page = 1;
        _loadmore = NO;
    }
    
    // ==== Send Finished ====
    {
        if ([parentDS isEqualToString:@"NearBy"]){
            // ==== NearBy Page DataSource ====
            NSString * lat = [[NSUserDefaults standardUserDefaults] objectForKey:@"swLatitude"];    
            NSString * lng = [[NSUserDefaults standardUserDefaults] objectForKey:@"swLongitude"];    
            NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
            
            turl = [NSString stringWithFormat:
                    SW_STRADD3(SW_URL, @"/user/list?", @"lat=%@&lng=%@&cur=%d&secretkey=%@&json=1") ,
                    lat,lng,page,key];
        }
        
        if ([parentDS isEqualToString:@"Contact"]) {
            // ==== Contact Page DataSource ====
            NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
            turl = [NSString stringWithFormat:
                    SW_STRADD3(SW_URL, @"/user/contact/list?", @"cur=%d&secretkey=%@&json=1"),
                    page,key];
        }
        
        if ([parentDS isEqualToString:@"Activity"]) {
            // ==== Activity Page DataSource ====
            //    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
            //    turl = [NSString stringWithFormat:SW_STRADD3(SW_URL, @"/activity/list?", @"secretkey=%@&json=1"),
            //                       key];
            turl = [NSString stringWithFormat:
                    SW_STRADD3(SW_URL, @"/activity/list?", @"cur=%d&json=1"),
                    page];
        }
        
        if ([parentDS isEqualToString:@"ActivityMine"]) {
            // ==== ActivityMine Page DataSource ====
            NSString * userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
            turl = [NSString stringWithFormat:
                    SW_STRADD3(SW_URL, @"/activity/myattend/list?", @"cur=%d&userId=%@&json=1"),
                    page,userId];
        }
        
        if ([parentDS isEqualToString:@"ActivityRecommend"]) {
            // ==== ActivityRecommend Page DataSource ====
            turl = SW_STRADD3(SW_URL, @"/activity/recommend/list?", @"json=1");
        }   
        
        if ([parentDS isEqualToString:@"ActivityDMember"]){  
            // ==== ActivityDMember DataSource ====
            NSString * tid = [[ShareData sharedInstance] sStrUid];
            turl = [NSString stringWithFormat:
                               SW_STRADD3(SW_URL, @"/activity/attenduser/list?", @"activityId=%@&json=1") ,
                               tid];
        }
        
        if ([parentDS isEqualToString:@"Message"]){  
            // ==== Message ====
            NSString * tkey = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
            turl = [NSString stringWithFormat:
                               SW_STRADD3(SW_URL, @"/chat/msg/tips/all/list?", @"secretkey=%@&json=1") ,
                               tkey];
        }
    }
    
    // ==== Send Request ====
    NSString * ran = [NSString stringWithFormat:@"&random=%d",random()];
    turl = SW_STRADD2(turl, ran);
    
    request = [TTURLRequest requestWithURL:turl delegate: self];
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    [request setCachePolicy:cachePolicy];
    [request setCacheExpirationAge:TT_CACHE_EXPIRATION_AGE_NEVER];
    
    if(![request send]){
        [self didStartLoad];
    }
}

- (void)requestDidFinishLoad:(TTURLRequest *)request {   
    NSLog(@"Finish load ListMode: %@", parentDS);
    
    TTURLJSONResponse * response = (TTURLJSONResponse *)request.response;
    TTDASSERT([response.rootObject isKindOfClass:[NSDictionary class]]);
    NSDictionary * rootObject = response.rootObject;
    // All rootObject is NSDictionary
    NSArray * err = [rootObject mutableArrayValueForKey:@"actionErrors"];
    
    // ==== Finish Receive ====
    if([err count] == 0){
        // ==== NearBy Page DataSource ====
        if ([parentDS isEqualToString:@"NearBy"]){
            self.pageList = [rootObject mutableArrayValueForKey:@"userlist"];
        }
        
        // ==== Contact Page DataSource ====
        if ([parentDS isEqualToString:@"Contact"]) {
            self.pageList = [rootObject mutableArrayValueForKey:@"catactslist"];
        }
        
        // ==== Activity Page DataSource ====
        if ([parentDS isEqualToString:@"Activity"]) {
            self.pageList = [rootObject mutableArrayValueForKey:@"actList"];
        }
        
        // ==== ActivityMine Page DataSource ====
        if ([parentDS isEqualToString:@"ActivityMine"]) {
            self.pageList = [rootObject mutableArrayValueForKey:@"actList"];
        }
        
        // ==== ActivityRecommend Page DataSource ====
        if ([parentDS isEqualToString:@"ActivityRecommend"]) {
            self.pageList = [rootObject mutableArrayValueForKey:@"actList"];
        }
        
        // ==== Activity Attend User ====
        if ([parentDS isEqualToString:@"ActivityDMember"]){
            self.pageList = [rootObject mutableArrayValueForKey:@"userlist"];
        }
        
        // ==== Message ====
        if ([parentDS isEqualToString:@"Message"]){
            self.pageList = [rootObject mutableArrayValueForKey:@"allMsgTips"];
        }
    } else {
        for (int i = 0 ; i < [err count]; i++) {
            TTAlertNoTitle([err objectAtIndex:i]);
        }
    }
    

    
    // ==== Finish Loading ====
    [self invalidate:YES];
    [super requestDidFinishLoad:request];
}

- (void)request:(TTURLRequest *)request didFailLoadWithError:(NSError *)error {
	NSLog(@"Fail: %@",error);
    TTAlert([[error userInfo] valueForKey:@"fault"]);
    [super request:request didFailLoadWithError:error];
}


@end
