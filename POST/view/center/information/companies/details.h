//
//  details.h
//  POST
//
//  Created by Arie on 9/23/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface details : UIViewController<UIWebViewDelegate,UIScrollViewDelegate>
{
	UIWebView *webviewContent;
	NSURL *url_link;
}

@property (nonatomic,strong) NSString *string;
@end
