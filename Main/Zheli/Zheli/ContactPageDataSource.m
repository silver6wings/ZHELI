#import "ContactPageDataSource.h"

@implementation ContactPageDataSource

+(ContactPageDataSource*)pageDataSource{
    ContactPageDataSource * dataSource =  [[[ContactPageDataSource alloc] init] autorelease];
	return dataSource;
}

// *******

- (id)init{
    if ((self = [super init])) {
        myModel = [[ListModel alloc] initWithParentDS:@"Contact"];
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
       
        [items addObject:[ContactPageTableItem itemWithText:nil
                                                        imageURL:[item objectForKey:@"headURL"]
                                                    defaultImage:img
                                                      imageStyle:nil 
                                                        userName:[item objectForKey:@"name"]
                                                     userCompany:[item objectForKey:@"organization"]
                                                        userArea:[item objectForKey:@"location"]
                                                      userCareer:[item objectForKey:@"vocation"]
                                                      contactNum:SW_OBJ2STR([item objectForKey:@"friendsCount"])
                                          contactInterSectionNum:[item objectForKey:@""]
                                                        distance:[item objectForKey:@""]
                                                            time:[item objectForKey:@""]
                                                             URL:SW_STRADD3(@"tt://card/",SW_OBJ2STR([item objectForKey:@"userId"]),@"/YES")
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
        return [CLastButtonCell class];	
	} 
    else 
    { 
		return [super tableView:tableView cellClassForObject:object]; 
	}
}


@end
