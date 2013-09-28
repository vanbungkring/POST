//
//  st_watchViewController.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "st_watchViewController.h"

@interface st_watchViewController ()

@end

@implementation st_watchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor = [UIColor colorWithRed:0.043 green:0.047 blue:0.063 alpha:1];
		UIView *container = [[UIView alloc] initWithFrame:CGRectMake(10, 50, 1004, 500)];
		container.backgroundColor = [UIColor clearColor];
		
		//create new subview within container. I call it "card"
		for (int i=0; i<4; i++)
		{
			//create card
			for (int x=0; x<5; ++x) {
				card_view= [[UIView alloc] initWithFrame:CGRectMake(10 + (200 * x), 10 + (120 * i), 185, 100)];
				UILabel *text = [[UILabel alloc]init];
				text.frame = CGRectMake(0, 0, 185, 40);
				text.text = @"AAPL";
				text.textColor = [UIColor whiteColor];
				
				[card_view addSubview:text];
				if((x+1)+(5*i) % 2 ==0){
					card_view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sw_ijo"]];
				}
				else{
					card_view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sw_merah"]];
				}
				[container addSubview:card_view];
			}
			
		}
		
		//add subview to self
		[self.view addSubview:container];
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
