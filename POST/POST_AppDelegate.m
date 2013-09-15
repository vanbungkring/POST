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
	[MagicalRecord setupCoreDataStackWithStoreNamed:@"MyDatabase.sqlite"];
	//set cache url
	NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4*1024*1024
													  diskCapacity:32*1024*1024
														  diskPath:@"app_cache"];
	
	[NSURLCache setSharedURLCache:cache];
	/* init mainview
	 */
	_liveTradeViewController=[[liveTradeViewController alloc]init];
	_left=[[post_leftViewController alloc]init];
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[[UINavigationBar appearance]setShadowImage:[[UIImage alloc] init]];
	_drawerController = [[MMDrawerController alloc] init];
	[self setCenter:@""];
	[_drawerController setLeftDrawerViewController:_left];
    [_drawerController setRestorationIdentifier:@"netra"];
    [_drawerController setMaximumRightDrawerWidth:200.0];
    [_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
	
    [_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
	[_drawerController setShouldStretchDrawer:FALSE];
	[_drawerController setDrawerVisualStateBlock:[MMDrawerVisualState slideAndScaleVisualStateBlock]];
	
	
	self.window.rootViewController=_drawerController;
    [self.window makeKeyAndVisible];
    return YES;

}
-(void)setCenter:(NSString *)center{
	
	if ([center isEqualToString:@""]) {
		_nav=[[UINavigationController alloc]initWithRootViewController:_liveTradeViewController];
		[self.drawerController setCenterViewController:_nav withCloseAnimation:YES completion:nil];
		
		self.lastController = @"liveTradeViewController";
	}
	else if([center isEqualToString:self.lastController]){
		
		[self.drawerController closeDrawerAnimated:YES completion:nil];
	}
	else{
		_nav=[[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(center) alloc]init]];
		[self.drawerController setCenterViewController:_nav withCloseAnimation:YES completion:nil];
		self.lastController = center;
	}
	[_nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	
	

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

@end
