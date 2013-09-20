//
//  post_leftViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "post_leftViewController.h"
#import "leftCell.h"
@interface post_leftViewController ()

@end

@implementation post_leftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
		trading = [NSArray arrayWithObjects: @"Live Trade", @"Stock Watch",@"Stock Quote",@"Broker Rank",@"Complete Book",@"Charts",@"Index",@"Companies",nil];
		trading_c = [NSArray arrayWithObjects: @"liveTradeViewController", @"st_watchViewController",@"st_quoteViewController",@"brokerRankViewController",@"completeBookViewController",@"chartViewController",@"indexViewController",@"companiesViewController",nil];
		
		mytrade = [NSArray arrayWithObjects: @"Portfolio", @"My Order List",Nil];
		mytrade_c =[NSArray arrayWithObjects: @"portfolioViewController", @"orderListViewController",Nil];
		akun = [NSArray arrayWithObjects: @"Account Setting",Nil];
		akun_c = [NSArray arrayWithObjects: @"accountSettingViewController",Nil];
		
		information = [NSArray arrayWithObjects: @"Contact Us",@"Research",@"Logout",Nil];
		information_c = [NSArray arrayWithObjects: @"contactViewController",@"researchViewController",@"Logout",Nil];
		self.view.backgroundColor=[UIColor blackColor];
		menu=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 750)];
		menu.backgroundColor = [UIColor colorWithRed:0.075 green:0.149 blue:0.192 alpha:1];
		menu.separatorColor  = [UIColor colorWithRed:0.012 green:0.09 blue:0.137 alpha:1];
		menu.dataSource = self;
		menu.delegate = self;
		[self.view addSubview:menu];
		
    }
    return self;
}
/*section*/
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   

	view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, menu.frame.size.width, 44)];
	view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_header"]];
	
	section_label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, menu.frame.size.width, 22)];
    [section_label setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14]];
	section_label.backgroundColor = [UIColor clearColor];
	section_label.textColor = [UIColor colorWithRed:0.965 green:0.965 blue:0.965 alpha:1];
	switch (section) {
		case 0:
			[section_label setText:@"Trading Central"];
			break;
		case 1:
			[section_label setText:@"My Trading"];
			break;
		case 2:
			[section_label setText:@"My Account"];
			break;
		default:
			[section_label setText:@"Other Information"];
			break;
	}

    [view addSubview:section_label];
	
    return view;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if(section == 0){
		return trading.count;
	}
	else if(section == 1){
		return [mytrade count];
	}
	else if(section == 2){
		return [akun count];
	}
	
	return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellReuseIdentifier   = @"SectionTwoCell";
	leftCell *cell=[[leftCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
	if(cell == Nil){
		
		cell=[[leftCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
		
	}
	switch (indexPath.section) {
		case 0:
			cell.text.text=[trading objectAtIndex:indexPath.row];
			break;
		case 1:
			cell.text.text=[mytrade objectAtIndex:indexPath.row];
			break;
		case 2:
			cell.text.text=[akun objectAtIndex:indexPath.row];
			break;
		default:
			cell.text.text=[information objectAtIndex:indexPath.row];
			break;
	}
	return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	switch (indexPath.section) {
		case 0:
			
			[vanbungkring setCenter:[trading_c objectAtIndex:indexPath.row] name:[trading objectAtIndex:indexPath.row]];
			break;
		case 1:
			[vanbungkring setCenter:[mytrade_c objectAtIndex:indexPath.row] name:[mytrade objectAtIndex:indexPath.row]];
			break;
		case 2:
			[vanbungkring setCenter:[akun_c objectAtIndex:indexPath.row] name:[akun objectAtIndex:indexPath.row]];
			break;
		default:
			if([[information_c objectAtIndex:indexPath.row] isEqualToString:@"Logout"]){
				NSLog(@"Logout");
				[vanbungkring logOut];
			}
			else{
				[vanbungkring setCenter:[information_c objectAtIndex:indexPath.row] name:[information objectAtIndex:indexPath.row]];
			}
			break;
	}
	
	
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	/*
	for (NSString* family in [UIFont familyNames])
	{
		NSLog(@"%@", family);
        
		for (NSString* name in [UIFont fontNamesForFamilyName: family])
		{
			NSLog(@"  %@", name);
		}
	}
	*/
	
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
