//
//  researchViewController.m
//  POST
//
//  Created by Arie on 9/17/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "researchViewController.h"

@interface researchViewController ()

@end

@implementation researchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor = [UIColor colorWithRed:0.188 green:0.216 blue:0.255 alpha:1];
		webview =[[UIWebView alloc]initWithFrame:CGRectMake(10, 10, 1004, 680)];
		webview.delegate = self;
		NSURL *url = [NSURL URLWithString:@"http://202.53.249.2/mi2/research/research_notes.html"];
		NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
		[webview loadRequest:requestURL];
		webview.scrollView.bounces = NO;
		UIScrollView *scrollView = [webview.subviews objectAtIndex:0];
		scrollView.delegate = self;//self must be UIScrollViewDelegate
		[self.view addSubview:webview];
    }
    return self;
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
#pragma mark - Optional UIWebViewDelegate delegate methods
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
