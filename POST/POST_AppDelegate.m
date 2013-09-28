//
//  Suara_HewanAppDelegate.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "POST_AppDelegate.h"
#import "UIViewController+MMDrawerController.h"
@implementation POST_AppDelegate
@synthesize left = _left;
@synthesize nav = _nav;
@synthesize liveTradeViewController = _liveTradeViewController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
	
	[MagicalRecord setupCoreDataStackWithStoreNamed:@"MyDatabase.sqlite"];
	//set cache url
	
	localContext = [NSManagedObjectContext MR_contextForCurrentThread];
	
	
	NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4*1024*1024
													  diskCapacity:32*1024*1024
														  diskPath:@"app_cache"];
	cleanData =[[NSMutableArray alloc]init];
	[NSURLCache setSharedURLCache:cache];
	/* init mainview
	 */
	[self config];
	
	_liveTradeViewController=[[liveTradeViewController alloc]init];
	_left=[[post_leftViewController alloc]init];
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[[UINavigationBar appearance]setShadowImage:[[UIImage alloc] init]];
	_drawerController = [[MMDrawerController alloc] init];
	[self setCenter:@"LoginViewController" name:@"Live Trade"];
	
    [_drawerController setRestorationIdentifier:@"netra"];
    [_drawerController setMaximumRightDrawerWidth:200.0];
    [_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
	[_drawerController setShouldStretchDrawer:FALSE];
	[_drawerController setDrawerVisualStateBlock:[MMDrawerVisualState slideAndScaleVisualStateBlock]];
	[_drawerController setShowsShadow:NO];
	
	self.window.rootViewController=_drawerController;
    [self.window makeKeyAndVisible];
    return YES;
	
}

-(void)setCenter:(NSString *)center name:(NSString*)name{
	navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 300, 22)];
	navLabel.backgroundColor = [UIColor clearColor];
	navLabel.textColor = [UIColor whiteColor];
	navLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
	navLabel.textAlignment = NSTextAlignmentCenter;
	
	
	if ([center isEqualToString:@""]) {
		[_drawerController setLeftDrawerViewController:_left];
		_nav=[[UINavigationController alloc]initWithRootViewController:_liveTradeViewController];
		[self.drawerController setCenterViewController:_nav withCloseAnimation:YES completion:nil];
		self.lastController = @"liveTradeViewController";
	}
	else if([center isEqualToString:self.lastController]){
		
		[_drawerController closeDrawerAnimated:YES completion:nil];
		[_drawerController setLeftDrawerViewController:_left];
	}
	else{
		_nav=[[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(center) alloc]init]];
		if( [center isEqualToString:@"LoginViewController"]){
			[_drawerController setCenterViewController:_nav withCloseAnimation:YES completion:nil];
			[_drawerController setLeftDrawerViewController:nil];
		}
		else{
			[_drawerController setCenterViewController:_nav withCloseAnimation:YES completion:nil];
			self.lastController = center;
			[_drawerController setLeftDrawerViewController:_left];
		}
		
	}
	
	
	UIView *main_center = [[UIView alloc]initWithFrame:CGRectMake(362, 0, 300, 44)];
	main_center.backgroundColor = [UIColor clearColor];
	[main_center addSubview:navLabel];
	[_nav.navigationBar addSubview:main_center];
	
	
	[_nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	
	UIView *buy_sell=[[UIView alloc]initWithFrame:CGRectMake(1024-300, 0, 300, 44)];
	[buy_sell setBackgroundColor:[UIColor clearColor]];
	[_nav.navigationBar addSubview:buy_sell];
	
	UIView *left=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 44)];
	[left setBackgroundColor:[UIColor clearColor]];
	
	UIImage* image = [UIImage imageNamed:@"right"];
	CGRect frame = CGRectMake(0, 0, 44, 44);
	UIButton* leftbutton = [[UIButton alloc] initWithFrame:frame];
	[leftbutton setBackgroundImage:image forState:UIControlStateNormal];
	//[leftbutton setBackgroundImage:[UIImage imageNamed:@"left-push"] forState:UIControlStateHighlighted];
	[leftbutton addTarget:self action:@selector(lefbuttonPush) forControlEvents:UIControlEventTouchUpInside];
	UIView *leftbuttonView=[[UIView alloc]initWithFrame:CGRectMake(10, 0, 44, 44)];
	leftbuttonView.backgroundColor=[UIColor clearColor];
	[leftbuttonView addSubview:leftbutton];
	[_nav.navigationBar addSubview:leftbuttonView];
	
	UIButton *buy = [UIButton buttonWithType:UIButtonTypeCustom];
	buy.frame = CGRectMake(70, 0, 100, 44);
	buy.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"buy"]];
	[buy setBackgroundImage:[UIImage imageNamed:@"buy"] forState:UIControlStateNormal];
	[buy setBackgroundImage:[UIImage imageNamed:@"buy_"] forState:UIControlStateHighlighted];
	[buy addTarget:self action:@selector(buy) forControlEvents:UIControlEventTouchUpInside];
	
	UIButton *sell = [UIButton buttonWithType:UIButtonTypeCustom];
	sell.frame = CGRectMake(190, 0, 100, 44);
	sell.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"sell"]];
	[sell setBackgroundImage:[UIImage imageNamed:@"sell"] forState:UIControlStateNormal];
	[sell setBackgroundImage:[UIImage imageNamed:@"sell_"] forState:UIControlStateHighlighted];
	
	
	[buy_sell addSubview:buy];
	[buy_sell addSubview:sell];
	navLabel.text = [name uppercaseString];
	_nav.navigationItem.titleView = navLabel;
	
	
	
	
}

