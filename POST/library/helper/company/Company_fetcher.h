//
//  Company_fetcher.h
//  POST
//
//  Created by Arie on 9/22/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company_fetcher : NSObject
+ (Company_fetcher *)sharedEngine;
+ (void)syncCompany;
@end
