#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import <Three20UI/UIViewAdditions.h>

#import "ActivityDMember.h"
#import "ZheliURLRequest.h"

@interface ActivityDetailController : TTViewController {
    BOOL Joined;
    NSString * myID;
    NSString * myIntro;
    
    UILabel * lbDetail;
    UIScrollView * uiScroll;

//    UIButton * btIntro;
//    UIButton * btAddr;
//    UIButton * btCont;   
//    UISegmentedControl * segmentedControl;
//
//    ActivityDetailJoinController * adjTableController;
//    ActivityDetailWeiboController * adwTableController;
}

@property BOOL Joined;
@property (nonatomic, retain) NSString * myID;
@property (nonatomic, retain) NSString * myIntro;

@property (nonatomic, retain) UILabel * lbDetail;
@property (nonatomic, retain) UIScrollView * uiScroll;

- (void)refreshJoined;
- (void)refreshIntro;

- (IBAction)toMember:(id)sender;
- (IBAction)actJoin:(id)sender;
- (IBAction)actExit:(id)sender;
- (IBAction)back:(id)sender;
    

@end

