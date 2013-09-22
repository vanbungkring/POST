//
//  PaninStreamer.h
//  POST
//
//  Created by Arie on 9/22/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaninStreamer : NSObject 
{

	NSMutableData* data;
	NSObject* target;
	SEL selector;
}
+(PaninStreamer *) sharedInstance;
@property (nonatomic, retain) NSMutableData* data;
@property (nonatomic, retain) NSObject* target;
@property (nonatomic) SEL selector;
+(void) StartStream;
@end