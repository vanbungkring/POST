//
//  Suara_HewanAppDelegate.h
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "post_leftViewController.h"
#import "liveTradeViewController.h"
#import "StockInit.h"
@interface POST_AppDelegate : UIResponder <UIApplicationDelegate>
{
	UIView *popupView;
	UILabel *navLabel;
	NSManagedObjectContext *localContext;
	NSMutableArray *cleanData;
	
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) post_leftViewController *left;
@property (strong, nonatomic) liveTradeViewController *liveTradeViewController;
@property (strong, nonatomic)  MMDrawerController * drawerController;
@property (strong, nonatomic) UINavigationController *nav;

//initialize last controller that used;
@property (strong, nonatomic) NSString *lastController;

-(void)setCenter:(NSString *)center name:(NSString*)name;
-(void)startS;
-(void)logOut;
-(void)buy;
@end
