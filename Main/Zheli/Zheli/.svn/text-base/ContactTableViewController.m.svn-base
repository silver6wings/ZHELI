#import "ContactTableViewController.h"

@implementation ContactTableViewController

//@synthesize searchBar;
//            delegate = _delegate;

- (id)initWithCode:(NSString*)code {
    if ((self = [super init])) {
        UIImage* image = [UIImage imageNamed:@"zheli_tabbar2.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
        self.title = @"联系人";
        [ShareData sharedInstance].tvcContact = self;
    }
    return self;
}
- (void)dealloc{
//    [searchBar release];
    [super dealloc];
}

- (id <TTTableViewDelegate>) createDelegate {
    TTTableViewDragRefreshDelegate *delegate = [[TTTableViewDragRefreshDelegate alloc] initWithController:self];
    return [delegate autorelease];
}

- (void)loadView {
    [super loadView];
    
    self.variableHeightRows = YES;
    self.dataSource = [ContactPageDataSource pageDataSource];
    
//    TTTableViewController* searchController = [[[TTTableViewController alloc] init] autorelease];
//    searchController.dataSource = [ContactPageDataSource pageDataSourceWithLocation];
//    self.searchViewController = searchController;
//    self.tableView.tableHeaderView = _searchController.searchBar;
//    
//    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
//    searchBar.tintColor = [UIColor blackColor];
//    searchBar.delegate = self;
//    searchBar.showsCancelButton = NO;
//    self.tableView.tableHeaderView = searchBar;
    
    //******* left button *******    
    
//    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
//    [button1 addTarget:self 
//                action:@selector(refreshTable:)
//      forControlEvents:UIControlEventTouchUpInside];
//    [button1 setImage:[UIImage imageNamed:@"btRefresh.png"] 
//             forState:UIControlStateNormal];
//    
//    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
//    self.navigationItem.leftBarButtonItem = buttonItem1;
//    [buttonItem1 release];
//    [button1 release];
    
    //******* right button ********   
    
//    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
//    [button2 addTarget:self 
//                action:nil 
//      forControlEvents:UIControlEventTouchUpInside];
//    [button2 setImage:[UIImage imageNamed:@"btAdd.png"] 
//             forState:UIControlStateNormal];
//    
//    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:button2];
//    self.navigationItem.rightBarButtonItem = buttonItem2;
//    [buttonItem2 release];
//    [button2 release];
    
}


//- (IBAction)refreshTable:(id)sender{
//    SYSOUT(@"testRefresh");
//    [self.tableView reloadData];
//    [self reload];
//    
//}

/*
#pragma Delegate?

- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath*)indexPath {
    [_delegate searchTestController:self didSelectObject:object];
}

- (void)textField:(TTSearchTextField*)textField didSelectObject:(id)object {
    [_delegate searchTestController:self didSelectObject:object];
}

#pragma mark UISearchBarDelegate methods

- (void) searchBarSearchButtonClicked: (UISearchBar *)theSearchBar {
    NSString * strSearch = [theSearchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[NSUserDefaults standardUserDefaults] setValue:strSearch forKey:@"strSearch"];
    TTOpenURL([NSString stringWithFormat:@"tt://page/search"]);
}


- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

- (void) searchBar: (UISearchBar *)searchBar textDidChange: (NSString *)searchText {}
- (void) searchBarTextDidBeginEditing:(UISearchBar *)aSearchBar {}
*/

@end
