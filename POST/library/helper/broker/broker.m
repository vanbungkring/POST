//
//  broker.m
//  POST
//
//  Created by Arie on 9/22/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "broker.h"

@implementation broker
static broker *sharedObject;

+ (broker*)sharedInstance
{
    if (sharedObject == nil) {
        sharedObject = [[super allocWithZone:NULL] init];
    }
    return sharedObject;
}
+(id)broker:(NSString *) stringBroker{

	
	NSMutableArray *array=[[NSMutableArray alloc]init];
	
	NSArray *testArray = [stringBroker componentsSeparatedByString:@"]}"];
	//NSArray *testArrays = [testArray componentsSeparatedByString:@"]}"];
	array = [NSMutableArray arrayWithArray:testArray];
	NSMutableArray *stringArray =[[NSMutableArray alloc]init];
	for (int i=0; i<array.count; i++) {
		NSString *first=[[array objectAtIndex:i] stringByReplacingOccurrencesOfString:@"{" withString:@""];
		NSString *second = [first stringByReplacingOccurrencesOfString:@"\"" withString:@""];
		NSString *third = [second stringByReplacingOccurrencesOfString:@"data:[" withString:@""];
		NSString *fourth = [third stringByReplacingOccurrencesOfString:@"id:" withString:@""];
		
		NSArray *separate =[fourth componentsSeparatedByString:@","];
		NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
		for (int i = 0; i<[separate count]; i++) {
			[dic setValue:[separate objectAtIndex:i] forKey:[NSString stringWithFormat:@"id[%d]", i]];
			[stringArray addObject:dic];
			
		}
		NSLog(@"dic00->%@",dic);
	}
	return array;
}


@end
