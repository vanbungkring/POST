//
//  StockWatchChild.h
//  POST
//
//  Created by Arie on 9/29/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StockWatchChild : NSManagedObject

@property (nonatomic, retain) NSNumber * st_watch_id;
@property (nonatomic, retain) NSString * st_name;
@property (nonatomic, retain) NSString * st_code;
@property (nonatomic, retain) NSNumber * index;

@end
