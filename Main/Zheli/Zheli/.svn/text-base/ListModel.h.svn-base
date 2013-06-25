#import <Three20/Three20.h>
#import <extThree20JSON/extThree20JSON.h>

#import "ShareData.h"
#import "SWUtils.h"
#import "SWLocation.h"

@interface ListModel : TTURLRequestModel{
    NSArray * pageList;
    NSString * parentDS;
    
    NSUInteger page;
    BOOL _loadmore;
}

@property (nonatomic,retain) NSArray * pageList;
@property (nonatomic,retain) NSString * parentDS;

@property (nonatomic,readwrite) NSUInteger page;
@property (nonatomic,readwrite) BOOL _loadmore;

- (id)initWithParentDS:(NSString *)pds;

@end
