#import "ShareData.h"
#import "ZheliAppDelegate.h"

#import "TabBarController.h"
#import "LoginViewController.h"

#import "NearbyViewController.h"
#import "ActivityTableViewController.h"
#import "ActivityDetailController.h"

#import "ContactTableViewController.h"
#import "MessageTableViewController.h"
#import "SessionController.h"

#import "OptionTableViewController.h"
#import "CardViewController.h"


@implementation ZheliAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{   
    [ShareData sharedInstance].firstLogin = YES;
    
    [MobClick setDelegate:self reportPolicy:BATCH]; // Add umeng
    
    if ([[UINavigationBar class] respondsToSelector:@selector(appearance)]) {
        UIImage *img = [UIImage imageNamed: @"navigationBarBg3.png"];
        [[UINavigationBar appearance] setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    }

    TTNavigator * navigator = [TTNavigator navigator];
    navigator.persistenceMode = TTNavigatorPersistenceModeAll;
    navigator.window = [[UIWindow alloc] initWithFrame:TTScreenBounds()];
    [navigator.window makeKeyAndVisible];
    [navigator.window release];
    
//    TTURLAction * action =  [TTURLAction actionWithURLPath:@"tt://login"];
//    [navigator openURLAction:action];
    
    UINavigationController * navViewController = [[UINavigationController alloc] init];  
    LoginViewController * loginViewController = [[LoginViewController alloc] initWithNavController:(UINavigationController *)navigator.window.rootViewController];
    
    navigator.window.rootViewController = navViewController;
    [navViewController pushViewController:loginViewController animated:NO];
    
    [navViewController release];
    [loginViewController release];
    
//    TTNavigator* navigator = [TTNavigator navigator];
//    navigator.persistenceMode = TTNavigatorPersistenceModeAll;
//    navigator.window = [[[UIWindow alloc] initWithFrame:TTScreenBounds()] autorelease];
    
    TTURLMap * map = navigator.URLMap;
    [map from:@"*" toSharedViewController:[TTWebController class]];
    
    [map from:@"tt://tabBar" toSharedViewController:[TabBarController class]];
    [map from:@"tt://login" toViewController:[LoginViewController class]];
    
    [map from:@"tt://nearby/(initWithCode:)" toSharedViewController:[NearbyViewController class]];
    [map from:@"tt://activities/(initWithCode:)" toSharedViewController:[ActivityTableViewController class]];
    [map from:@"tt://activities/detail/(initWithID:)" toViewController:[ActivityDetailController class]];
    [map from:@"tt://contact/(initWithCode:)" toSharedViewController:[ContactTableViewController class]];
    
    [map from:@"tt://message/(initWithCode:)" toSharedViewController:[MessageTableViewController class]];
    [map from:@"tt://session/(initWithCode:)" toViewController:[SessionController class]];
    
    [map from:@"tt://option/(initWithCode:)" toSharedViewController:[OptionTableViewController class]];     
    [map from:@"tt://card/(initWithCard:)/(isFriend:)" toViewController:[CardViewController class]];   
    
//    if (![navigator restoreViewControllers]) {
//        [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://login"]];
//    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application{}
- (void)applicationDidEnterBackground:(UIApplication *)application{}
- (void)applicationWillEnterForeground:(UIApplication *)application{}
- (void)applicationDidBecomeActive:(UIApplication *)application{}
- (void)applicationWillTerminate:(UIApplication *)application{}

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)appKey{
    return @"4ef183525270157e6a00000d";
}

@end
