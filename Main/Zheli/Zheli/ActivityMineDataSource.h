#import "Three20/Three20.h"
#import "ListModel.h"
#import "ActivityMineDataSource.h"
#import "ActivityPageTableItem.h"
#import "ActivityPageTableItemCell.h"

#import "AMLastButtonCell.h"

@interface ActivityMineDataSource : TTListDataSource
{
    ListModel * myModel;
}

+(ActivityMineDataSource *) pageDataSource;

@end
