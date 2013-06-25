#import <Three20/Three20.h>
#import <UIKit/UIKit.h>
#import "SWUtils.h"
#import "ZheliURLRequest.h"


@interface SessionController : UIViewController < UITextFieldDelegate, UIScrollViewDelegate >{
    NSString * toID;
    NSMutableArray * chatList;
    NSTimer * myTimer;
    
    UIView * vwinput;
    UITextField * txtInput;
    UIScrollView * usCont;
    
    TTShapeStyle * stSend;
    TTShapeStyle * stReceive;
}

@property (nonatomic, retain) NSString * toID;
@property (nonatomic, retain) NSMutableArray * chatList;

@property (nonatomic, retain) UIView * vwInput;
@property (nonatomic, retain) UITextField * txtInput;
@property (nonatomic, retain) UIScrollView * usCont;


- (id)initWithCode:(NSString*)code;

- (void)update;
- (void)refreshView;
- (void)timer;

@end
