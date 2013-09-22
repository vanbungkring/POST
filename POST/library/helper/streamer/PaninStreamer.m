//
//  PaninStreamer.m
//  POST
//
//  Created by Arie on 9/22/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "PaninStreamer.h"

@implementation PaninStreamer
@synthesize data, target, selector;

static PaninStreamer *sharedObject;

+ (PaninStreamer *)sharedInstance
{
    if (sharedObject == nil) {
        sharedObject = [[super allocWithZone:NULL] init];
    }
    return sharedObject;
}


+(void) StartStream
{
	NSLog(@"start Stream with session id->%@",[netra getSessionActive]);
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://202.53.249.3/mi2/marketInfoData?request=dataStream"]];
	[request setValue:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]] forHTTPHeaderField:@"Cookie"];
	NSURLConnection* connection = [[NSURLConnection alloc]initWithRequest:request delegate:sharedObject];
	
	NSLog(@"request-->%@",[request allHTTPHeaderFields]);
	NSLog(@"request-->%@",request);
	[connection start];
	
	
}
#pragma mark - NSURLConnection deleages

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{
	data = [[NSMutableData alloc] init]; // _data being an ivar
	NSLog(@"response-->%@",response);
}
-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)_data
{
	[self.data appendData:_data];
	NSLog(@"_data--->%@",[[NSString alloc] initWithData:_data
											   encoding:NSUTF8StringEncoding]);
	
}
-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
	NSLog(@"->%@",[error localizedDescription]);
    // Handle the error properly
}
-(void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    //NSString* stringData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
	//[target performSelector:selector withObject:stringData];
}
@end
