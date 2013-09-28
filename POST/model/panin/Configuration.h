//
//  Configuration.h
//  POST
//
//  Created by Arie on 9/28/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Configuration : NSManagedObject

@property (nonatomic, retain) NSNumber * stockWatch_init;
@property (nonatomic, retain) NSNumber * config_done;
@property (nonatomic, retain) NSNumber * stock_child_init;
@property (nonatomic, retain) NSNumber * server_config;

@end
