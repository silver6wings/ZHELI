#import <Three20/Three20.h>

#import "SWUtils.h"
#import "ListModel.h"
#import "ActivityPageTableItem.h"
#import "ActivityPageTableItemCell.h"

#import "ALastButtonCell.h"

@interface ActivityPageDataSource : TTListDataSource{
    ListModel * myModel;
}

+(ActivityPageDataSource *) pageDataSource;

@end
