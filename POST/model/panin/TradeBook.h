//
//  TradeBook.h
//  POST
//
//  Created by Arie on 9/29/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TradeBook : NSManagedObject

@property (nonatomic, retain) NSString * tb_code;
@property (nonatomic, retain) NSNumber * tb_index;
@property (nonatomic, retain) NSString * tb_name;

@end
