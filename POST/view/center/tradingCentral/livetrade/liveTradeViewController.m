//
//  liveTradeViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "liveTradeViewController.h"
#import "liveTradeCell.h"

@interface liveTradeViewController ()

@end

@implementation liveTradeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
		popupView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 270, 350)];
		popupView.backgroundColor=[UIColor whiteColor];

        // Custom initialization
		self.view.backgroundColor = [UIColor colorWithRed:0.106 green:0.145 blue:0.184 alpha:1];
		//self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_bg"]];
		/* running thread 1 */
		liveTrade = [[UITableView alloc]initWithFrame:CGRectMake(10, 10, 490, 595)];
		liveTrade.delegate = self;
		liveTrade.tableFooterView = [[UIView alloc] init];
		liveTrade.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		liveTrade.userInteractionEnabled=false;
		liveTrade.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		liveTrade.dataSource = self;
		liveTrade.backgroundColor = [UIColor colorWithRed:0.141 green:0.196 blue:0.251 alpha:1];
		liveTrade.separatorColor  = [UIColor colorWithRed:0.141 green:0.196 blue:0.251 alpha:1];
		[liveTrade setSeparatorInset:UIEdgeInsetsZero];
		[self.view addSubview:liveTrade];
		
		///set headerview
		
		UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 490, 25)];
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 490, 25)];
		[imageView setImage:[UIImage imageNamed:@"livetrade_head"]];
		[headerView addSubview:imageView];
		
		UIView *headerView_table = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 490, 25)];
		UIImageView *imageViews = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 490, 25)];
		[imageViews setImage:[UIImage imageNamed:@"livetrade_head_table"]];
		[headerView_table addSubview:imageViews];

		liveTrade.tableHeaderView = headerView;
		
		livetrade_data = [[NSMutableArray alloc]initWithCapacity:101];
		
		//rightview;
		
		right=[[UIView alloc]initWithFrame:CGRectMake(492+30, 6, 490, 600)];
		right.backgroundColor = [UIColor clearColor];
		////datastock table
		
		dataStock = [[UITableView alloc]initWithFrame:CGRectMake(5, 115, 480, 170)];
		dataStock.delegate = self;
		dataStock.dataSource = self;
		dataStock.tableFooterView = [[UIView alloc] init];
		//dataStock.tableHeaderView = headerView;
		dataStock.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		dataStock.userInteractionEnabled=false;
		dataStock.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		
		dataStock.tableHeaderView = headerView_table;
		
		right_content =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 490, 100)];
		right_content.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"livetrade_right"]];
		
		stock_wrap = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 130.5, 100)];
		
		stock_accronim = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 110, 40)];
		stock_accronim.text = @"ADDR";
		stock_accronim.textAlignment = NSTextAlignmentCenter;
		stock_accronim.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
		stock_accronim.backgroundColor = [UIColor clearColor];
		//stock_accronim.textColor = [UIColor colorWithRed:0.965 green:0.529 blue:0.122 alpha:1];
		stock_accronim.textColor = [UIColor whiteColor];
		
		stock_details = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 110, 40)];
		stock_details.text = @"Adaro Energy Tbk";
		stock_details.textAlignment = NSTextAlignmentCenter;
		stock_details.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
		stock_details.backgroundColor = [UIColor clearColor];
		stock_details.textColor = [UIColor colorWithRed:0.965 green:0.529 blue:0.122 alpha:1];
		//stock_accronim.textColor = [UIColor whiteColor];

		[stock_wrap addSubview:stock_details];
		[stock_wrap addSubview:stock_accronim];
		
		stock_vol = [[UILabel alloc]initWithFrame:CGRectMake(135.5, 10, 158.5, 50)];
		stock_vol.text = @"52,571";
		stock_vol.textAlignment = NSTextAlignmentCenter;
		stock_vol.font = [UIFont fontWithName:@"HelveticaNeue" size:30];
		stock_vol.backgroundColor = [UIColor clearColor];
		//stock_accronim.textColor = [UIColor colorWithRed:0.965 green:0.529 blue:0.122 alpha:1];
		stock_vol.textColor = [UIColor colorWithRed:0.314 green:0.82 blue:0.133 alpha:1];
			clean_data = [[NSMutableArray alloc]init];
		stock_change = [[UILabel alloc]initWithFrame:CGRectMake(135.5, 40, 158.5, 50)];
		stock_change.text = @"10 (1.05%)";
		stock_change.textAlignment = NSTextAlignmentCenter;
		stock_change.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
		stock_change.backgroundColor = [UIColor clearColor];
		//stock_accronim.textColor = [UIColor colorWithRed:0.965 green:0.529 blue:0.122 alpha:1];
		stock_change.textColor = [UIColor colorWithRed:0.314 green:0.82 blue:0.133 alpha:1];
		
		[right_content addSubview:stock_change];
		[right_content addSubview:stock_vol];
		[right_content addSubview:stock_wrap];
		
		[right addSubview:right_content];
		[right addSubview:dataStock];
		
		[self.view addSubview:right];
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
	[self StartStream];
	[self performSelector:@selector(assingn) withObject:Nil afterDelay:1];
	
}
-(void)StartStream
{
	NSLog(@"start Stream with session id->%@",[netra getSessionActive]);
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/mi2/marketInfoData?request=dataStream",baseUrl]]];
	[request setValue:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]] forHTTPHeaderField:@"Cookie"];
	NSURLConnection* connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
	
	NSLog(@"request-->%@",[request allHTTPHeaderFields]);
	NSLog(@"request-->%@",request);
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
-(void)filter:(NSData *)filters{
	
	// Print the response body in text
	//NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
	NSMutableArray *buffer = [[NSMutableArray alloc]init];
	NSString *buffers = [[NSString alloc] initWithData:filters encoding:NSUTF8StringEncoding];
	NSArray *testArray = [buffers componentsSeparatedByString:@"}"];
	//NSArray *testArrays = [testArray componentsSeparatedByString:@"]}"];
	
	buffer = [NSMutableArray arrayWithArray:testArray];
	
	NSMutableArray *stringArray =[[NSMutableArray alloc]init];

	//NSMutableArray *stringArray =[[NSMutableArray alloc]init];
	buffer = [NSMutableArray arrayWithArray:testArray];
	for (int i=0; i<buffer.count; i++) {
		NSString *first=[[buffer objectAtIndex:i] stringByReplacingOccurrencesOfString:@"{" withString:@""];
		NSString *second = [first stringByReplacingOccurrencesOfString:@"\"" withString:@""];
		NSString *third = [second stringByReplacingOccurrencesOfString:@"data:[" withString:@""];
		NSString *fourth = [third stringByReplacingOccurrencesOfString:@"id:" withString:@""];
		
		NSArray *separate =[fourth componentsSeparatedByString:@","];
		NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
		for (int i = 0; i<[separate count]; i++) {
			[dic setValue:[separate objectAtIndex:i] forKey:[NSString stringWithFormat:@"id[%d]", i]];
			[stringArray insertObject:dic atIndex:0];
		}
			[clean_data insertObject:dic atIndex:0];
		NSLog(@"----->%ds",[clean_data count]);
		[liveTrade reloadData];
	}
	
}

