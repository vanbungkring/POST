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
		
		trading = [NSArray arrayWithObjects: @"Live Trade", @"Stock Watch",@"Stock Quote",@"Broker Rank",@"Complete Book",@"Charts",@"Research",@"Index",@"Companies",nil];
		mytrade = [NSArray arrayWithObjects: @"Portfolio", @"My Order List",Nil];
		self.view.backgroundColor=[UIColor blackColor];
		menu=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 760)];
		menu.backgroundColor = [UIColor colorWithRed:0.067 green:0.086 blue:0.122 alpha:1];
		menu.separatorColor  = [UIColor colorWithRed:0.149 green:0.165 blue:0.208 alpha:1];
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
    [section_label setFont:[UIFont fontWithName:@"OpenSans-Semibold" size:15]];
	section_label.backgroundColor = [UIColor clearColor];
	section_label.textColor = [UIColor colorWithRed:0.965 green:0.965 blue:0.965 alpha:1];
	switch (section) {
		case 0:
			[section_label setText:@"TRADING CENTRAL"];
			break;
		case 1:
			[section_label setText:@"MY TRADING"];
			break;
		case 2:
			[section_label setText:@"MY ACCOUNT"];
			break;
		default:
			[section_label setText:@"INFORMATION"];
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
		return 2;
	}
	else if(section == 2){
		return 1;
	}
	
	return 2;
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
			cell.text.text=@"Account Setting";
			break;
		default:
			switch (indexPath.row) {
				case 0:
					cell.text.text=@"Contact Us";
					break;
					
				default:
					cell.text.text=@"Logout";
					break;
			}
			break;
	}
	return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	NSLog(@"index-> %@",indexPath);
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
