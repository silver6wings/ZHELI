#import <Three20/Three20.h>

#import "SWUtils.h"
#import "SWString.h"
#import "ZheliURLRequest.h"
#import "CardSendController.h"
#import "SessionController.h"

@interface CardViewController : TTViewController {    
    
    NSString * friends;
    NSString * myID;
    NSDictionary * myInfo;
    
    UILabel * lbName;
    UILabel * lbSex;
    UILabel * lbMarry;
    UILabel * lbBirthday;
    UILabel * lbStatus;
    UILabel * lbTrade;
    UILabel * lbAddress;
    UILabel * lbCompany;
    UILabel * lbSchool;
    UILabel * lbNumOfContact;
    UILabel * lbIntro;
    
    UILabel * lbEmail;
    UILabel * lbPhone;
    UILabel * lbMobile;
    UILabel * lbMSN;
    UILabel * lbQQ;
    
    TTImageView * imgIcon;
}

@property (nonatomic, retain) NSString * friends;
@property (nonatomic, retain) NSString * myID;
@property (nonatomic, retain) NSDictionary * myInfo;

+ (UILabel *)addLabel:(UILabel *)label 
         toController:(UIViewController *)controller
         withFontSize:(int)fontSize
                    x:(int)x
                    y:(int)y
                width:(int)width
               height:(int)height;

- (id)initWithCard:(NSString *)card
          isFriend:(NSString *)isf;

- (void)update;
- (void)refresh;

- (IBAction)sendCard:(id)sender;
- (IBAction)back:(id)sender;

@end
