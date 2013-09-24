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
@synthesize string =_string;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor = [UIColor colorWithRed:0.106 green:0.145 blue:0.184 alpha:1];
		webviewContent =[[UIWebView alloc]initWithFrame:CGRectMake(10, 10, 1004, 680)];
		webviewContent.delegate = self;
		
		
		webviewContent.scrollView.bounces = NO;
		UIScrollView *scrollView = [webviewContent.subviews objectAtIndex:0];
		scrollView.delegate = self;//self must be UIScrollViewDelegate
		[self.view addSubview:webviewContent];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
	url_link = [NSURL URLWithString:[NSString stringWithFormat:@"%@/mi2/compProfile/%@.html",baseUrl,_string]];
	NSURLRequest *requestURL = [NSURLRequest requestWithURL:url_link];
	[webviewContent loadRequest:requestURL];
	UIImage *buttonImage = [UIImage imageNamed:@"cancel"];
	UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[aButton setImage:buttonImage forState:UIControlStateNormal];
	aButton.frame = CGRectMake(0.0,0.0,buttonImage.size.width,buttonImage.size.height);
	[aButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:aButton];
	self.navigationItem.leftBarButtonItem = backButton;
	
	
	[super viewWillAppear:animated];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
		[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	UISegmentedControl *statFilter = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Company Info", @"Financial Info", nil]];
	statFilter.segmentedControlStyle = UISegmentedControlStyleBar;
	
	UIColor *newTintColor = [UIColor colorWithRed:0.149 green:0.212 blue:0.271 alpha:1];
    statFilter.tintColor = newTintColor;
	//[[[statFilter subviews] objectAtIndex:0] setTintColor:newSelectedTintColor];
	[statFilter setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
										  [UIFont fontWithName:@"HelveticaNeue" size:12],UITextAttributeFont,
										  [UIColor whiteColor], UITextAttributeTextColor,
										  [UIColor whiteColor], UITextAttributeTextShadowColor,
										  [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
										  nil] forState:UIControlStateNormal];
	[statFilter setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
										[UIFont fontWithName:@"HelveticaNeue" size:12],UITextAttributeFont,
										[UIColor whiteColor], UITextAttributeTextColor,
										[UIColor whiteColor], UITextAttributeTextShadowColor,
										[NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
										nil] forState:UIControlStateSelected];
	
	[statFilter setSegmentedControlStyle:UISegmentedControlStyleBar];
	[statFilter addTarget:self
						 action:@selector(pickOne:)
			   forControlEvents:UIControlEventValueChanged];
	[statFilter sizeToFit];
	[statFilter setSelectedSegmentIndex:0];
	self.navigationItem.titleView = statFilter;

}
-(void) pickOne:(id)sender{
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	if([segmentedControl selectedSegmentIndex] ==0){
	 url_link = [NSURL URLWithString:[NSString stringWithFormat:@"%@/mi2/compProfile/%@.html",baseUrl,_string]];
	 NSURLRequest *requestURL = [NSURLRequest requestWithURL:url_link];
	[webviewContent loadRequest:requestURL];
	}
	else{
		url_link = [NSURL URLWithString:[NSString stringWithFormat:@"%@/mi2/compProfile/%@ALL.html",baseUrl,_string]];
		NSURLRequest *requestURL = [NSURLRequest requestWithURL:url_link];
		[webviewContent loadRequest:requestURL];
	}
	
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void)close{

	[self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
