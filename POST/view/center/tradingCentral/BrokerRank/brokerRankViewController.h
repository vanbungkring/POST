//
//  brokerRankViewController.h
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface brokerRankViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	UITableView *brQ;
	NSArray *plist;
	NSURLConnection *connections;
	NSTimer *timer;
	NSTimer *timer2;
	NSMutableArray *bq;

	
}

@end
