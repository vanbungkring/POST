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
	
	//livetrade
	UITableView *liveTrade;
	NSMutableArray *livetrade_data;
}
@end
