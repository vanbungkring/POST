//
//  brokerRankViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "brokerRankViewController.h"
#import "brokerCell.h"
@interface brokerRankViewController ()

@end

@implementation brokerRankViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		//self.view.backgroundColor = [UIColor colorWithRed:0.106 green:0.145 blue:0.184 alpha:1];
		self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
		brQ = [[UITableView alloc]init];
		brQ.frame= CGRectMake(10, 10, 1004, 608);
		brQ.delegate = self;
		brQ.dataSource = self;
		brQ.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		//stockQ.userInteractionEnabled=false;
		brQ.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		brQ.separatorInset =UIEdgeInsetsZero;
		brQ.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		//stockQ.userInteractionEnabled=false;
		brQ.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		[self.view addSubview:brQ];
		bq = [[NSMutableArray alloc]init];
		
		
    }
    return self;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1004, 25)];
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1004, 25)];
	[imageView setImage:[UIImage imageNamed:@"bq_header"]];
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
	
	return plist.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	brokerCell *cell = [[brokerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cex"];
	
	if(cell == nil){
		cell = [[brokerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cex"];
	}
	if(indexPath.row % 2 == 0){
		cell.contentView.backgroundColor=[UIColor colorWithRed:0.078 green:0.098 blue:0.122 alpha:1];
	}

	cell.no.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
	cell.code.textColor = [UIColor yellowColor];
	cell.code.text =[[plist objectAtIndex:indexPath.row]objectForKey:@"id"];
	cell.b_freq.textColor = [UIColor greenColor];
	
	cell.b_vol.textColor = [UIColor yellowColor];
	cell.b_val.textColor = [UIColor yellowColor];
	cell.s_freq.textColor = [UIColor yellowColor];
	
	cell.s_vol.textColor = [UIColor yellowColor];
	cell.s_val.textColor = [UIColor yellowColor];
	cell.n_vol.textColor = [UIColor yellowColor];
	
	cell.t_vol.textColor = [UIColor yellowColor];
	cell.n_val.textColor = [UIColor yellowColor];
	cell.t_val.textColor = [UIColor yellowColor];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	[cell setBackgroundColor:[UIColor clearColor]];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 44;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupBroker];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupBroker{
	NSString *file = [[NSBundle mainBundle] pathForResource:@"broker" ofType:@"plist"];
	plist = [NSArray arrayWithContentsOfFile:file];
	NSLog(@"plist lengt->%d",plist.count);
	[self performSelector:@selector(updateCell) withObject:Nil afterDelay:10];
	[brQ reloadData];
	[self performSelector:@selector(StartStream) withObject:Nil afterDelay:5];
	[self assingn];
}

-(void)pinData{

}
-(void)assingn{
	[self StartStream];
	timer =[NSTimer scheduledTimerWithTimeInterval:2
											target:self
										  selector:@selector(liveTradeAssingn) // <== see the ':', indicates your function takes an argument
										  userInfo:Nil
										   repeats:YES];
	timer2 =[NSTimer scheduledTimerWithTimeInterval:20
											 target:self
										   selector:@selector(manageData) // <== see the ':', indicates your function takes an argument
										   userInfo:Nil
											repeats:YES];
}
-(void)manageData{
	NSLog(@"manage");
	[connections cancel];
	connections=Nil;
	[timer invalidate];
	timer2 =Nil;
	timer =Nil;
	[timer2 invalidate];
	[self performSelector:@selector(assingn) withObject:Nil afterDelay:20];



}
-(void)liveTradeAssingn{

	
	//NSLog(@"statusx-->%@",statusx);
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"brokerQuote", @"request",
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
			UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error!"
															  message:@"It seems Your Trading Session Is Expired, Please Login Again"
															 delegate:nil
													cancelButtonTitle:@"OK"
													otherButtonTitles:nil];
			[message show];
			[timer invalidate];
			[timer2 invalidate];
			[connections cancel];
		}
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"Error: %@", error);
		
	}];
	[operation start];

}
/////streamer

-(void)StartStream
{
	NSLog(@"Start Stream");
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/mi2/marketInfoData?request=dataStream",baseUrl]]];
	[request setValue:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]] forHTTPHeaderField:@"Cookie"];
	connections =[[NSURLConnection alloc]initWithRequest:request delegate:self];
	[connections start];
	
	
}
-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{
	
	NSLog(@"response-->%@",response);
}
-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)_data
{
	
	[self filter:_data];
;
	
}
-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
	NSLog(@"->%@",[error localizedDescription]);
	
	[timer invalidate];
	[timer2 invalidate];
	[connections cancel];
	[self assingn];
	//[self performSelector:@selector(assingn) withObject:Nil afterDelay:5];
	
	
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
	  dispatch_semaphore_t _semaphore = dispatch_semaphore_create(0);
	dispatch_queue_t checkUSers = dispatch_queue_create("CheckUsers", NULL);
    dispatch_async(checkUSers, ^{
	for (int i=0; i<buffer.count; i++) {
		
		//{"id":"AALI.TN","data":["AALI","TN",19150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"req":"SQ"}
		NSString *clean=[[[[[[[[buffer objectAtIndex:i] stringByReplacingOccurrencesOfString:@"{" withString:@""]stringByReplacingOccurrencesOfString:@"\"" withString:@""]stringByReplacingOccurrencesOfString:@"data:[" withString:@""]stringByReplacingOccurrencesOfString:@"]" withString:@""]stringByReplacingOccurrencesOfString:@"req:" withString:@""]stringByReplacingOccurrencesOfString:@"id:" withString:@""]stringByReplacingOccurrencesOfString:@".0" withString:@""];
		//NSLog(@"fourth-->%@",clean);
		if([clean hasSuffix:@"BQ"]||[clean hasSuffix:@"BQ"]){
			NSArray *separate =[clean componentsSeparatedByString:@","];
			NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
			for (int i = 0; i<[separate count]; i++) {
				[dic setValue:[separate objectAtIndex:i] forKey:[NSString stringWithFormat:@"id[%d]", i]];
				[stringArray insertObject:dic atIndex:0];
				
			}
			dispatch_async(dispatch_get_main_queue(), ^{
				[bq insertObject:dic atIndex:0];
			});
			
		

		}
		else{
			
			NSLog(@"gak ada");
		}
	}
	  dispatch_semaphore_signal(_semaphore);
	});
	[self updateCell];
	dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
	
	
}
-(void) updateCell{
	NSLog(@"dipanggil");
	NSIndexPath* indexPath;
	if(bq.count>0){
	for (int i= 0; i <plist.count ; i++) {
		indexPath= [NSIndexPath indexPathForRow:i inSection:0];
		 brokerCell *cell = (brokerCell *)[brQ cellForRowAtIndexPath:indexPath];
		
			
			if([[[[plist objectAtIndex:i]objectForKey:@"data"]objectAtIndex:0] isEqualToString:[[bq objectAtIndex:0]objectForKey:@"id[1]"]]){
				NSLog(@"pair");
				cell.b_freq.text =[[bq objectAtIndex:0]objectForKey:@"id[1]"];
				cell.b_vol.text = [[bq objectAtIndex:0]objectForKey:@"id[2]"];
				[brQ reloadData];
		
		}
		
	}
	
	}
}
@end
