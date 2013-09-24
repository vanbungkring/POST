//
//  companiesViewController.h
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "details.h"
@interface companiesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
	UITableView *table;
	NSMutableArray *buffer;
	NSMutableArray *clean_data;
	details *detailsCompany;

	
}
@end
