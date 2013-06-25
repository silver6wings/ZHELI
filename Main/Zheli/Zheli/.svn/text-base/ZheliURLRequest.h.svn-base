#import <Three20/Three20.h>
#import <extThree20JSON/extThree20JSON.h>

#import "SWUtils.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "CardViewController.h"
#import "OptionTableViewController.h"
#import "ActivityDetailController.h"
#import "SessionController.h"

@interface ZheliURLRequest : NSObject <TTURLRequestDelegate>{
    id delegate;
}

@property (nonatomic,retain) id delegate;

+ (ZheliURLRequest *)instance;

- (void)sendLogin:(id)delegator
                        :(NSString *)strName
                        :(NSString *)strPassword;

- (void)sendLoginAuto:(id)delegator
                            :(NSString *)strName
                            :(NSString *)strPassword;

- (void)sendRegister:(id)delegator
                           :(NSString *)strName
                           :(NSString *)strPassword
                           :(NSString *)strEmail;

- (void)sendLogout:(id)delegator;

- (void)sendCardforSelf:(id)delegator;

- (void)sendCard:(id)delegator
         forUser:(NSString *)userId;

- (void)sendSendingCard:(id)delegator
                 toUser:(NSString *)userId
               withNote:(NSString *)note;

- (void)sendDeleteCard:(id)delegator
                userId:(NSString *)uid;

- (void)sendIsAttendto:(id)delegator
                 actId:(NSString *)actId;

- (void)sendActJoin:(id)delegator
              actId:(NSString *)actId;

- (void)sendActExit:(id)delegator
              actId:(NSString *)actId;

- (void)sendActDetail:(id)delegator
                actId:(NSString *)actId;

- (void)sendChatList:(id)delegator
              userId:(NSString *)userId;

- (void)sendChatMsgSend:(id)delegator
                 userId:(NSString *)uid 
                withMsg:(NSString *)msg;

@end
