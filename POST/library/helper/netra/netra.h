//
//  netra.h
//  POST
//
//  Created by Arie on 9/17/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface netra : NSObject
{
	NSManagedObjectContext *localContext;
}
@property (nonatomic, retain) NSString *sessionString;
// Required: A method to retrieve the shared instance
+(netra *) sharedInstance;
+(NSString *) getSessionActive;
+(void) setSessionId:(NSString *)session; ///set session string
+(void) fetchBroker;
+(void) fetchCompany;

+(BOOL)server;
+(BOOL)stockInit;
+(BOOL)brokerInit;
+(BOOL)stockWatch;
extern NSString* const baseUrl;
@end
