#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

#import "ActivityDMemberDataSource.h"
#import "ShareData.h"

@interface ActivityDMember : TTTableViewController {
}

- (id)initWithId:(NSString*)actId;

- (IBAction)back:(id)sender;

@end
