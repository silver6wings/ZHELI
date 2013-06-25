/*
 LocalFile:
 
 String userName
 String userPassword
 String userID
 String key
 BOOL autoLogin
 BOOL autoSave
 
 ShareDate：
 
 String actId
 
*/

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface ShareData : NSObject {
    
    BOOL firstLogin;
    NSString * sStrUid;
    UITabBarController * tabBar;
    TTTableViewController * tvcNearby;
    TTTableViewController * tvcAct;
    TTTableViewController * tvcActMine;
    TTTableViewController * tvcContact;
    TTTableViewController * tvcMsg;
    
//    NSInteger sIntLoginSuccess;
//    NSString *sStrLoginName;
//    NSString *sStrLoginPassword;
//    NSString *sStrLoginSession;
//    NSInteger sIntLoginAuto;   
    
}


@property BOOL firstLogin;
@property(nonatomic, retain) NSString * sStrUid;
@property(nonatomic, retain) UITabBarController * tabBar;
@property(nonatomic, retain) TTTableViewController * tvcNearby;
@property(nonatomic, retain) TTTableViewController * tvcAct;
@property(nonatomic, retain) TTTableViewController * tvcActMine;
@property(nonatomic, retain) TTTableViewController * tvcContact;
@property(nonatomic, retain) TTTableViewController * tvcMsg;

//@property(nonatomic,readwrite)NSInteger sIntLoginSuccess;
//@property(nonatomic,assign)NSString *sStrLoginName;
//@property(nonatomic,assign)NSString *sStrLoginPassword;
//@property(nonatomic,assign)NSString *sStrLoginSession;
//@property(nonatomic,readwrite)NSInteger sIntLoginAuto;



+ (ShareData*) sharedInstance;

-(NSString*)formatTime:(NSString*)strTime;

@end
