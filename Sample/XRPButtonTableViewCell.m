
#import "XRPButtonTableViewCell.h"
#import "XRPBaseTableViewCellProtected.h"

@interface XRPButtonTableViewCell ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation XRPButtonTableViewCell

- (void) setupCell {
	[super setupCell];

	NSDictionary *views = @{
									@"button": self.button,
									};

	self.contentView.translatesAutoresizingMaskIntoConstraints = NO;

	[self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.button
																					 attribute:NSLayoutAttributeCenterX
																					 relatedBy:NSLayoutRelationEqual
																						 toItem:self.contentView
																					 attribute:NSLayoutAttributeCenterX
																					multiplier:1.0
																					  constant:0.0]];

	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=8)-[button]-(>=8)-|"
																									 options:0
																									 metrics:nil
																										views:views]];

	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button]-|"
																									 options:0
																									 metrics:nil
																										views:views]];



	[self.contentView setNeedsUpdateConstraints];
}

#pragma mark - Lazy views

- (UIButton *) button {
	if (!_button) {
		_button = [UIButton buttonWithType:UIButtonTypeCustom];
		_button.translatesAutoresizingMaskIntoConstraints = NO;
		_button.tintColor = [UIColor whiteColor];

		UIFont *font = [UIFont fontWithName:@"TitilliumWeb-Regular" size:16.0];
		_button.titleLabel.font = font;

		[self.contentView addSubview:_button];
	}

	return _button;
}

#pragma mark - UITableViewCell lifecycle

- (void) prepareForReuse {
	[super prepareForReuse];

	self.button.titleLabel.text = nil;
}

- (void) dealloc {
	_button = nil;
}

@end
