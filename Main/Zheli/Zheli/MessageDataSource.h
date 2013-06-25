#import <Three20/Three20.h>
#import "ListModel.h"

#import "MessagePageItem.h"
#import "MessagePageItemCell.h"


@interface MessageDataSource : TTListDataSource
{
    ListModel * myModel;
}

+(MessageDataSource *)pageDataSource;

@end
