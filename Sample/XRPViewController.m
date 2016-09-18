
#import "XRPViewController.h"
#import "XRPButtonTableViewCell.h"
#import "XRPTableViewButtonHeaderView.h"


typedef NS_ENUM(NSInteger, XRPSettingsType) {
	XRPSettingsTypeText = 0,
	XRPSettingsTypeButton  = 1
};

@interface XRPViewController () <
	UITableViewDataSource,
	UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *sampleTableView;
@property (nonatomic, strong) NSArray<NSString *> *test;

@end

@implementation XRPViewController

- (void) viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.

	// Prepare tableview
	self.sampleTableView.dataSource = self;
	self.sampleTableView.delegate = self;
	self.test = @[@"One", @"Two", @"Three"];

	// Register cell class
	[self.sampleTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
	[self.sampleTableView registerClass:[XRPButtonTableViewCell class] forCellReuseIdentifier:[XRPButtonTableViewCell cellReuseIdentifier]];
	self.sampleTableView.rowHeight = UITableViewAutomaticDimension;
	self.sampleTableView.estimatedRowHeight = 48;

	// Register group members header
	[self.sampleTableView registerClass:[XRPTableViewButtonHeaderView class] forHeaderFooterViewReuseIdentifier:[XRPTableViewButtonHeaderView cellReuseIdentifier]];
	self.sampleTableView.sectionHeaderHeight = UITableViewAutomaticDimension;
	self.sampleTableView.estimatedSectionHeaderHeight = 48;

	[self.sampleTableView reloadData];
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	self.navigationItem.title = @"Settings";
	self.sampleTableView.backgroundColor = [UIColor clearColor];
}

#pragma mark - UITableViewDelegate methods

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	switch (section) {
		case XRPSettingsTypeText: {
			XRPTableViewButtonHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[XRPTableViewButtonHeaderView cellReuseIdentifier]];

			[headerView.headerButton setTitle:@"Section header button" forState:UIControlStateNormal];

			return headerView;
		}

		default:
			return nil;
	}
}

#pragma mark - UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case XRPSettingsTypeText:
			return 3;

		case XRPSettingsTypeButton:
			return 1;

		default:
			return 0;
	}
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.section) {
		case XRPSettingsTypeText: {
			UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

			NSString *value = [self itemAtIndexPath:indexPath];

			cell.textLabel.text = value;

			return cell;
		}

		case XRPSettingsTypeButton: {
			XRPButtonTableViewCell *cell = (XRPButtonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[XRPButtonTableViewCell cellReuseIdentifier]];
			[cell.button setTitle:@"Settings Button" forState:UIControlStateNormal];

			return cell;
		}
	}

	return nil;
}


- (id) itemAtIndexPath:(NSIndexPath *)indexPath {
	return self.test[(NSUInteger)indexPath.row];
}

@end
