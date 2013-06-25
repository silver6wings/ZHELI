#import "MessagePageItemCell.h"

@implementation MessagePageItemCell
@synthesize lbName,lbNum;

+ (UIFont*)fontForImageItem:(id)imageItem {
    if ([imageItem isKindOfClass:[TTTableRightImageItem class]]) {
        return TTSTYLEVAR(tableSmallFont);
    } else {
        return TTSTYLEVAR(tableSmallFont);
    }
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 60;
}

-(UILabel *) initlb:(UILabel *)lb
      withTextColor:(UIColor *)color
           fontSize:(int)size{
    
    lb = [[UILabel alloc] initWithFrame:CGRectZero];
    lb.textAlignment = UITextAlignmentLeft;
    lb.backgroundColor = [UIColor clearColor];
    lb.highlightedTextColor = TTSTYLEVAR(highlightedTextColor);
    
    lb.font = [UIFont boldSystemFontOfSize:size];
    lb.textColor = color;
    
    return lb;
}

///////////////////////////////////////////////////////////////////////////////////////////////////  

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {  

    if ((self = [super initWithStyle:style reuseIdentifier:identifier])) {  
        _item = nil;  
        
        lbName = [self initlb:lbName 
                withTextColor:[UIColor blackColor] 
                     fontSize:16];
        [self.contentView addSubview:lbName];
        
        lbNum = [self initlb:lbNum
               withTextColor:TTSTYLEVAR(messageFieldTextColor) 
                    fontSize:12];
        [self.contentView addSubview:lbNum];
        
    }  
    return self;  
} 

- (void)dealloc {  
    TT_RELEASE_SAFELY(lbName);
    TT_RELEASE_SAFELY(lbNum);
    [super dealloc];  
}

///////////////////////////////////////////////////////////////////////////////////////////////////  

- (void)layoutSubviews {      
    [super layoutSubviews];  
    self.imageView2.frame = CGRectMake(5, 5, 50, 50);}  

- (id)object {
    return _item;  
}  

- (void)setObject:(id)object {    
    if (_item != object) {
        [super setObject:object];
        
        MessagePageItem * item = object;
        
        lbName.text = item.strName;
        lbName.frame = CGRectMake(60, 5, 250, 25);
        
        lbNum.text = SW_STRADD2(SW_OBJ2STR(item.strContent), @" 条信息");
        lbNum.frame = CGRectMake(60, 30, 250, 25);
    }  
}  

@end
