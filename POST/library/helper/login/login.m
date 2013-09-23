//
//  login.m
//  POST
//
//  Created by Arie on 9/22/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "login.h"

@implementation login
static login *sharedObject;
+ (login*)sharedInstance
{
    if (sharedObject == nil) {
        sharedObject = [[super allocWithZone:NULL] init];
    }
    return sharedObject;
}
+(void)login_toServer:(NSString*)username password:(NSString*)password{
	
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"login", @"request",
							username, @"user",
							password, @"password",
							nil];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://202.53.249.3/"]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/marketInfoData?"
													  parameters:params];
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	[httpClient setDefaultHeader:@"Accept-Charset" value:@"utf-8"];
	[httpClient setDefaultHeader:@"Accept" value:@"text/plain"];
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		
		if(operation.responseString.boolValue ==true){
			NSMutableArray *xxx=[[NSMutableArray alloc]init];
			for (NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies])
			{
				NSLog(@"cookie==>%@",[cookie value]);
				NSLog(@"cookie==>%@",[cookie name]);
				[xxx addObject:[cookie value]];
				
			}
			[netra setSessionId:[xxx objectAtIndex:0]];
			[vanbungkring setCenter:@"" name:@"Live Trade"];
			//[vanbungkring startS];
			
		}
		else{
			UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error!"
															  message:@"Login Failed! check your username and password"
															 delegate:nil
													cancelButtonTitle:@"OK"
													otherButtonTitles:nil];
			[message show];
		}
		
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error!"
														  message:[error localizedDescription]
														 delegate:nil
												cancelButtonTitle:@"OK"
												otherButtonTitles:nil];
		[message show];
	}];
	[operation start];
}

@end
