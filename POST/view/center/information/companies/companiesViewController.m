//
//  companiesViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "companiesViewController.h"

@interface companiesViewController ()

@end

@implementation companiesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor = [UIColor colorWithRed:0.188 green:0.216 blue:0.255 alpha:1];
		
		buffer =[[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self fetchQuote];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fetchQuote{
	
	//http://202.53.249.3//mi2/marketInfoData?request=stockInit#
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"stockInit", @"request",
							nil];
	
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://202.53.249.3/"]];
	
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/marketInfoData?"
													  parameters:params];
	
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		// Print the response body in text
		//NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
		NSString *buffers = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
		NSArray *testArray = [buffers componentsSeparatedByString:@"]}"];
		//NSArray *testArrays = [testArray componentsSeparatedByString:@"]}"];
		buffer = [NSMutableArray arrayWithArray:testArray];
		[self digg];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"Error: %@", error);
	}];
	[operation start];
	
	
}

-(void)digg{
	for (int i=0; i<buffer.count; i++) {
		NSString *first=[[buffer objectAtIndex:i] stringByReplacingOccurrencesOfString:@"{" withString:@""];
		NSString *second = [first stringByReplacingOccurrencesOfString:@"\"" withString:@""];
		NSString *third = [second stringByReplacingOccurrencesOfString:@"data:[" withString:@""];
		NSString *fourth = [third stringByReplacingOccurrencesOfString:@"id:" withString:@""];
		
		NSLog(@"sekarang %d---->%@",i,fourth);
	}
	
	
	}
@end
