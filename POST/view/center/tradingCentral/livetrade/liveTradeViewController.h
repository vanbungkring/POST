//
//  liveTradeViewController.h
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface liveTradeViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
	UILabel *navLabel;
	UIView *right;
	UIView *right_content;
	UIView *popupView;
	//livetrade
	UITableView *liveTrade;
	NSMutableArray *livetrade_data;
	
	///rightStock;
	UIView *stock_wrap;
	UILabel *stock_accronim;
	UILabel *stock_details;
	UILabel *stock_vol;
	UILabel *stock_change;
	UILabel *stock_last;
	UILabel *stock_open;
	UILabel *stock_prev;
	UILabel *stock_hi;
	UILabel *stock_low;
	UILabel *stock_mcp;
	NSMutableArray *clean_data;
	
	NSURLConnection* connections ;
	UIView *ihsg;
	
	NSTimer *timer;
	NSTimer *timer2;
	
	
	UILabel *ihsg_now;
	UILabel *ihsg_last;
	UILabel *ihsg_prev;
	UILabel *ihsg_total;
	NSString *statusx;
	
	
	
	
	/////////rightstock
	
	UITableView *dataStock;
}
@end
