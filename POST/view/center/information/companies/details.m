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
		self.view.backgroundColor = [UIColor colorWithRed:0.106 green:0.145 blue:0.184 alpha:1];
		
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
	
	UIColor *newTintColor = [UIColor colorWithRed:0.149 green:0.212 blue:0.271 alpha:1];
    statFilter.tintColor = newTintColor;
	//[[[statFilter subviews] objectAtIndex:0] setTintColor:newSelectedTintColor];
	[statFilter setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
										  [UIFont fontWithName:@"HelveticaNeue" size:14],UITextAttributeFont,
										  [UIColor whiteColor], UITextAttributeTextColor,
										  [UIColor whiteColor], UITextAttributeTextShadowColor,
										  [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
										  nil] forState:UIControlStateNormal];
	[statFilter setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
										[UIFont fontWithName:@"HelveticaNeue" size:14],UITextAttributeFont,
										[UIColor whiteColor], UITextAttributeTextColor,
										[UIColor whiteColor], UITextAttributeTextShadowColor,
										[NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
										nil] forState:UIControlStateSelected];
	
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
