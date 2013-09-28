//
//  netra.m
//  POST
//
//  Created by Arie on 9/17/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "netra.h"
@implementation netra

@synthesize sessionString;
static netra *sharedObject;

+ (netra*)sharedInstance
{
    if (sharedObject == nil) {
        sharedObject = [[super allocWithZone:NULL] init];
    }
    return sharedObject;
}

+(NSString *) getSessionActive {
    // Ensure we are using the shared instance
    netra *shared = [netra sharedInstance];
    return shared.sessionString;
}
+(void) setSessionId:(NSString *)session {
    // Ensure we are using the shared instance
    netra *shared = [netra sharedInstance];
    shared.sessionString = session;
}
///configure once in live
+(BOOL)server{

	return true;
}
+(BOOL)stockWatch {
	
	return true;
}
NSString* const baseUrl =@"http://202.53.249.3" ;
@end
