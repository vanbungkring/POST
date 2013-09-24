//
//  details.m
//  POST
//
//  Created by Arie on 9/23/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "details.h"

@interface details ()

@end

@implementation details

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor =[UIColor whiteColor];
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
		[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	UISegmentedControl *statFilter = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Company Info", @"Financial Info", @"History", nil]];
	statFilter.segmentedControlStyle = UISegmentedControlStyleBar;
	
	UIColor *newTintColor = [UIColor colorWithRed: 251/255.0 green:175/255.0 blue:93/255.0 alpha:1.0];
    statFilter.tintColor = newTintColor;
	
	UIColor *newSelectedTintColor = [UIColor colorWithRed: 0/255.0 green:175/255.0 blue:0/255.0 alpha:1.0];
	[[[statFilter subviews] objectAtIndex:0] setTintColor:newSelectedTintColor];
	[statFilter setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
										  [UIFont fontWithName:@"Arial" size:16.0],UITextAttributeFont,
										  [UIColor whiteColor], UITextAttributeTextColor,
										  [UIColor blackColor], UITextAttributeTextShadowColor,
										  [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
										  nil] forState:UIControlStateNormal];
	[statFilter setSegmentedControlStyle:UISegmentedControlStyleBar];
	[statFilter sizeToFit];
	[statFilter setSelectedSegmentIndex:0];
	self.navigationItem.titleView = statFilter;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
