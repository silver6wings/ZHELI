#import "Three20/Three20.h"
#import "ListModel.h"
#import "ActivityRecommendDataSource.h"
#import "ActivityPageTableItem.h"
#import "ActivityPageTableItemCell.h"

@interface ActivityRecommendDataSource : TTListDataSource
{
    ListModel * myModel;
}

+(ActivityRecommendDataSource *) pageDataSource;

@end
