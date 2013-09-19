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
		
		self.view.backgroundColor = [UIColor colorWithRed:0.188 green:0.216 blue:0.255 alpha:1];
		
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
	
	return 532;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	sqCell *cell = [[sqCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cex"];
	
	if(cell == nil){
		cell = [[sqCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cex"];
	}
	if(indexPath.row % 2 == 0){
		cell.contentView.backgroundColor=[UIColor colorWithRed:0.078 green:0.098 blue:0.122 alpha:1];
		
		//cell.no.textColor = [UIColor redColor];
		cell.code.textColor = [UIColor redColor];
		cell.last.textColor = [UIColor redColor];
		
		cell.change.textColor = [UIColor redColor];
		cell.change_p.textColor = [UIColor redColor];
		cell.fb_val.textColor = [UIColor redColor];
		
		cell.fb_vol.textColor = [UIColor redColor];
		cell.fs_val.textColor = [UIColor redColor];
		cell.fs_vol.textColor = [UIColor redColor];
		
		cell.value.textColor = [UIColor redColor];
		cell.volume.textColor = [UIColor redColor];
		
	}
	if(indexPath.row % 78 ==0){
		//cell.no.textColor = [UIColor yellowColor];
		cell.code.textColor = [UIColor yellowColor];
		cell.last.textColor = [UIColor yellowColor];
		
		cell.change.textColor = [UIColor yellowColor];
		cell.change_p.textColor = [UIColor yellowColor];
		cell.fb_val.textColor = [UIColor yellowColor];
		
		cell.fb_vol.textColor = [UIColor yellowColor];
		cell.fs_val.textColor = [UIColor yellowColor];
		cell.fs_vol.textColor = [UIColor yellowColor];
		
		cell.value.textColor = [UIColor yellowColor];
		cell.volume.textColor = [UIColor yellowColor];
	}
	if(indexPath.row % 3 ==0){
		//cell.no.textColor = [UIColor greenColor];
		cell.code.textColor = [UIColor greenColor];
		cell.last.textColor = [UIColor greenColor];
		
		cell.change.textColor = [UIColor greenColor];
		cell.change_p.textColor = [UIColor greenColor];
		cell.fb_val.textColor = [UIColor greenColor];
		
		cell.fb_vol.textColor = [UIColor greenColor];
		cell.fs_val.textColor = [UIColor greenColor];
		cell.fs_vol.textColor = [UIColor greenColor];
		
		cell.value.textColor = [UIColor greenColor];
		cell.volume.textColor = [UIColor greenColor];
	}
	cell.no.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
	
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
	[self fetchdata];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

	
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
