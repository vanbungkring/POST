//
//  LoginViewController.m
//  POST
//
//  Created by Arie on 9/16/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		//self.view.backgroundColor = [UIColor colorWithRed:0.141 green:0.196 blue:0.231 alpha:1];
		self.view.backgroundColor = [UIColor colorWithRed:0.204 green:0.247 blue:0.275 alpha:1];
		
		login_container =[[UIView alloc]initWithFrame:CGRectMake(512-150, 100, 300, 300)];
		login_container.backgroundColor = [UIColor colorWithRed:0.255 green:0.322 blue:0.353 alpha:1];
		login_container.layer.cornerRadius =10;
		// drop shadow
		[login_container.layer setShadowColor:[UIColor blackColor].CGColor];
		[login_container.layer setShadowOpacity:0.5];
		[login_container.layer setShadowRadius:10.0];
		[login_container.layer setShadowOffset:CGSizeMake(1, 1.0)];
		
		//UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
		
		userName =[[UITextField alloc]initWithFrame:CGRectMake(10, 100, 280, 44)];
		userName.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16];
		userName.placeholder = @"Username";
		userName.tag=1;
		userName.delegate = self;
		userName.clearButtonMode = UITextFieldViewModeWhileEditing;
		userName.returnKeyType = UIReturnKeyNext;
		userName.layer.sublayerTransform = CATransform3DMakeTranslation(20, 10, 0);
		userName.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tf"]];
		
		passWord =[[UITextField alloc]initWithFrame:CGRectMake(10, 150, 280, 44)];
		passWord.layer.sublayerTransform = CATransform3DMakeTranslation(20, 10, 0);
		passWord.returnKeyType = UIReturnKeyDone;
		passWord.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16];
		passWord.placeholder = @"Password";
		passWord.tag = 2;
		passWord.delegate = self;
		passWord.secureTextEntry = YES;
		passWord.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tf"]];
		
		sign_in =[UIButton buttonWithType:UIButtonTypeCustom];
		sign_in.frame = CGRectMake(10, 210, 280, 44);
		[sign_in setBackgroundImage:[UIImage imageNamed:@"sign_in"] forState:UIControlStateNormal];
		[sign_in setBackgroundImage:[UIImage imageNamed:@"sign_in_p"] forState:UIControlStateHighlighted];
		[sign_in addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
		sign_in.layer.cornerRadius =5;
		sign_in.layer.masksToBounds=YES;
		sign_in.layer.borderColor=[UIColor colorWithRed:0.569 green:0.231 blue:0.063 alpha:1].CGColor;
		sign_in.layer.borderWidth = 1.0f;
		
		
		[login_container addSubview:userName];
		[login_container addSubview:passWord];
		[login_container addSubview:sign_in];
		[self.view addSubview:login_container];
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:YES];
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
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField.tag ==1) {
        [userName resignFirstResponder];
		[passWord becomeFirstResponder];
    }
	else{
		[passWord resignFirstResponder];
	}
    return YES;
}

-(void)login{
	if(userName.text.length ==0 || passWord.text.length == 0){
		UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error!"
														  message:@"Username or Password Can't be Empty"
														 delegate:nil
												cancelButtonTitle:@"OK"
												otherButtonTitles:nil];
		[message show];
	
	}
	else{
		[userName resignFirstResponder];
		[passWord resignFirstResponder];
		[vanbungkring setCenter:@"liveTradeViewController" name:@"Live Trade"];
	}
	
}


@end
