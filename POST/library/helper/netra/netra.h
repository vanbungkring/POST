//
//  netra.h
//  POST
//
//  Created by Arie on 9/17/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface netra : NSObject

@property (nonatomic, retain) NSString *sessionString;
// Required: A method to retrieve the shared instance
+(netra *) sharedInstance;
+(NSString *) getSessionActive;
+(void) setSessionId:(NSString *)session; ///set session string

@end
