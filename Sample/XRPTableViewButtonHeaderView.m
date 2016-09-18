
#import "XRPTableViewHeaderFooterViewProtected.h"
#import "XRPTableViewButtonHeaderView.h"

@interface XRPTableViewButtonHeaderView ()

@property (nonatomic, strong) UIButton *headerButton;

@end

@implementation XRPTableViewButtonHeaderView

- (void) commonInit {
	[super commonInit];

	NSDictionary *views = @{
									@"button": self.headerButton
									};

	[self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.headerButton
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

- (UIButton *) headerButton {
	if (!_headerButton) {
		_headerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		_headerButton.translatesAutoresizingMaskIntoConstraints = NO;
		_headerButton.tintColor = [UIColor whiteColor];

		_headerButton.layer.borderWidth = 0.5;
		_headerButton.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.2].CGColor;
		_headerButton.contentEdgeInsets = UIEdgeInsetsMake(5, 15, 5, 15);

		_headerButton.layer.cornerRadius = (_headerButton.titleLabel.font.lineHeight + 10) / 2.0;

		[self.contentView addSubview:_headerButton];
	}

	return _headerButton;
}

@end
