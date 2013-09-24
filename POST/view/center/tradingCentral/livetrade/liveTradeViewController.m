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
		
		timer =[[NSTimer alloc]init];
		
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
	NSLog(@"dipanggil pertama");
    [super viewWillAppear:YES];
	[self performSelector:@selector(StartStream) withObject:Nil afterDelay:1];
	[self performSelector:@selector(assingn) withObject:Nil afterDelay:2];
	
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
    // Handle the error properly
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
		
		//{"id":"AALI.TN","data":["AALI","TN",19150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"req":"SQ"}
		NSString *clean=[[[[[[[[buffer objectAtIndex:i] stringByReplacingOccurrencesOfString:@"{" withString:@""]stringByReplacingOccurrencesOfString:@"\"" withString:@""]stringByReplacingOccurrencesOfString:@"data:[" withString:@""]stringByReplacingOccurrencesOfString:@"]" withString:@""]stringByReplacingOccurrencesOfString:@"req:" withString:@""]stringByReplacingOccurrencesOfString:@"id:" withString:@""]stringByReplacingOccurrencesOfString:@".0" withString:@""];
		NSLog(@"fourth-->%@",clean);
		if([clean hasSuffix:@"T"]||[clean hasSuffix:@"T"]){
			NSArray *separate =[clean componentsSeparatedByString:@","];
			NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
			for (int i = 0; i<[separate count]; i++) {
				[dic setValue:[separate objectAtIndex:i] forKey:[NSString stringWithFormat:@"id[%d]", i]];
				[stringArray insertObject:dic atIndex:0];
				
			}
			NSLog(@"string array->%@",[stringArray objectAtIndex:0]);
			[clean_data insertObject:dic atIndex:0];
			
			[liveTrade reloadData];
		}
		else{
		
			NSLog(@"gak ada");
		}
	}
	
}
-(void)reloadTable{
	[liveTrade reloadData];
}

-(void)connectionDidFinishLoading:(NSURLConnection*)connection
{
	NSLog(@"finish");
	[self StartStream];
}
-(void)assingn{
	
	timer =[NSTimer scheduledTimerWithTimeInterval:3
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
							@"runningTrade", @"request",
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
			cell.backgroundColor=[UIColor colorWithRed:0.078 green:0.098 blue:0.122 alpha:1];
		}
		else{
		cell.backgroundColor=[UIColor blackColor];
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
		NSDate *now = [NSDate date];
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"HH:mm:ss"];
		
		if([[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[3]"] integerValue] < [[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[5]"]integerValue]){
			cell.status.textColor =[UIColor redColor];
			cell.time.textColor =[UIColor redColor];
			cell.code.textColor =[UIColor redColor];
			cell.mkt.textColor =[UIColor redColor];
			cell.price.textColor =[UIColor redColor];
			cell.vol.textColor =[UIColor redColor];
			cell.pm.textColor = [UIColor redColor];
			cell.percent.textColor = [UIColor redColor];
			cell.bs.textColor = [UIColor redColor];
			cell.sell.textColor = [UIColor redColor];

		}
		else if([[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[3]"] integerValue] == [[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[5]"]integerValue]){
			cell.status.textColor =[UIColor yellowColor];
			cell.time.textColor =[UIColor yellowColor];
			cell.code.textColor =[UIColor yellowColor];
			cell.mkt.textColor =[UIColor yellowColor];
			cell.price.textColor =[UIColor yellowColor];
			cell.vol.textColor =[UIColor yellowColor];
			cell.pm.textColor = [UIColor yellowColor];
			cell.percent.textColor = [UIColor yellowColor];
			cell.bs.textColor = [UIColor yellowColor];
			cell.sell.textColor = [UIColor yellowColor];
		}
		else{
		
		
		}
		cell.status.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[10]"];
		cell.time.text =[dateFormatter stringFromDate:now];
		cell.code.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[1]"];
		cell.mkt.text =[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[2]"];
		cell.price.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[3]"];
		cell.vol.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[4]"];
		cell.bs.text = [NSString stringWithFormat:@"%@ %@",[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[6]"],[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[7]"]];
		
		cell.sell.text = [NSString stringWithFormat:@"%@ %@",[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[8]"],[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[9]"]];
	return cell;
	}
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	[cell setBackgroundColor:[UIColor clearColor]];
}

-(void)initSimpleCompleteBook{

}

-(void)streamCompleteBook{

}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

	return 30;
}
-(void)viewWillDisappear:(BOOL)animated{
	[connection cancel];
	[timer invalidate];
	timer = Nil;
	[super viewWillDisappear:YES];
	[self liveTradeAssingn:@"stop"];
	[livetrade_data removeAllObjects];
}


@end
