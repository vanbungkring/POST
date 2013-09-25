//
//  st_quoteViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "st_quoteViewController.h"
#import "sqCell.h"
@interface st_quoteViewController ()

@end

@implementation st_quoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
		clean_data = [[NSMutableArray alloc]init];
		stock_accronim =[[UILabel alloc]initWithFrame:CGRectMake(0, 50, 307, 50)];
		stock_accronim.text =@"AAPL";
		stock_accronim.textColor = [UIColor colorWithRed:0.243 green:0.278 blue:0.384 alpha:1];
		stock_accronim.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:44];
		stock_accronim.textAlignment = NSTextAlignmentCenter;
		stock_accronim.backgroundColor = [UIColor clearColor];
		
		stock_volume =[[UILabel alloc]initWithFrame:CGRectMake(0, 80, 307, 50)];
		stock_volume.text =@"(+ 200000)";
		stock_volume.textColor = [UIColor colorWithRed:0.243 green:0.278 blue:0.384 alpha:1];
		stock_volume.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20];
		stock_volume.textAlignment = NSTextAlignmentCenter;
		stock_volume.backgroundColor = [UIColor clearColor];
		
		popupView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 307, 297)];
		popupView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"details"]];
		popupView.layer.cornerRadius = 5;
		popupView.layer.masksToBounds = YES;
		
		[popupView addSubview:stock_accronim];
		[popupView addSubview:stock_volume];
		top_border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, popupView.frame.size.width, 5)];
		top_border.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0 alpha:1];
		
		//[popupView addSubview:top_border];
		
		self.view.backgroundColor = [UIColor colorWithRed:0.106 green:0.145 blue:0.184 alpha:1];
		
		stockQ = [[UITableView alloc]init];
		stockQ.frame= CGRectMake(10, 10, 1004, 608);
		stockQ.delegate = self;
		stockQ.dataSource = self;
		
		stockQ.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		//stockQ.userInteractionEnabled=false;
		stockQ.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		[self.view addSubview:stockQ];
	
    }
    return self;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1004, 25)];
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1004, 25)];
	[imageView setImage:[UIImage imageNamed:@"sq_header"]];
	[headerView addSubview:imageView];
	
	return headerView;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 25;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return clean_data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	sqCell *cell = [[sqCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cex"];
	
	if(cell == nil){
		cell = [[sqCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cex"];
	}
	/*
	2013-09-25 04:39:15.944 POST[2520:a0b] string array->{
		"id[0]" = "
		\nAMAG.NG";
		"id[10]" = 0;
		"id[11]" = 0;
		"id[12]" = 0;
		"id[13]" = 0;
		"id[14]" = 0;
		"id[15]" = 500;
		"id[16]" = 0;
		"id[17]" = 0;
		"id[18]" = 0;
		"id[1]" = AMAG;
		"id[2]" = NG;
		"id[3]" = 220;
		"id[4]" = 0;
		"id[5]" = 0;
		"id[6]" = 0;
		"id[7]" = 0;
		"id[8]" = 0;
		"id[9]" = 0;
	 */
	//}
	cell.no.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
	cell.code.text =  [clean_data objectAtIndex:0];
	//cell.no.text = [NSString stringWithFormat:@"%@",[clean_data objectAtIndex:indexPath.row] objectForkey];
	
	return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	UIColor *color = [UIColor blackColor];
	[ASDepthModalViewController presentView:popupView
                            backgroundColor:color
                                    options:ASDepthModalOptionAnimationShrink | ASDepthModalOptionTapOutsideToClose
                          completionHandler:^{
                              NSLog(@"Modal view closed.");
                          }];
	
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 30;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
	NSLog(@"dipanggil pertama");
    [super viewWillAppear:YES];
	[self performSelector:@selector(StartStream) withObject:Nil afterDelay:1];
	[self performSelector:@selector(assingn) withObject:Nil afterDelay:2];
	
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

	
}
-(void)StartStream
{
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/mi2/marketInfoData?request=dataStream",baseUrl]]];
	[request setValue:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]] forHTTPHeaderField:@"Cookie"];
	connection =[[NSURLConnection alloc]initWithRequest:request delegate:self];
	[connection start];
	
	
}
#pragma mark - NSURLConnection deleages

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{
	
	NSLog(@"response-->%@",response);
}
-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)_data
{
	
	[self filter:_data];
	
}
-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
	NSLog(@"->%@",[error localizedDescription]);
	[self StartStream];

}
-(void)filter:(NSData *)filters{
	
	// Print the response body in text
	//NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
	NSMutableArray *buffer = [[NSMutableArray alloc]init];
	NSString *buffers = [[NSString alloc] initWithData:filters encoding:NSUTF8StringEncoding];
	NSArray *testArray = [buffers componentsSeparatedByString:@"}"];
	//NSArray *testArrays = [testArray componentsSeparatedByString:@"]}"];
	
	buffer = [NSMutableArray arrayWithArray:testArray];
	
	//NSMutableArray *stringArray =[[NSMutableArray alloc]init];
	buffer = [NSMutableArray arrayWithArray:testArray];
	for (int i=0; i<buffer.count; i++) {
		
		//{"id":"AALI.TN","data":["AALI","TN",19150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"req":"SQ"}
		NSString *clean=[[[[[[[[buffer objectAtIndex:i] stringByReplacingOccurrencesOfString:@"{" withString:@""]stringByReplacingOccurrencesOfString:@"\"" withString:@""]stringByReplacingOccurrencesOfString:@"data:[" withString:@""]stringByReplacingOccurrencesOfString:@"]" withString:@""]stringByReplacingOccurrencesOfString:@"req:" withString:@""]stringByReplacingOccurrencesOfString:@"id:" withString:@""]stringByReplacingOccurrencesOfString:@".0" withString:@""];

		if([clean hasSuffix:@"SQ"]||[clean hasSuffix:@"SQ"]){
			NSArray *separate =[clean componentsSeparatedByString:@","];
			NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
			for (int i = 0; i<[separate count]; i++) {
				[dic setValue:[separate objectAtIndex:i] forKey:[NSString stringWithFormat:@"id[%d]", i]];
				
					NSLog(@"string array->%@",dic);
			}
		
			[clean_data insertObject:dic atIndex:0];
			
			[stockQ reloadData];
		}
		else{
			
			NSLog(@"gak ada");
		}
	}
	
}


