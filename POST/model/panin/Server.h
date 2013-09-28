//
//  Server.h
//  POST
//
//  Created by Arie on 9/28/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Server : NSManagedObject

@property (nonatomic, retain) NSNumber * active;
@property (nonatomic, retain) NSString * url;

@end
