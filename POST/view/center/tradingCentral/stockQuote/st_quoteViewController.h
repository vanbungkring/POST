//
//  st_quoteViewController.h
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface st_quoteViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
	UITableView *stockQ;
	UILabel *navLabel;
	UIView *popupView;
	UIView *top_border;
	UILabel *stock_accronim;
	UILabel *stock_volume;
}
@end
