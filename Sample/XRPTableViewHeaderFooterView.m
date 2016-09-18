
#import "XRPTableViewHeaderFooterView.h"

@implementation XRPTableViewHeaderFooterView

#pragma mark - Class methods

+ (NSString *) cellReuseIdentifier {
	return NSStringFromClass([self class]);
}

#pragma mark - Initialisers

- (instancetype) initWithReuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithReuseIdentifier:reuseIdentifier];

	if (self) {
		[self commonInit];
	}

	return self;
}

- (instancetype) initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];

	if (self) {
		[self commonInit];
	}

	return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];

	if (self) {
		[self commonInit];
	}

	return self;
}

- (void) commonInit {
	self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
}

@end
