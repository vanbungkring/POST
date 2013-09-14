//
//  liveTradeViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "liveTradeViewController.h"
#import "liveTradeCell.h"
#import "UIViewController+MMDrawerController.h"
@interface liveTradeViewController ()

@end

@implementation liveTradeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
		liveTrade.tableHeaderView = headerView;
		
		livetrade_data = [[NSMutableArray alloc]initWithCapacity:101];
		//rightview;
		
		right=[[UIView alloc]initWithFrame:CGRectMake(492+30, 10, 490, 600)];
		right.backgroundColor = [UIColor whiteColor];
		
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
	[self initnavbar];
	[self callLiveThread];
	// Do any additional setup after loading the view.
}
-(void)initnavbar{
	navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -2, 220, 18)];
	navLabel.backgroundColor = [UIColor clearColor];
	navLabel.textColor = [UIColor whiteColor];
	navLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:16];
	navLabel.textAlignment = NSTextAlignmentCenter;
	navLabel.text = @"POST LIVE TRADE";
	self.navigationItem.titleView = navLabel;
	
	
	//self.titleImage=[[UIImageView alloc]initWithFrame:CGRectMake(3, 0, 142, 24.5)];
	//[self.titleImage setImage:[UIImage imageNamed:@"topChart"]];
	
	//selectedCellIndexPath=[[NSIndexPath alloc]init];
	
	UIImage* image = [UIImage imageNamed:@"right"];
	CGRect frame = CGRectMake(0, 0, 44, 44);
	UIButton* leftbutton = [[UIButton alloc] initWithFrame:frame];
	[leftbutton setBackgroundImage:image forState:UIControlStateNormal];
	//[leftbutton setBackgroundImage:[UIImage imageNamed:@"left-push"] forState:UIControlStateHighlighted];
	[leftbutton addTarget:self action:@selector(lefbuttonPush) forControlEvents:UIControlEventTouchUpInside];
	
	UIView *leftbuttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
	leftbuttonView.backgroundColor=[UIColor clearColor];
	[leftbuttonView addSubview:leftbutton];
	UIBarButtonItem* leftbarbutton = [[UIBarButtonItem alloc] initWithCustomView:leftbuttonView];

	[self.navigationItem setLeftBarButtonItem:leftbarbutton];
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
	if([livetrade_data count] >100){
		[livetrade_data removeAllObjects];
		[self performSelector:@selector(reload) withObject:Nil afterDelay:2];
	}
	else{
		[liveTrade reloadData];
	}
	
	[self callLiveThread];

}
-(void)reload{
[liveTrade reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [livetrade_data count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	liveTradeCell *cell = [[liveTradeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellx"];
	
	if(cell == Nil){
		cell=[[liveTradeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellx"];
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
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 30;
}

-(void)lefbuttonPush{

 [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];}
@end
