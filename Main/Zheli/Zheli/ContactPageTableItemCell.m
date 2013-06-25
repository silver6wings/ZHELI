#import "ContactPageTableItemCell.h"


@implementation ContactPageTableItemCell
@synthesize userName,
            userCompany,
            userAreaAndUserCareer,
            contactNum,
            contactInterSectionNum,
            distanceAndTime,
            lbContact,
            lbContactInterSection,
            iconContact,
            iconContactInterSection;

///////////////////////////////////////////////////////////////////////////////////////////////////

+ (UIFont*)fontForImageItem:(id)imageItem {
    if ([imageItem isKindOfClass:[TTTableRightImageItem class]]) {
        return TTSTYLEVAR(tableSmallFont);
    } else {
        return TTSTYLEVAR(tableSmallFont);
    }
}

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {  
    return 75;
}

///////////////////////////////////////////////////////////////////////////////////////////////////  

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {  
    if ((self = [super initWithStyle:style reuseIdentifier:identifier])) {  
        _item = nil;  
        
        userName = [[UILabel alloc] initWithFrame:CGRectZero];  
        userName.font = [UIFont boldSystemFontOfSize:12];
        userName.textColor = [[UIColor alloc] initWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1];
        userName.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        userName.backgroundColor = [UIColor clearColor];
        userName.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:userName];
        
        userCompany = [[UILabel alloc] initWithFrame:CGRectZero];  
        userCompany.font = [UIFont boldSystemFontOfSize:13];
        userCompany.textColor = [[UIColor alloc] initWithRed:30.0/255.0 green:30.0/255.0 blue:30.0/255.0 alpha:1];
        userCompany.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        userCompany.backgroundColor = [UIColor clearColor];
        userCompany.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:userCompany];
        
        
        userAreaAndUserCareer = [[UILabel alloc] initWithFrame:CGRectZero];  
        userAreaAndUserCareer.font = [UIFont boldSystemFontOfSize:12];
        userAreaAndUserCareer.textColor = [[UIColor alloc] initWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1];
        userAreaAndUserCareer.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        userAreaAndUserCareer.backgroundColor = [UIColor clearColor];
        userAreaAndUserCareer.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:userAreaAndUserCareer];
        
        contactNum = [[UILabel alloc] initWithFrame:CGRectZero];  
        contactNum.font = [UIFont boldSystemFontOfSize:10];
        contactNum.textColor = [[UIColor alloc] initWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1];
        contactNum.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        contactNum.backgroundColor = [UIColor clearColor];
        contactNum.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:contactNum];
        
        contactInterSectionNum = [[UILabel alloc] initWithFrame:CGRectZero];  
        contactInterSectionNum.font = [UIFont boldSystemFontOfSize:10];
        contactInterSectionNum.textColor = TTSTYLEVAR(messageFieldTextColor);
        contactInterSectionNum.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        contactInterSectionNum.backgroundColor = [UIColor clearColor];
        contactInterSectionNum.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:contactInterSectionNum];
        
        distanceAndTime = [[UILabel alloc] initWithFrame:CGRectZero];  
        distanceAndTime.font = [UIFont boldSystemFontOfSize:10];
        distanceAndTime.textColor = TTSTYLEVAR(messageFieldTextColor);
        distanceAndTime.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        distanceAndTime.backgroundColor = [UIColor clearColor];
        distanceAndTime.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:distanceAndTime];
        
        lbContact = [[UILabel alloc] initWithFrame:CGRectZero];  
        lbContact.font = [UIFont boldSystemFontOfSize:10];
        lbContact.textColor = [[UIColor alloc] initWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1];
        lbContact.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        lbContact.backgroundColor = [UIColor clearColor];
        lbContact.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:lbContact];
        
        iconContact = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconContact.png"]];
        [self.contentView addSubview:iconContact];
        
