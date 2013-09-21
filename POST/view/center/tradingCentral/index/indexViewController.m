//
//  indexViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "indexViewController.h"

@interface indexViewController ()

@end

@implementation indexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.view.backgroundColor = [UIColor colorWithRed:0.106 green:0.145 blue:0.184 alpha:1];
		forex = [[UITableView alloc]initWithFrame:CGRectMake(10, 44, 490, 300)];
		//forex.delegate = self;
		//forex.tableFooterView = [[UIView alloc] init];
		forex.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		forex.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		//forex.dataSource = self;
		[self.view addSubview:forex];
		
		comodity = [[UITableView alloc]initWithFrame:CGRectMake(10, 404, 490, 200)];
		//forex.delegate = self;
		//forex.tableFooterView = [[UIView alloc] init];
		comodity.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		comodity.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		//forex.dataSource = self;
		[self.view addSubview:comodity];
		
		index = [[UITableView alloc]initWithFrame:CGRectMake(530, 44, 490, 600)];
		//forex.delegate = self;
		//forex.tableFooterView = [[UIView alloc] init];
		index.separatorColor = [UIColor colorWithRed:0.161 green:0.18 blue:0.216 alpha:1];
		index.backgroundColor = [UIColor colorWithRed:0.059 green:0.071 blue:0.09 alpha:1];
		//forex.dataSource = self;
		[self.view addSubview:index];

		

        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
