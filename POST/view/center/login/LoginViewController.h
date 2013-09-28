//
//  LoginViewController.h
//  POST
//
//  Created by Arie on 9/16/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
	UIView *login_container;
	UITextField *userName;
	UITextField *passWord;
	UIButton *sign_in;
	UIImageView *logo;
	MBProgressHUD *HUD;
	
	UIView *ihsg;
	UILabel *now;
	UILabel *hi;
	UILabel *low;
	UILabel *val;
	UILabel *vol;
	UILabel *percentage;
	NSTimer *timer;
	
	UIButton *config;
	
}
@end
