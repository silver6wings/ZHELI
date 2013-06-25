#import "MessageDataSource.h"

@implementation MessageDataSource

+(MessageDataSource*)pageDataSource{
    MessageDataSource * dataSource =  [[[MessageDataSource alloc] init] autorelease];
	return dataSource;
}

// *******

- (id)init{
    if ((self = [super init])) {
        myModel = [[ListModel alloc] initWithParentDS:@"Message"];
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
        
        [self.items addObject:[MessagePageItem itemWithText:nil 
                                                   imageURL:[item objectForKey:@"head"]
                                               defaultImage:img 
                                                 imageStyle:nil 
                                                       name:[item objectForKey:@"userName"]
                                                    content:[item objectForKey:@"num"] 
                                                        URL:SW_STRADD2(@"tt://session/",SW_OBJ2STR([item objectForKey:@"fromuid"]))
                               ]
         ];      
    }
    
    [super tableViewDidLoadModel:tableView];
}


///////////////////////////////////////////////////////////////////////////////////////////////////

- (NSArray *)pageList { return myModel.pageList; }

- (id <TTModel>)model { return myModel; }

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object { 
	if ([object isKindOfClass:[MessagePageItem class]]) { 
		return [MessagePageItemCell class]; 		
	} else { 
		return [super tableView:tableView cellClassForObject:object]; 
	}
}


@end