//        lbContactInterSection = [[UILabel alloc] initWithFrame:CGRectZero];  
//        lbContactInterSection.font = [UIFont boldSystemFontOfSize:10];
//        lbContactInterSection.textColor = TTSTYLEVAR(messageFieldTextColor);
//        lbContactInterSection.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
//        lbContactInterSection.backgroundColor = [UIColor clearColor];
//        lbContactInterSection.textAlignment = UITextAlignmentLeft;
//        [self.contentView addSubview:lbContactInterSection];
        
//        iconContactInterSection = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconContactInterSection.png"]];
//        [self.contentView addSubview:iconContactInterSection];
    }  
    return self;  
} 

- (void)dealloc {  
    [userName release];  
    [userCompany release];  
    [userAreaAndUserCareer release]; 
    
    [contactNum release];
    [contactInterSectionNum release];
    [distanceAndTime release]; 
    
    [lbContact release];
    [lbContactInterSection release];
    
    [iconContact release];
    [iconContactInterSection release]; 
    
    [super dealloc];  
}

///////////////////////////////////////////////////////////////////////////////////////////////////  

- (void)layoutSubviews {  
    [super layoutSubviews];  
    
    int userNameX = 60;
    int userNameY = 2;
    int userNameHeight = 17;
    int iconWidth = 10;
    
    self.imageView2.frame           = CGRectMake(5, 5, 50, 50);
    
    userName.frame                  = CGRectMake(userNameX, userNameY, 150, userNameHeight);
    userCompany.frame               = CGRectMake(userNameX, userNameY+userNameHeight, 200, userNameHeight);
    userAreaAndUserCareer.frame     = CGRectMake(userNameX, userNameY+userNameHeight*2+3, 250, userNameHeight);
    
    lbContact.frame                 = CGRectMake(userNameX+iconWidth+3, userNameY+userNameHeight*3+3, 34, userNameHeight);
    lbContactInterSection.frame     = CGRectMake(userNameX+iconWidth+3, userNameY+userNameHeight*4, 45, userNameHeight);
    contactNum.frame                = CGRectMake(userNameX+iconWidth+lbContact.frame.size.width+3, userNameY+userNameHeight*3+3, 50, userNameHeight);
    contactInterSectionNum.frame    = CGRectMake(userNameX+iconWidth+lbContactInterSection.frame.size.width+3, userNameY+userNameHeight*4, 100, userNameHeight);
    
    iconContact.frame               = CGRectMake(userNameX, contactNum.frame.origin.y+3, 10, 10);
    iconContactInterSection.frame   = CGRectMake(userNameX, contactInterSectionNum.frame.origin.y+3, iconWidth, iconWidth);
    
    distanceAndTime.frame           = CGRectMake(userNameX+140, userNameY, 150, userNameHeight);
}

- (id)object {
    return _item;
}  

- (void)setObject:(id)object {  
    if (_item != object) {
        [super setObject:object];
        ContactPageTableItem* item = object;
        
        userName.text =                 [SWString nullString:item.strUserName];
        userCompany.text =              [SWString nullString:item.strUserCompany];
        userAreaAndUserCareer.text =    [SWString nullString:item.strUserArea];
        contactNum.text =               [SWString nullString:item.strContactNum];
        contactInterSectionNum.text =   @"";
        
        if ([SWString isEmpty:item.strDistance] || [SWString isEmpty:item.strTime]) {
        } else {
            NSMutableString * tTime = [NSMutableString stringWithString:[SWString nullString:item.strTime]];
            [tTime replaceCharactersInRange:NSMakeRange(7, 1) withString:@"月"];
            [tTime replaceCharactersInRange:NSMakeRange(10, 1) withString:@"日"];
            NSString * tTime2 = [tTime substringWithRange:NSMakeRange(5, 11)];
            
            if ([SW_OBJ2STR(item.strDistance) isEqualToString:@"-1"]){
                distanceAndTime.text =
                distanceAndTime.text = SW_STRADD3(@"Web端", @" | ", 
                                                  tTime2);
            } else {
                distanceAndTime.text = SW_STRADD3(item.strDistance, @"km | ", 
                                                  tTime2);
            }
        }
        
        lbContact.text = @"联系人 ";
//        lbContactInterSection.text = @"共同好友 ";
    }  
}

@end
