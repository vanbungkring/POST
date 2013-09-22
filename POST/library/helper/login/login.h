//
//  login.h
//  POST
//
//  Created by Arie on 9/22/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface login : NSObject
+(login *) sharedInstance;
+(void)login_toServer:(NSString*)username password:(NSString*)password;
@end
