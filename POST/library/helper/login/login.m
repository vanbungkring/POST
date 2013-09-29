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
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
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
			[sharedObject startStream];
			//[NSTimer timerWithTimeInterval:5 target:self selector:@selector(initReq) userInfo:Nil repeats:YES];
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
-(void)startStream{
	NSLog(@"datastream");
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"dataStream", @"request",
							nil];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/marketInfoData?"
													  parameters:params];
	
	//[request setTimeoutInterval:];
	
	
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	[httpClient setDefaultHeader:@"Cookie" value:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]]];
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		// Print the response body in text
		NSLog(@"operation->%@",operation.responseString);

	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"Error: %@", error);
		
	}];
	[operation start];
}

-(void)initReq{
	NSLog(@"start");
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"brokerQuote", @"request",
							@"start", @"act",
							nil];
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
															path:@"mi2/marketInfoData?"
													  parameters:params];
	
	//[request setTimeoutInterval:];
	
	
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	[httpClient setDefaultHeader:@"Cookie" value:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]]];
	
	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"Error: %@", error);
		
	}];
	[operation start];
}
@end
