#import <Three20/Three20.h>

#import "SWUtils.h"
#import "ListModel.h"
#import "ContactPageTableItem.h"
#import "ContactPageTableItemCell.h"

#import "LastButtonCell.h"


@interface NearbyPageDataSource : TTListDataSource
{
    ListModel * myModel;
}

+(NearbyPageDataSource*)pageDataSource;

@end
