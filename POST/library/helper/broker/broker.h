//
//  broker.h
//  POST
//
//  Created by Arie on 9/22/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface broker : NSObject

+(broker *) sharedInstance;
+(id)broker:(NSString *) stringBroker;
@end