-(void)connectionDidFinishLoading:(NSURLConnection*)connection
{
	NSLog(@"finish");
	[self StartStream];
}
-(void)assingn{
	
	timer =[NSTimer scheduledTimerWithTimeInterval:10
											target:self
										  selector:@selector(liveTradeAssingn:) // <== see the ':', indicates your function takes an argument
										  userInfo:[NSString stringWithFormat:@"start"]
										   repeats:YES];
	/*[NSTimer scheduledTimerWithTimeInterval:3
	 target:self
	 selector:@selector(bq) // <== see the ':', indicates your function takes an argument
	 userInfo:nil
	 repeats:YES];
	 */
	
	
	
}
-(void)liveTradeAssingn:(NSString*)status{
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"stockQuote", @"request",
							@"start", @"act",
							nil];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/marketInfoData?"
													  parameters:params];
	
	//[request setTimeoutInterval:];
	
	
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	[httpClient setDefaultHeader:@"Cookie" value:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]]];
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		// Print the response body in text
		
		if(operation.responseString==(NSString*) [NSNull null] || [operation.responseString length]==0 || [operation.responseString isEqualToString:@""]){
			NSLog(@"Siap Siap stream");
		}
		else{
			//[self stream];
			NSLog(@"gak bisa stream");
			
		}
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"Error: %@", error);
		
	}];
	[operation start];
}

@end
