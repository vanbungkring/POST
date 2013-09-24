//
//  StockInit.h
//  POST
//
//  Created by Arie on 9/25/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StockInit : NSManagedObject

@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) NSString * mc;
@property (nonatomic, retain) NSString * mkt;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * prev;
@property (nonatomic, retain) NSString * subsector;
@property (nonatomic, retain) NSString * st_id;
@property (nonatomic, retain) NSDate * date;

@end