-(void)lefbuttonPush{
	
	[_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
-(void)buy{
	
	[NSTimer scheduledTimerWithTimeInterval:3
									 target:self
								   selector:@selector(sell) // <== see the ':', indicates your function takes an argument
								   userInfo:nil
									repeats:YES];
	/*[NSTimer scheduledTimerWithTimeInterval:3
	 target:self
	 selector:@selector(bq) // <== see the ':', indicates your function takes an argument
	 userInfo:nil
	 repeats:YES];
	 */
	
	
	
}

- (void)getBroker{
	
	///data broker get here
	
}
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	[MagicalRecord cleanUp];
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    NSString * key = [identifierComponents lastObject];
    if([key isEqualToString:@"netra"]){
        return self.window.rootViewController;
    }
    else if ([key isEqualToString:@"MMExampleCenterNavigationControllerRestorationKey"]) {
        return ((MMDrawerController *)self.window.rootViewController).centerViewController;
    }
    else if ([key isEqualToString:@"MMExampleLeftSideDrawerController"]){
        return ((MMDrawerController *)self.window.rootViewController).leftDrawerViewController;
    }
    else if ([key isEqualToString:@"MMExampleRightSideDrawerController"]){
        return ((MMDrawerController *)self.window.rootViewController).rightDrawerViewController;
    }
    return nil;
}
-(void)logOut{
	[self setCenter:@"LoginViewController" name:@"Live Trade"];
}
-(void)config{
	
	NSArray *config = [NSArray arrayWithArray:[Configuration MR_findAll]];
	if (config.count!=0) {
		NSArray *server = [NSArray arrayWithArray:[Server MR_findAll]];
		
		if (server.count==0) {
			NSArray *server_default = [NSArray arrayWithObjects:@"http://202.53.249.2",@"http://202.53.249.3", nil];
			for (int i=0; i<server_default.count; i++) {
				Server *servers = [Server MR_createInContext:localContext];
				servers.url = [server_default objectAtIndex:0];
				if (i==0) {
					servers.active = [NSNumber numberWithBool:YES];
				}
				else{
					servers.active = [NSNumber numberWithBool:NO];
				}
			}
			
			NSArray *sWatch = [NSArray arrayWithArray:[StockWatch MR_findAll]];
			if(sWatch.count <= 0){
				NSArray *st_w = [NSArray arrayWithObjects:@"PORT 1",@"PORT 2",@"Minnig",@"Banking",@"Consumer", nil];
				for (int i=0; i<st_w.count; i++) {
					StockWatch *st = [StockWatch MR_createInContext:localContext];
					st.stock_watch_id = [NSNumber numberWithInteger:i];
					st.name = [st_w objectAtIndex:i];
				}
				NSArray *child = [NSArray arrayWithArray:[StockWatchChild MR_findAll]];
				if(child.count <= 0){
					for (int i=0; i<=4; i++) {
						for (int j=1; j<=20; j++) {
							StockWatchChild *stwC = [StockWatchChild MR_createInContext:localContext];
							stwC.st_watch_id =[NSNumber numberWithInteger:i];
							stwC.st_name = @"Bank PAN Indonesia";
							stwC.st_code = @"PNBN";
						}
					}
					
					
				}
				NSLog(@"saving data to server");
				
				[localContext MR_save];
			}
			else{
				
			}
			
		}
	}
}
@end
