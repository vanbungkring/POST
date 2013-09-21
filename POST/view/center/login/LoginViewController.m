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
		
		login_container =[[UIView alloc]initWithFrame:CGRectMake(30, 100, 500, 300)];
		//login_container.backgroundColor = [UIColor colorWithRed:0.255 green:0.322 blue:0.353 alpha:1];
		//login_container.layer.cornerRadius =10;
		// drop shadow
		/*
		[login_container.layer setShadowColor:[UIColor blackColor].CGColor];
		[login_container.layer setShadowOpacity:0.5];
		[login_container.layer setShadowRadius:10.0];
		[login_container.layer setShadowOffset:CGSizeMake(1, 1.0)];
		*/
		//UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
		
		userName =[[UITextField alloc]initWithFrame:CGRectMake(10, 90, 480, 44)];
		userName.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16];
		userName.placeholder = @"Username";
		userName.tag=1;
		userName.delegate = self;
		userName.clearButtonMode = UITextFieldViewModeWhileEditing;
		userName.returnKeyType = UIReturnKeyNext;
		userName.layer.sublayerTransform = CATransform3DMakeTranslation(20, 10, 0);
		userName.backgroundColor = [UIColor whiteColor];
		
		passWord =[[UITextField alloc]initWithFrame:CGRectMake(10, 150, 480, 44)];
		passWord.layer.sublayerTransform = CATransform3DMakeTranslation(20, 10, 0);
		passWord.returnKeyType = UIReturnKeyDone;
		passWord.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16];
		passWord.placeholder = @"Password";
		passWord.tag = 2;
		passWord.delegate = self;
		passWord.secureTextEntry = YES;
		passWord.backgroundColor = [UIColor whiteColor];
		
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
		[self login_toServer];
		[userName resignFirstResponder];
		[passWord resignFirstResponder];
		
		
	}
	
}
-(void)login_toServer{
	
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"login", @"request",
							userName.text, @"user",
							passWord.text, @"password",
							nil];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://202.53.249.3/"]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/marketInfoData?"
													  parameters:params];
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	[httpClient setDefaultHeader:@"Accept-Charset" value:@"utf-8"];
	[httpClient setDefaultHeader:@"Accept" value:@"text/plain"];
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
	
		if(operation.responseString.boolValue ==true){
			NSMutableArray *xxx=[[NSMutableArray alloc]init];
			for (NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies])
			{
				NSLog(@"cookie==>%@",[cookie value]);
				NSLog(@"cookie==>%@",[cookie name]);
				[xxx addObject:[cookie value]];
				
			}
			[netra setSessionId:[xxx objectAtIndex:0]];
			[vanbungkring setCenter:@"" name:@"Live Trade"];
			
		}
		else{
			UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error!"
															  message:@"Login Failed! check your username and password"
															 delegate:nil
													cancelButtonTitle:@"OK"
													otherButtonTitles:nil];
			[message show];
		}
		
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error!"
														  message:[error localizedDescription]
														 delegate:nil
												cancelButtonTitle:@"OK"
												otherButtonTitles:nil];
		[message show];
	}];
	[operation start];
}

@end
