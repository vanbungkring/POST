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
		HUD = [[MBProgressHUD alloc] initWithView:self.view];
	
		// Custom initialization
		self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
		//self.view.backgroundColor = [UIColor colorWithRed:0.106 green:0.145 blue:0.184 alpha:1];
		
		login_container =[[UIView alloc]initWithFrame:CGRectMake(30, 100, 500, 300)];

		//UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
		
		logo = [[UIImageView alloc]initWithFrame:CGRectMake((1024-107.5)/2, 60, 107.5, 136.5)];
		[logo setImage:[UIImage imageNamed:@"logo"]];
		
		
		userName =[[UITextField alloc]initWithFrame:CGRectMake((1024-320)/2+10, 240, 300, 44)];
		userName.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16];
		userName.placeholder = @"Username";
		userName.tag=1;
		userName.keyboardAppearance =UIKeyboardAppearanceDark;
		userName.delegate = self;
		userName.clearButtonMode = UITextFieldViewModeWhileEditing;
		userName.returnKeyType = UIReturnKeyNext;
		userName.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
		userName.backgroundColor = [UIColor whiteColor];
		
		passWord =[[UITextField alloc]initWithFrame:CGRectMake((1024-320)/2+10, 300, 300, 44)];
		passWord.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
		passWord.returnKeyType = UIReturnKeyDone;
		passWord.keyboardAppearance =UIKeyboardAppearanceDark;
		passWord.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16];
		passWord.placeholder = @"Password";
		passWord.tag = 2;
		passWord.delegate = self;
		passWord.secureTextEntry = YES;
		passWord.backgroundColor = [UIColor whiteColor];
		
		sign_in =[UIButton buttonWithType:UIButtonTypeCustom];
		sign_in.frame = CGRectMake((1024-300)/2, 360, 300, 44);
		[sign_in setBackgroundImage:[UIImage imageNamed:@"sign_in"] forState:UIControlStateNormal];
		[sign_in setBackgroundImage:[UIImage imageNamed:@"sign_in_p"] forState:UIControlStateHighlighted];
		[sign_in addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
		sign_in.layer.cornerRadius =5;
		sign_in.layer.masksToBounds=YES;
		sign_in.layer.borderColor=[UIColor colorWithRed:0.569 green:0.231 blue:0.063 alpha:1].CGColor;
		sign_in.layer.borderWidth = 1.0f;
		
		[self.view addSubview:logo];
		[self.view addSubview:userName];
		[self.view addSubview:passWord];
		[self.view addSubview:sign_in];
		
		//[self.view addSubview:login_container];
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
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
	userName.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tf"]];
	passWord.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tf"]];
	return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField.tag ==1) {
		userName.backgroundColor = [UIColor whiteColor];
        [userName resignFirstResponder];
		[passWord becomeFirstResponder];
    }
	else{
		passWord.backgroundColor = [UIColor whiteColor];
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
		[login login_toServer:userName.text password:passWord.text];
		HUD= [MBProgressHUD showHUDAddedTo:self.view animated:YES];
		HUD.dimBackground = YES;
		HUD.labelText = @"Loggin To server";
		HUD.margin = 10.f;
		HUD.removeFromSuperViewOnHide = YES;
		
		[HUD hide:YES afterDelay:3];

		[userName resignFirstResponder];
		[passWord resignFirstResponder];
		
		
	}
	
}

@end
