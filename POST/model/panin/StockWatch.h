//
//  StockWatch.h
//  POST
//
//  Created by Arie on 9/29/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StockWatch : NSManagedObject

@property (nonatomic, retain) NSNumber * stock_watch_id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * index;

@end
