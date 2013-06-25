#import "AMLastButtonCell.h"

@implementation AMLastButtonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
	self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    if (self) {
        AMLastView * t = [[AMLastView alloc] init];
        [self addSubview:t.view];
    }
    return self;
}


@end
