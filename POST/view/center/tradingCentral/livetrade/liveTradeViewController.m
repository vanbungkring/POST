//
//  liveTradeViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "liveTradeViewController.h"

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
		liveTrade = [[UITableView alloc]initWithFrame:CGRectMake(10, 10, 490, 600)];
		liveTrade.delegate = self;
		liveTrade.userInteractionEnabled=false;
		liveTrade.dataSource = self;
		[self.view addSubview:liveTrade];
		
		///set headerview
		
		UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 490, 25)];
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 490, 25)];
		[imageView setImage:[UIImage imageNamed:@"livetrade_head"]];
		[headerView addSubview:imageView];
		liveTrade.tableHeaderView = headerView;
		
		livetrade_data = [[NSMutableArray alloc]initWithCapacity:20];
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
	int randNum = arc4random() % 74 ? 1 : -1 ;
	
	NSString *num = [NSString stringWithFormat:@"%d", randNum];
	[livetrade_data addObject:num];
	if([livetrade_data count] >20){
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
	
	UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellx"];
	
	if(cell == Nil){
		cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellx"];
	}
	cell.textLabel.text=[livetrade_data objectAtIndex:indexPath.row];
	return cell;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 30;
}
@end
