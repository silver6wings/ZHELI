#import "ActivityDMemberDataSource.h"

@implementation ActivityDMemberDataSource

+(ActivityDMemberDataSource *)pageDataSource{
    ActivityDMemberDataSource * dataSource =  [[[ActivityDMemberDataSource alloc] init] autorelease];
	return dataSource;
}

// *******

- (id)init{
    if ((self = [super init])) {
        myModel = [[ListModel alloc] initWithParentDS:@"ActivityDMember"];
    }
    return self;
}
- (void)dealloc {
    TT_RELEASE_SAFELY(myModel);
	[super dealloc];
}

- (void)tableViewDidLoadModel:(UITableView *)tableView {
    
    UIImage * img = [UIImage imageNamed:@"defaultPerson.png"];
    [self.items removeAllObjects];
    
    for(NSDictionary * item in myModel.pageList){
        [self.items addObject:[ContactPageTableItem itemWithText:nil
                                                        imageURL:[item objectForKey:@"headURL"]
                                                    defaultImage:img
                                                      imageStyle:nil 
                                                        userName:[item objectForKey:@"name"]
                                                     userCompany:[item objectForKey:@"organization"]
                                                        userArea:SW_OBJ2STR([item objectForKey:@"location"])
                                                      userCareer:[item objectForKey:@"vocation"]
                                                      contactNum:SW_OBJ2STR([item objectForKey:@"friendsCount"])
                                          contactInterSectionNum:[item objectForKey:@""]
                                                        distance:[item objectForKey:@""]
                                                            time:[item objectForKey:@""]
                                                             URL:SW_STRADD3(@"tt://card/",SW_OBJ2STR([item objectForKey:@"userId"]),@"/NO")
                               ]
         ];
    }
    
    [super tableViewDidLoadModel:tableView];
}


///////////////////////////////////////////////////////////////////////////////////////////////////

- (NSArray *)pageList { return myModel.pageList; }

- (id <TTModel>)model { return myModel; }

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object { 
	if ([object isKindOfClass:[ContactPageTableItem class]]) { 
		return [ContactPageTableItemCell class]; 		
	} else { 
		return [super tableView:tableView cellClassForObject:object]; 
	}
}


@end
