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

-(id) initWithTarget:(NSObject*) _target
{
	if (self = [super init])
	{
		self.target = _target;
	}
	NSLog(@"123");
	return self;
}
-(void)StopStream{

}
-(void)StartStream
{
	NSLog(@"start Stream with session id->%@",[netra getSessionActive]);
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/mi2/marketInfoData?request=dataStream",baseUrl]]];
	[request setValue:[NSString stringWithFormat:@"JSESSIONID=%@",[netra getSessionActive]] forHTTPHeaderField:@"Cookie"];
	NSURLConnection* connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
	
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
	
	[self filter:_data];
	
}
-(void)filter:(NSData *)filters{

	// Print the response body in text
	//NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
	NSMutableArray *buffer = [[NSMutableArray alloc]init];
	NSString *buffers = [[NSString alloc] initWithData:filters encoding:NSUTF8StringEncoding];
	NSArray *testArray = [buffers componentsSeparatedByString:@"}"];
	//NSArray *testArrays = [testArray componentsSeparatedByString:@"]}"];

	buffer = [NSMutableArray arrayWithArray:testArray];
	NSMutableArray *stringArray =[[NSMutableArray alloc]init];
	NSMutableArray *clean_data = [[NSMutableArray alloc]init];
	//NSMutableArray *stringArray =[[NSMutableArray alloc]init];
	for (int i=0; i<buffer.count; i++) {
	    NSString *first=[[[buffer objectAtIndex:i] stringByReplacingOccurrencesOfString:@"{" withString:@""]stringByReplacingOccurrencesOfString:@"]," withString:@",SQ"];
		NSString *second = [first stringByReplacingOccurrencesOfString:@"\"" withString:@""];
		NSString *third = [[second stringByReplacingOccurrencesOfString:@"data:[" withString:@""]stringByReplacingOccurrencesOfString:@"}" withString:@""];
		NSString *fourth = [[third stringByReplacingOccurrencesOfString:@"id:" withString:@""] stringByReplacingOccurrencesOfString:@"req:SQ" withString:@""];
		
		
		////start doing filter here
		
		
		NSArray *separate =[fourth componentsSeparatedByString:@","];
		NSLog(@"separat-->%@",[separate objectAtIndex:i]);
		NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
		for (int i = 0; i<[separate count]; i++) {
			[dic setValue:[separate objectAtIndex:i] forKey:[NSString stringWithFormat:@"id[%d]", i]];
			[stringArray addObject:dic];
			
		}
		if (![clean_data containsObject:dic]) {
			[clean_data addObject:dic];
			
			
		}
		//NSLog(@"clean data->%@",clean_data);


	}

}
-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
	NSLog(@"->%@",[error localizedDescription]);
	[self StartStream];
    // Handle the error properly
}
-(void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    //NSString* stringData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
	//[target performSelector:selector withObject:stringData];
}

@end
