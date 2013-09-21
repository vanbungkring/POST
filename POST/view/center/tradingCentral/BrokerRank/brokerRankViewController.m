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
		self.view.backgroundColor = [UIColor colorWithRed:0.106 green:0.145 blue:0.184 alpha:1];
		
		brQ = [[UITableView alloc]init];
		brQ.frame= CGRectMake(10, 10, 1004, 608);
		brQ.delegate = self;
		brQ.dataSource = self;
		
		brQ.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		//stockQ.userInteractionEnabled=false;
		brQ.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		[self.view addSubview:brQ];
		
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
	
	return 123;
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
	cell.code.textColor = [UIColor greenColor];
	cell.b_freq.textColor = [UIColor greenColor];
	
	cell.b_vol.textColor = [UIColor greenColor];
	cell.b_val.textColor = [UIColor greenColor];
	cell.s_freq.textColor = [UIColor greenColor];
	
	cell.s_vol.textColor = [UIColor greenColor];
	cell.s_val.textColor = [UIColor greenColor];
	cell.n_vol.textColor = [UIColor greenColor];
	
	cell.t_vol.textColor = [UIColor greenColor];
	cell.n_val.textColor = [UIColor greenColor];
	cell.t_val.textColor = [UIColor greenColor];
	
	return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 30;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self fetchdata];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fetchdata{
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"login", @"request",
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
@end
