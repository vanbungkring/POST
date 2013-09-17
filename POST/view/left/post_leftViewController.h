//
//  post_leftViewController.h
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface post_leftViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
	UITableView* menu;
	/*section*/
	UIView *view;
	UILabel *section_label;
	NSArray *trading;
	NSArray *trading_c;
	NSArray *information;
	NSArray *information_c;
	NSArray *mytrade;
	NSArray *mytrade_c;
	NSArray *akun;
}
@end
