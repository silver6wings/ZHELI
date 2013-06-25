#import "OptionTableViewController.h"

@implementation OptionTableViewController

- (id)initWithCode:(NSString*)code {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {   
        UIImage* image = [UIImage imageNamed:@"zheli_tabbar3.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
        self.title = @"设置";
    }
    return self;
}

- (void) loadView {   
    [super loadView];       
    
    //******* left button *******
    
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
    [button1 addTarget:self 
                action:@selector(selfCard:) 
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setImage:[UIImage imageNamed:@"btNameCard.png"] 
             forState:UIControlStateNormal];
    
    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.leftBarButtonItem = buttonItem1;
    [buttonItem1 release];
    [button1 release];
    
    //******* right button *******
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
    [button2 addTarget:self 
                action:@selector(logout:) 
      forControlEvents:UIControlEventTouchUpInside];
    [button2 setImage:[UIImage imageNamed:@"btLogout.png"] 
             forState:UIControlStateNormal];
    
    UIBarButtonItem * buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:button2];
    self.navigationItem.rightBarButtonItem = buttonItem2;
    [buttonItem2 release];
    [button2 release];
}

- (IBAction) selfCard:(id)sender{    
    UINavigationController * nav = [[UINavigationController alloc] init];
    MyCardTableViewController * pController = [[MyCardTableViewController alloc] init];
    
    [nav pushViewController:pController animated:NO]; 
    
    //    nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:nav animated:YES];
    [nav release];
    [pController release];
    
}

- (IBAction) logout:(id)sender{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"autoLogin"];
    [[ZheliURLRequest instance] sendLogout:self];
}

#pragma Alert

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    UINavigationController * navViewController = [[UINavigationController alloc] init];
    LoginViewController* loginViewController = [[LoginViewController alloc] init];
    
    [navViewController pushViewController:loginViewController animated:YES];
    [self presentModalViewController:navViewController animated:YES];
    
    [navViewController release];
    [loginViewController release];
}

//////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView{ return 1; }

- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section{ return @""; }

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0: return 2;
            //        case 1: return 1;
            //        case 2: return 4;
            //        case 3: return 2;
        default: return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	// Dequeue or create a cell
	UITableViewCellStyle style =  UITableViewCellStyleDefault;
	UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:@"BaseCell"];
	if (!cell) cell = [[[UITableViewCell alloc] initWithStyle:style reuseIdentifier:@"BaseCell"] autorelease];
    
    if (indexPath.section == 0 && indexPath.row == 0) cell.textLabel.text = @"反馈"; 
    if (indexPath.section == 0 && indexPath.row == 1) cell.textLabel.text = @"关于"; 
    
    //    if (indexPath.section == 2 && indexPath.row == 0) cell.textLabel.text = @"在新浪微博上关注我们"; 
    //    if (indexPath.section == 2 && indexPath.row == 1) cell.textLabel.text = @"在腾讯微博上关注我们"; 
    //    if (indexPath.section == 2 && indexPath.row == 2) cell.textLabel.text = @"到iTunes留下评论"; 
    //    if (indexPath.section == 2 && indexPath.row == 3) cell.textLabel.text = @"微博分享"; 
    
    //    if (indexPath.section == 3 && indexPath.row == 0) cell.textLabel.text = @"提示音"; 
    //    if (indexPath.section == 3 && indexPath.row == 1) cell.textLabel.text = @"关于"; 
    
    
    cell.textLabel.textColor = [UIColor blackColor];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.editingAccessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        [MobClick showFeedback:self];
        
//        FeedbackViewController * feedbackVC = [[FeedbackViewController alloc] init];
//        [self.navigationController pushViewController:feedbackVC animated:YES];
//        [feedbackVC release];
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        AboutViewController * aboutVC = [[AboutViewController alloc] init];
        [self.navigationController pushViewController:aboutVC animated:YES];
        [aboutVC release];
    }
}

@end