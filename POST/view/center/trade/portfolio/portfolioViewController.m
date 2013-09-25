//
//  portfolioViewController.m
//  POST
//
//  Created by Arie on 9/17/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "portfolioViewController.h"

@interface portfolioViewController ()

@end

@implementation portfolioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
		popupView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
		popupView.backgroundColor = [UIColor whiteColor];
		portFolio  = [[UITableView alloc]init];
		portFolio.frame= CGRectMake(10, 120, 1004, 500);
		//portFolio.delegate = self;
		//portFolio.dataSource = self;
		
		portFolio.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		//stockQ.userInteractionEnabled=false;
		portFolio.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		portFolio.separatorColor  = [UIColor colorWithRed:0.141 green:0.196 blue:0.251 alpha:1];
		[portFolio setSeparatorInset:UIEdgeInsetsZero];
		
		[self.view addSubview:portFolio];
        // Custom initialization
		//self.view.backgroundColor = [UIColor colorWithRed:0.204 green:0.247 blue:0.275 alpha:1];
		self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
		portfoliox = [[UIView alloc]initWithFrame:CGRectMake(10, 20, 1004, 75)];
		portfoliox.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"portfolio"]];
		
		account = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 22)];
		account.backgroundColor = [UIColor clearColor];
		account.textColor = [UIColor whiteColor];
		UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1004, 25)];
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1004, 25)];
		[imageView setImage:[UIImage imageNamed:@"prtflio"]];
		[headerView addSubview:imageView];

		portFolio.tableHeaderView = headerView;
		[self.view addSubview:portFolio];
		
		[self.view addSubview:portfoliox];
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self getPin];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{

	[super viewWillAppear:animated];
	
}
-(void)getPin{
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"brokerAccountId", @"request",
							nil];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/orderStatus?"
													  parameters:params];
	
	//[request setTimeoutInterval:];
	
	
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	[httpClient setDefaultHeader:@"Cookie" value:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]]];
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
	
		NSLog(@"respon->%@",[operation.responseString stringByReplacingOccurrencesOfString:@"\"" withString:@""]);
		[self setPin];

	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"Error: %@", error);
		
	}];
	[operation start];
	
}
-(void)setPin{
	NSLog(@"setPin");
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							
							@"229702", @"request",
							@"9165",@"brokerAccountId",
							nil];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/orderStatus?"
													  parameters:params];
	
	//[request setTimeoutInterval:];
	
	
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	[httpClient setDefaultHeader:@"Cookie" value:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]]];
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		
		NSLog(@"response pin->%@",[operation.responseString stringByReplacingOccurrencesOfString:@"\"" withString:@""]);
		
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"Error: %@", error);
		
	}];
	[operation start];


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
