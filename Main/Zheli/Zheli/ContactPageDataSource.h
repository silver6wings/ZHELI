#import <Three20/Three20.h>

#import "ListModel.h"
#import "ContactPageTableItem.h"
#import "ContactPageTableItemCell.h"

#import "CLastButtonCell.h"


@interface ContactPageDataSource : TTListDataSource
{
    ListModel * myModel;
}

+(ContactPageDataSource *)pageDataSource;

@end
