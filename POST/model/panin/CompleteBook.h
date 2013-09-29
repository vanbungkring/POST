//
//  CompleteBook.h
//  POST
//
//  Created by Arie on 9/29/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CompleteBook : NSManagedObject

@property (nonatomic, retain) NSString * cb_name;
@property (nonatomic, retain) NSString * cb_code;

@end