-(void)reloadTable{
	[liveTrade reloadData];
}
-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
	NSLog(@"->%@",[error localizedDescription]);
	[self StartStream];
    // Handle the error properly
}
-(void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    //NSString* stringData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
	//[target performSelector:selector withObject:stringData];
}
-(void)assingn{
	
	[NSTimer scheduledTimerWithTimeInterval:3
									 target:self
								   selector:@selector(liveTradeAssingn) // <== see the ':', indicates your function takes an argument
								   userInfo:nil
									repeats:YES];
	/*[NSTimer scheduledTimerWithTimeInterval:3
	 target:self
	 selector:@selector(bq) // <== see the ':', indicates your function takes an argument
	 userInfo:nil
	 repeats:YES];
	 */
	
	
	
}
-(void)liveTradeAssingn{
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"BrokerQuote", @"request",
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
-(void)stop{


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/////initial data from json and live trade set here

-(void)callLiveThread{
	[self performSelector:@selector(livethread) withObject:Nil afterDelay:1];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return [clean_data count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if(tableView == dataStock){
		liveTradeCell *cell = [[liveTradeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellx"];
		
		if(cell == Nil){
			cell=[[liveTradeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellx"];
		}
		if(indexPath.row % 2 == 0){
			cell.contentView.backgroundColor=[UIColor colorWithRed:0.078 green:0.098 blue:0.122 alpha:1];
		}
		//cell.time.textColor=[UIColor whiteColor];
		//cell.textLabel.backgroundColor=[UIColor clearColor];
		//cell.textLabel.text=[livetrade_data objectAtIndex:indexPath.row];
		NSDate *now = [NSDate date];
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"DD/MM/YY HH:mm:ss"];
		
		NSString *string = [dateFormatter stringFromDate:now];
		if([[livetrade_data objectAtIndex:indexPath.row] intValue] < 0){
			cell.time.textColor  = [UIColor redColor];
			cell.code.textColor  = [UIColor redColor];
			cell.mkt.textColor = [UIColor redColor];
			cell.price.textColor = [UIColor redColor];
			cell.vol.textColor = [UIColor redColor];
		}
		//cell.time.text = [livetrade_data objectAtIndex:indexPath.row];
		cell.time.text = string;
		cell.code.text = @"AAPL";
		cell.price.text = [livetrade_data objectAtIndex:indexPath.row];
		return cell;

	
	}
	else{
	liveTradeCell *cell = [[liveTradeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellx"];
	
	if(cell == Nil){
		cell=[[liveTradeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellx"];
	}
	if(indexPath.row % 2 == 0){
		cell.contentView.backgroundColor=[UIColor colorWithRed:0.078 green:0.098 blue:0.122 alpha:1];
	}
	//cell.time.textColor=[UIColor whiteColor];
	//cell.textLabel.backgroundColor=[UIColor clearColor];
	//cell.textLabel.text=[livetrade_data objectAtIndex:indexPath.row];
	//cell.time.text = [livetrade_data objectAtIndex:indexPath.row];
	cell.time.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[0]"];
	cell.code.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[1]"];
	cell.mkt.text =[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[2]"];
	cell.price.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[3]"];
	return cell;
	}
}


-(void)initSimpleCompleteBook{

}

-(void)streamCompleteBook{

}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

	return 30;
}
-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:YES];
	[livetrade_data removeAllObjects];
}


@end
