//
//  companiesViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "companiesViewController.h"
#import "comapanyCell.h"
@interface companiesViewController ()

@end

@implementation companiesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor = [UIColor colorWithRed:0.204 green:0.247 blue:0.275 alpha:1];
		
		buffer = [[NSMutableArray alloc]init];
		clean_data = [[NSMutableArray alloc]init];
		table = [[UITableView alloc]init];
		table.frame= CGRectMake(10, 10, 1004, 608);
		table.delegate = self;
		table.dataSource = self;
		
		table.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		//stockQ.userInteractionEnabled=false;
		table.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		table.separatorColor  = [UIColor colorWithRed:0.141 green:0.196 blue:0.251 alpha:1];
		[table setSeparatorInset:UIEdgeInsetsZero];
		detailsCompany =[[details alloc]init];
		[self.view addSubview:table];
    }
    return self;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1004, 25)];
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1004, 25)];
	[imageView setImage:[UIImage imageNamed:@"cp_header"]];
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
	
	return [clean_data count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	comapanyCell *cell = [[comapanyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cex"];
	
	if(cell == nil){
		cell = [[comapanyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cex"];
	}
	if(indexPath.row % 2 == 0){
		cell.contentView.backgroundColor=[UIColor colorWithRed:0.078 green:0.098 blue:0.122 alpha:1];
	}
	
	//cell.textLabel.textColor  = [UIColor whiteColor];
	cell.no.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
	cell.code.text = [NSString stringWithFormat:@"%@ - %@",[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[1]"],[[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[2]"]];
	cell.cp_name.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[3]"];
	cell.prev.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[4]"];
	cell.sb_sc.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[6]"];
	cell.mk_cp.text = [[clean_data objectAtIndex:indexPath.row]objectForKey:@"id[10]"];
	
	UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor blueColor];
    bgColorView.layer.masksToBounds = YES;
    cell.selectedBackgroundView = bgColorView;
	return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	[cell setBackgroundColor:[UIColor clearColor]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:detailsCompany];
	[self.navigationController presentViewController:nav animated:YES completion:Nil];
	
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
	
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
	
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/marketInfoData?"
													  parameters:params];
	
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		// Print the response body in text
		//NSLog(@"response string->%@",operation.responseString);
		//NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
		NSString *buffers = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
		NSArray *testArray = [buffers componentsSeparatedByString:@"]}"];
		NSLog(@"test array-->%@",testArray);
		//NSArray *testArrays = [testArray componentsSeparatedByString:@"]}"];
		buffer = [NSMutableArray arrayWithArray:testArray];
		NSMutableArray *stringArray =[[NSMutableArray alloc]init];
		for (int i=0; i<buffer.count; i++) {
			NSString *first=[[buffer objectAtIndex:i] stringByReplacingOccurrencesOfString:@"{" withString:@""];
			NSString *second = [first stringByReplacingOccurrencesOfString:@"\"" withString:@""];
			NSString *third = [second stringByReplacingOccurrencesOfString:@"data:[" withString:@""];
			NSString *fourth = [third stringByReplacingOccurrencesOfString:@"id:" withString:@""];
			
			NSArray *separate =[fourth componentsSeparatedByString:@","];
			NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
			for (int i = 0; i<[separate count]; i++) {
				[dic setValue:[separate objectAtIndex:i] forKey:[NSString stringWithFormat:@"id[%d]", i]];
				[stringArray addObject:dic];
				
			}
			if (![clean_data containsObject:dic]) {
                [clean_data addObject:dic];
				
				
            }

			
						
		}
		[table reloadData];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"Error: %@", error);
	}];
	[operation start];
	
	
}

@end
