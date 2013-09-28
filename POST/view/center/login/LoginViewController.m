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
		ihsg = [[UIView alloc]initWithFrame:CGRectMake((1024-593)/2, 500, 593, 67.5)];
		ihsg.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ihsg_zero"]];
		timer = [[NSTimer alloc]init];
		now = [[UILabel alloc]initWithFrame:CGRectMake(150, 00, 100, 50)];
		now.backgroundColor = [UIColor clearColor];
		now.textColor = [UIColor whiteColor];
		now.textAlignment = NSTextAlignmentCenter;
		now.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:24];
		now.text = @"0000";
		
		percentage = [[UILabel alloc]initWithFrame:CGRectMake(150, 20, 100, 50)];
		percentage.backgroundColor = [UIColor clearColor];
		percentage.textColor = [UIColor whiteColor];
		percentage.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12];
		percentage.text = @"0000";
		percentage.textAlignment = NSTextAlignmentCenter;
		
		
		hi = [[UILabel alloc]initWithFrame:CGRectMake(310, 7, 100, 20)];
		hi.backgroundColor = [UIColor clearColor];
		hi.textColor = [UIColor whiteColor];
		hi.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12];
		hi.text = @"0000";
		hi.textAlignment = NSTextAlignmentCenter;
		
		low = [[UILabel alloc]initWithFrame:CGRectMake(310, 37, 100, 20)];
		low.backgroundColor = [UIColor clearColor];
		low.textColor = [UIColor whiteColor];
		low.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12];
		low.text = @"0000";
		low.textAlignment = NSTextAlignmentCenter;
		
		
		val = [[UILabel alloc]initWithFrame:CGRectMake(450, 7, 140, 20)];
		val.backgroundColor = [UIColor clearColor];
		val.textColor = [UIColor whiteColor];
		val.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12];
		val.text = @"0000";
		val.textAlignment = NSTextAlignmentCenter;
		
		vol = [[UILabel alloc]initWithFrame:CGRectMake(450, 37, 140, 20)];
		vol.backgroundColor = [UIColor clearColor];
		vol.textColor = [UIColor whiteColor];
		vol.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12];
		vol.text = @"0000";
		vol.textAlignment = NSTextAlignmentCenter;
		
		[ihsg addSubview:hi];
		[ihsg addSubview:low];
		[ihsg addSubview:val];
		[ihsg addSubview:vol];
		[ihsg addSubview:now];
		[ihsg addSubview:percentage];
		[self.view addSubview:ihsg];
		// Custom initialization
		//self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
		self.view.backgroundColor = [UIColor colorWithRed:0.043 green:0.047 blue:0.063 alpha:1];
		
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
		
		config =[UIButton buttonWithType:UIButtonTypeRoundedRect];
		config.backgroundColor = [UIColor whiteColor];
		config.frame = CGRectMake(0, 0, 44, 44);
		
		[self.view addSubview:config];
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
	//[self trade];
}
-(void)trade{

	timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(initIhsg) userInfo:Nil repeats:YES];
	
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
-(void)initIhsg{
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"localIndexInit", @"request",
							@"COMPOSITE", @"indexCode",
							nil];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/marketInfoData?"
													  parameters:params];
	
	//[request setTimeoutInterval:];
	
	
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	[httpClient setDefaultHeader:@"Cookie" value:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]]];
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		// Print the response body in text
		
		NSArray *array = [[operation.responseString stringByReplacingOccurrencesOfString:@"[" withString:@""] componentsSeparatedByString:@","];
		NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
		[numberFormatter setGroupingSeparator:@","];
		[numberFormatter setGroupingSize:3];
		[numberFormatter setUsesGroupingSeparator:YES];
		[numberFormatter setDecimalSeparator:@"."];
		[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
		[numberFormatter setMaximumFractionDigits:2];
		//now.text=[NSString stringWithFormat:@"%@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[array objectAtIndex:5]floatValue]]]];

		now.text=[NSString stringWithFormat:@"%@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[array objectAtIndex:5]floatValue]]]];
		hi.text=[NSString stringWithFormat:@"%@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[array objectAtIndex:5]floatValue]]]];
		low.text=[NSString stringWithFormat:@"%@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[array objectAtIndex:5]floatValue]]]];
		vol.text=[NSString stringWithFormat:@"%@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[array objectAtIndex:5]floatValue]]]];
		val.text=[NSString stringWithFormat:@"%@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[array objectAtIndex:5]floatValue]]]];
		percentage.text=[NSString stringWithFormat:@"%@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[array objectAtIndex:5]floatValue]]]];

	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"Error: %@", error);
		
	}];
	[operation start];
	
}
-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	[timer invalidate];
	timer  = Nil;
}
@end
