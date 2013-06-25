#import "CLastButtonCell.h"

@implementation CLastButtonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
	self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    if (self) {
        CLastView * t = [[CLastView alloc] init];
        [self addSubview:t.view];
    }
    return self;
}


@end
