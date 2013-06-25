#import "NearbyPageDataSource.h"

@implementation NearbyPageDataSource

+(NearbyPageDataSource*)pageDataSource{
    NearbyPageDataSource * dataSource =  [[[NearbyPageDataSource alloc] init] autorelease];
	return dataSource;
}

// *******

- (id)init{
    if ((self = [super init])) {
        myModel = [[ListModel alloc] initWithParentDS:@"NearBy"];
    }
    return self;
}
- (void)dealloc {
    TT_RELEASE_SAFELY(myModel);
	[super dealloc];
}

- (void)tableViewDidLoadModel:(UITableView *)tableView {
    
    if (!myModel._loadmore) {
        [self.items removeAllObjects];
    }
    
    NSMutableArray * items = [[NSMutableArray alloc] init];
    UIImage * img = [UIImage imageNamed:@"defaultPerson.png"];
    
    
    for(NSDictionary * item in myModel.pageList){
        NSNumber * tDis = [item objectForKey:@"distance"];
        NSNumber * tDis2 = [NSNumber numberWithInt:[tDis intValue]];
        NSString * tDis3 = [tDis2 stringValue];
        
        NSNumber * tDis4 = [item objectForKey:@"isFriend"];
        NSString * tDis5 = @"/NO";
        if ([tDis4 isEqualToNumber:[NSNumber numberWithBool:true]]) {
            tDis5 = @"/YES";
        }
        
        [items addObject:[ContactPageTableItem itemWithText:nil
                                                        imageURL:[item objectForKey:@"headURL"]
                                                    defaultImage:img
                                                      imageStyle:nil 
                                                        userName:[item objectForKey:@"name"]
                                                     userCompany:[item objectForKey:@"organization"]
                                                        userArea:SW_OBJ2STR([item objectForKey:@"location"])
                                                      userCareer:[item objectForKey:@"vocation"]
                                                      contactNum:SW_OBJ2STR([item objectForKey:@"friendsCount"])
                                          contactInterSectionNum:[item objectForKey:@""]
                                                        distance:tDis3
                                                            time:[item objectForKey:@"lastActTime"]
                                                             URL:SW_STRADD3(@"tt://card/",SW_OBJ2STR([item objectForKey:@"userId"]),tDis5)
                               ]
         ];
    }
    
    if([items count] == 10){
        [items addObject:[TTTableMoreButton itemWithText:NSLocalizedString(@"加载更多",nil)]];

    }
    
    if (myModel._loadmore) {
        [self.items removeLastObject];
    }
     
    [self.items addObjectsFromArray:items];
    [items release];
    
    
    [super tableViewDidLoadModel:tableView];
}


///////////////////////////////////////////////////////////////////////////////////////////////////

- (NSArray *)pageList { return myModel.pageList; }

- (id <TTModel>)model { return myModel; }

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object { 
	if ([object isKindOfClass:[ContactPageTableItem class]]) 
    { 
		return [ContactPageTableItemCell class]; 
	} 
    else if ([object isKindOfClass:[TTTableMoreButton class]]) 
    { 
        return [LastButtonCell class];	
	} 
    else 
    { 
		return [super tableView:tableView cellClassForObject:object]; 
	}
}


@end
