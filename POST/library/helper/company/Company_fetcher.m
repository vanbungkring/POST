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

	NSLog(@"123");
}
@end
