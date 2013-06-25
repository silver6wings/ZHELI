#import "ShareData.h"

#import "ActivityMineController.h"
//#import "TabBarController.h"
//#import "LoginViewController.h"
//
//#import "NearbyViewController.h"
//#import "ActivityTableViewController.h"
//#import "ActivityDetailController.h"
//
//#import "ContactTableViewController.h"
//#import "MessageTableViewController.h"
//#import "SessionController.h"
//
//#import "ProfileTableViewController.h"
//#import "OptionTableViewController.h"
//#import "CardViewController.h"

static ShareData *_instance;

@implementation ShareData
@synthesize firstLogin, sStrUid, tabBar, tvcNearby, tvcAct, tvcActMine, tvcContact, tvcMsg;

+ (ShareData*)sharedInstance{
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}


+ (id)allocWithZone:(NSZone *)zone{	
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];			
            return _instance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone{ return self; }

- (id)retain{ return self; }

- (unsigned)retainCount{ return UINT_MAX; }

- (id)autorelease{ return self;	}

- (void)release{ return; }


#pragma mark -
#pragma mark Custom Methods

// Add your custom methods here
-(NSString*)formatTime:(NSString*)strTime
{
    int intAllTimess = [strTime intValue];
    int intDay = intAllTimess/(24*60);
    NSString *strDay = [NSString stringWithFormat:@"%d",intDay];
    int intHour = (intAllTimess%(24*60));
    NSString *strHours = [NSString stringWithFormat:@"%d",(intHour/60)];
    int intMinutes = (intHour%60);
    NSString *strMinutes = [NSString stringWithFormat:@"%d",intMinutes];
    if (intDay>0) {
        return [NSString stringWithFormat:@"%@%@%@%@%@%@",strDay,NSLocalizedString(@"day",nil),strHours,NSLocalizedString(@"hours",nil),strMinutes,NSLocalizedString(@"minutes",nil)];
    }
    else
    {
        if (intHour>0) {
            return [NSString stringWithFormat:@"%@%@%@%@",strHours,NSLocalizedString(@"hours",nil),strMinutes,NSLocalizedString(@"minutes",nil)];
        }
        else
        {
            return [NSString stringWithFormat:@"%@%@",strMinutes,NSLocalizedString(@"minutes",nil)];
        }
    }
    
}
@end
