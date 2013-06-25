#import "ActivityRecommendDataSource.h"

@implementation ActivityRecommendDataSource

+(ActivityRecommendDataSource*)pageDataSource
{
    ActivityRecommendDataSource* dataSource =  [[ActivityRecommendDataSource alloc] init];
	return dataSource;
}

- (id)init{
	self = [super init];
    if (self) {
        myModel = [[ListModel alloc] initWithParentDS:@"ActivityRecommend"];
    }
    
    return self;
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(myModel);
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *)pageList{
    return myModel.pageList; 
}

- (id <TTModel>)model{
    return myModel; 
}

- (void)tableViewDidLoadModel:(UITableView*)tableView {
    
    UIImage * img = [UIImage imageNamed:@"defaultActivity2.png"];
    [self.items removeAllObjects];
    
    for (NSDictionary * item in myModel.pageList) {
        NSString * tmember;
        if ([SW_NUM2STR([item objectForKey:@"type"]) isEqualToString:@"1"]) {
            tmember = [item objectForKey:@"joininCount"];
        } else {
            tmember = [item objectForKey:@"attentionCount"];
        }
        [self.items addObject:[ActivityPageTableItem itemWithText:@"NONE" 
                                                         imageURL:[item objectForKey:@"imageUrl"]
                                                     defaultImage:img
                                                       imageStyle:nil
                                                          company:nil
                                                             name:[item objectForKey:@"activityName"]
                                                         location:[item objectForKey:@"address"]
                                                             date:[item objectForKey:@"startTime"]
                                                             time:[item objectForKey:@"endTime"]
                                                          members:SW_OBJ2STR(tmember)
                                                              URL:SW_STRADD2(@"tt://activities/detail/",SW_OBJ2STR([item objectForKey:@"activityId"]))
                               ]
         ];
    }
    [super tableViewDidLoadModel:tableView];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object {    
	if ([object isKindOfClass:[ActivityPageTableItem class]]) { 
		return [ActivityPageTableItemCell class]; 		
	} else { 
		return [super tableView:tableView cellClassForObject:object]; 
	}
}



@end
