
#import "XRPTableViewHeaderFooterViewProtected.h"
#import "XRPTableViewContactsHeaderView.h"

@interface XRPTableViewContactsHeaderView ()

@property (nonatomic, strong) UILabel *headerLabel;

@end

@implementation XRPTableViewContactsHeaderView

- (void) commonInit {
	[super commonInit];

	self.backgroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.15];

	NSDictionary *views = @{
									@"headerLabel": self.headerLabel
									};

	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[headerLabel]-(>=8)-|"
																									 options:0
																									 metrics:nil
																										views:views]];

	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[headerLabel]-|"
																									 options:0
																									 metrics:nil
																										views:views]];

	[self.contentView setNeedsUpdateConstraints];
}

#pragma mark - Lazy views

- (UILabel *) headerLabel {
	if (!_headerLabel) {
		_headerLabel = [[UILabel alloc] init];
		_headerLabel.translatesAutoresizingMaskIntoConstraints = NO;
		_headerLabel.backgroundColor = [UIColor clearColor];
		_headerLabel.textColor = [UIColor whiteColor];
		_headerLabel.numberOfLines = 1;

		[self.contentView addSubview:_headerLabel];
	}

	return _headerLabel;
}

@end
