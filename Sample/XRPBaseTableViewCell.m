//
//  ZBaseTableViewCell.m

#import "XRPBaseTableViewCell.h"

@implementation XRPBaseTableViewCell

#pragma mark - class methods

+ (NSString *) cellReuseIdentifier {
	return NSStringFromClass([self class]);
}

#pragma mark - Initialisers

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

	if (self) {
		[self setupCell];
	}

	return self;
}

- (instancetype) initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];

	if (self) {
		[self setupCell];
	}

	return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];

	if (self) {
		[self setupCell];
	}

	return self;
}

- (void) setupCell {
	self.backgroundColor = [UIColor clearColor];

	self.selectedBackgroundView = [[UIView alloc] init];
	self.selectedBackgroundView.backgroundColor = [UIColor blueColor];
}

@end
