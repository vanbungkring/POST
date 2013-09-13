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
	NSArray *information;
	NSArray *mytrade;
	NSArray *akun;
}
@end
