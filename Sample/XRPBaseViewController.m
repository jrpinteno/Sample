
#import "XRPBaseViewController.h"

@interface XRPBaseViewController ()

@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation XRPBaseViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

	self.backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
	[self.view insertSubview:self.backgroundView atIndex:0];
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	CAGradientLayer *gradientLayer = [CAGradientLayer layer];
	gradientLayer.frame = self.backgroundView.bounds;

	gradientLayer.startPoint = CGPointMake(0.0, 0.0);
	gradientLayer.endPoint = CGPointMake(1.0, 1.0);

	UIColor *topLeftColor = [UIColor lightGrayColor];
	UIColor *bottomRightColor = [UIColor grayColor];
	gradientLayer.colors = @[(id)topLeftColor.CGColor, (id)bottomRightColor.CGColor];
	[self.backgroundView.layer addSublayer:gradientLayer];
}

@end
