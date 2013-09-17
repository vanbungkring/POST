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
		self.view.backgroundColor = [UIColor colorWithRed:0.188 green:0.216 blue:0.255 alpha:1];
		//self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_bg"]];
		/* running thread 1 */
		liveTrade = [[UITableView alloc]initWithFrame:CGRectMake(10, 10, 490, 595)];
		liveTrade.delegate = self;
		liveTrade.tableFooterView = [[UIView alloc] init];
		liveTrade.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		liveTrade.userInteractionEnabled=false;
		liveTrade.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		liveTrade.dataSource = self;
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
	//[self initnavbar];
	[self callLiveThread];
	[self login];
	// Do any additional setup after loading the view.
}
-(void)buy{
	
}
-(void)sell{

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

-(void)livethread{
	int lowerBound = -1000;
	int upperBound = 1000;
	int randNum = lowerBound + arc4random() % (upperBound - lowerBound);
	
	NSString *num = [NSString stringWithFormat:@"%d", randNum];
	[livetrade_data insertObject:num atIndex:0];
	if([livetrade_data count] >1000){
		[livetrade_data removeAllObjects];
		[self performSelector:@selector(reload) withObject:Nil afterDelay:1];
		[self callLiveThread];
	}
	else{
		[self performSelector:@selector(reload) withObject:Nil afterDelay:1];
		[self callLiveThread];
	}
	

	
}
-(void)reload{
	[dataStock reloadData];
	[liveTrade reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	if(tableView == dataStock){
		return [livetrade_data count];
	}
	return [livetrade_data count];
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
	NSDate *now = [NSDate date];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"dd/MM/YY HH:mm:ss"];
	
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
}

-(void)login{
	
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"login", @"request",
							@"jimmy_it", @"user",
							@"031171", @"password",
							nil];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://202.53.249.3/"]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/marketInfoData?"
													  parameters:params];
	NSLog(@"request-->%@",request);
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	
	[request setHTTPShouldHandleCookies:YES];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		// Print the response body in text
	
		NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
		NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
		NSLog(@"cookieStorage.cookies->%@",cookieStorage.cookies);
		for (NSHTTPCookie *each in cookieStorage.cookies) {
			[netra setSessionId:each.value];
		}
		
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		
		NSLog(@"Error: %@", error);
	}];
	[operation start];
}

-(void)fetchData{
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"login", @"request",
							@"jimmy_it", @"user",
							@"031171", @"password",
							nil];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://202.53.249.3/"]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/marketInfoData?"
													  parameters:params];
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	[AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
	AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
		NSLog(@"responseObject->%@",responseObject);

    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
		NSLog(@"error %@",error);
    }];
    
	// self.filteredArray = [NSMutableArray arrayWithCapacity:netrax.count];
	
    [operation start];
	
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

	return 30;
}
-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:YES];
	[livetrade_data removeAllObjects];
}


@end
