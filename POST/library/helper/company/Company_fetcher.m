//
//  Company_fetcher.m
//  POST
//
//  Created by Arie on 9/22/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "Company_fetcher.h"

@implementation Company_fetcher
+ (Company_fetcher *)sharedEngine {
    static Company_fetcher *sharedEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedEngine = [[Company_fetcher alloc] init];
    });
	
    return sharedEngine;
}
+(void)syncCompany{
	NSManagedObjectContext *localContext = [NSManagedObjectContext MR_defaultContext];
	StockInit *stock = [StockInit MR_createInContext:localContext];
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"stockInit", @"request",
							nil];
	NSMutableArray *dataStock = [[NSMutableArray alloc]init];
	NSArray *isExist = [StockInit MR_findAll];
	if(isExist.count >0){
		
		AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
		
		NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
																path:@"mi2/marketInfoData?"
														  parameters:params];
		
		[httpClient setParameterEncoding:AFFormURLParameterEncoding];
		
		AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
		
		[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
		
		[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
			// Print the response body in text
			//NSLog(@"response string->%@",operation.responseString);
			//NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
			NSString *buffers = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
			NSArray *testArray = [buffers componentsSeparatedByString:@"]}"];
			NSLog(@"test array-->%@",testArray);
			//NSArray *testArrays = [testArray componentsSeparatedByString:@"]}"];
			NSMutableArray *buffer;
			buffer = [NSMutableArray arrayWithArray:testArray];
			NSMutableArray *stringArray =[[NSMutableArray alloc]init];
			for (int i=0; i<buffer.count; i++) {
				NSString *first=[[buffer objectAtIndex:i] stringByReplacingOccurrencesOfString:@"{" withString:@""];
				NSString *second = [first stringByReplacingOccurrencesOfString:@"\"" withString:@""];
				NSString *third = [second stringByReplacingOccurrencesOfString:@"data:[" withString:@""];
				NSString *fourth = [third stringByReplacingOccurrencesOfString:@"id:" withString:@""];
				
				NSArray *separate =[fourth componentsSeparatedByString:@","];
				NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
				for (int i = 0; i<[separate count]; i++) {
					[dic setValue:[separate objectAtIndex:i] forKey:[NSString stringWithFormat:@"id[%d]", i]];
					[stringArray addObject:dic];
					
				}
				[dataStock addObject:dic];
				
				
			}
			for (int i=0; i<dataStock.count; i++) {
				stock.date = [NSDate date];
				stock.st_id = [NSString stringWithFormat:@"%@",[[dataStock objectAtIndex:i]objectForKey:@"id[0]"]];
				stock.code = [NSString stringWithFormat:@"%@",[[dataStock objectAtIndex:i]objectForKey:@"id[1]"]];
				stock.name = [NSString stringWithFormat:@"%@",[[dataStock objectAtIndex:i]objectForKey:@"id[3]"]];
				stock.mkt = [NSString stringWithFormat:@"%@",[[dataStock objectAtIndex:i]objectForKey:@"id[2]"]];
				stock.subsector = [NSString stringWithFormat:@"%@",[[dataStock objectAtIndex:i]objectForKey:@"id[6]"]];
				stock.prev = [NSString stringWithFormat:@"%@",[[dataStock objectAtIndex:i]objectForKey:@"id[4]"]];
				stock.mc = [NSString stringWithFormat:@"%@",[[dataStock objectAtIndex:i]objectForKey:@"id[10]"]];
				[localContext MR_save];
				
			}
			
			NSLog(@"fetch Selesai");
		
		} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			NSLog(@"Error: %@", error);
		}];
		[operation start];
		
		
	}
	
}
-(void) insertIntoCoredata{

}
@end
