#import "ALastButtonCell.h"

@implementation ALastButtonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
	self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    if (self) {
        ALastView * t = [[ALastView alloc] init];
        [self addSubview:t.view];
    }
    return self;
}


@end
