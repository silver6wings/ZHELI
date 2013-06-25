#import "ActivityPageTableItemCell.h"
#import "ActivityPageTableItem.h"


@implementation ActivityPageTableItemCell
@synthesize activityCompanyLabel,
            activityNameLabel,
            activityLocationLabel,
            activityDateTimeLabel,
            iconMembers,
            activityMembersLabel;

+ (UIFont*)fontForImageItem:(id)imageItem {
    if ([imageItem isKindOfClass:[TTTableRightImageItem class]]) {
        return TTSTYLEVAR(tableSmallFont);
    } else {
        return TTSTYLEVAR(tableSmallFont);
    }
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    ActivityPageTableItem * item = (ActivityPageTableItem *)object;
    
    CGSize nameSize = [item.strActivityName sizeWithFont:[UIFont boldSystemFontOfSize:18.0]
                                            constrainedToSize:CGSizeMake(240, 100)
                                                lineBreakMode:UILineBreakModeCharacterWrap];
    
    return 50 + nameSize.height;
}

///////////////////////////////////////////////////////////////////////////////////////////////////  

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {  
    
    if ((self = [super initWithStyle:style reuseIdentifier:identifier])) {  
        _item = nil;  
        picRight = 60;
        
        // NameLabel
        
        activityNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        activityNameLabel.textAlignment = UITextAlignmentLeft;
        activityNameLabel.textColor = [UIColor blackColor];
        activityNameLabel.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        activityNameLabel.backgroundColor = [UIColor clearColor];
        activityNameLabel.font = [UIFont boldSystemFontOfSize:16];
        activityNameLabel.numberOfLines = 0;
        activityNameLabel.lineBreakMode = UILineBreakModeCharacterWrap;

        // CompanyLabel
        
        activityCompanyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        activityCompanyLabel.frame = CGRectMake(picRight, 5, 150, 15);
        
        activityCompanyLabel.font = [UIFont boldSystemFontOfSize:12];
        activityCompanyLabel.textColor = TTSTYLEVAR(messageFieldTextColor);
        activityCompanyLabel.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        activityCompanyLabel.backgroundColor = [UIColor clearColor];
        activityCompanyLabel.textAlignment = UITextAlignmentLeft;
        
        // LocationLabel
        
        activityLocationLabel = [[UILabel alloc] initWithFrame:CGRectZero]; 
        activityLocationLabel.font = [UIFont boldSystemFontOfSize:10];
        activityLocationLabel.textColor = TTSTYLEVAR(messageFieldTextColor);
        activityLocationLabel.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        activityLocationLabel.backgroundColor = [UIColor clearColor];
        activityLocationLabel.textAlignment = UITextAlignmentLeft;
        
        // DateTimeLabel
        
        activityDateTimeLabel = [[UILabel alloc] initWithFrame:CGRectZero]; 
        activityDateTimeLabel.font = [UIFont boldSystemFontOfSize:10];
        activityDateTimeLabel.textColor = TTSTYLEVAR(messageFieldTextColor);
        activityDateTimeLabel.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        activityDateTimeLabel.backgroundColor = [UIColor clearColor];
        activityDateTimeLabel.textAlignment = UITextAlignmentLeft;
        
        // iconMembers
        iconMembers = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconMembers.png"]];
        iconMembers.frame = CGRectMake(270, 0, 20, 20);
        [self.contentView addSubview:iconMembers];
        
        // MembersLabel
        
        activityMembersLabel = [[UILabel alloc] initWithFrame:CGRectZero];  
        activityMembersLabel.font = [UIFont boldSystemFontOfSize:12];
        activityMembersLabel.textColor = TTSTYLEVAR(messageFieldTextColor);
        activityMembersLabel.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
        activityMembersLabel.backgroundColor = [UIColor clearColor];
        activityMembersLabel.textAlignment = UITextAlignmentLeft;
    }  
    return self;  
} 

- (void)dealloc {  
    TT_RELEASE_SAFELY(activityCompanyLabel); 
    TT_RELEASE_SAFELY(activityNameLabel); 
    TT_RELEASE_SAFELY(activityLocationLabel);
    TT_RELEASE_SAFELY(activityDateTimeLabel);
    TT_RELEASE_SAFELY(iconMembers);
    TT_RELEASE_SAFELY(activityMembersLabel)
    [super dealloc];  
}

///////////////////////////////////////////////////////////////////////////////////////////////////  

- (void)setObject:(id)object {      
    if (_item != object) {  
        [super setObject:object];  
        
        ActivityPageTableItem * item = object;
        
        // Company Label
        activityCompanyLabel.text = item.strActivityCompany;
        [self.contentView addSubview:activityCompanyLabel];
        
        // Name Label
        CGSize nameLabelSize = [item.strActivityName sizeWithFont:[UIFont boldSystemFontOfSize:18.0]
                                                constrainedToSize:CGSizeMake(240, 100)
                                                    lineBreakMode:UILineBreakModeCharacterWrap];
        activityNameLabel.frame = CGRectMake(picRight, 23, nameLabelSize.width, nameLabelSize.height);        
        activityNameLabel.text = item.strActivityName;  
        [self.contentView addSubview:activityNameLabel];

        // Location Label
        activityLocationLabel.frame = CGRectMake(picRight, 25 + nameLabelSize.height , 270, 20); 
        activityLocationLabel.text = item.strActivityLocation;
        [self.contentView addSubview:activityLocationLabel];
        
        // DateTime Label
        NSString * tTime1 = (NSString *)item.strActivityDate;
        NSString * tTime2 = [tTime1 substringToIndex:10];
        tTime2 = SW_STRADD3(tTime2, @" ", [tTime1 substringFromIndex:12]);
        
        NSString * tTime3 = (NSString *)item.strActivityDate;
        NSString * tTime4 = [tTime1 substringToIndex:10];
        tTime4 = SW_STRADD3(tTime4, @" ", [tTime3 substringFromIndex:12]);
        
        activityDateTimeLabel.frame = CGRectMake(picRight, 2, 270, 20); 
        activityDateTimeLabel.text = SW_STRADD3(tTime2, @" - ", tTime4);
        [self.contentView addSubview:activityDateTimeLabel];
        
        // Members Label
        activityMembersLabel.text = item.strActivityMembers;
        activityMembersLabel.frame = CGRectMake(295, 5, 80, 15);
        [self.contentView addSubview:activityMembersLabel];
    }  
}  

- (void)layoutSubviews {      
    [super layoutSubviews];  
    self.imageView2.frame = CGRectMake(5, 5, 50, 50);
}  

- (id)object {
    return _item;  
}  


@end
