//
//  liveTradeCell.m
//  POST
//
//  Created by Arie on 9/14/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "liveTradeCell.h"

@implementation liveTradeCell

@synthesize time = _time;
@synthesize code = _code;
@synthesize mkt = _mkt;
@synthesize price = _price;
@synthesize vol = _vol;
@synthesize pm = _pm;
@synthesize status = _status;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		
		_time = [[UILabel alloc] initWithFrame:CGRectMake(5, 2, 90, 25)];
		_time.backgroundColor = [UIColor clearColor];
		_time.font =  [UIFont fontWithName:@"Open Sans" size:9];
		_time.textColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.357 alpha:1];
		
		_code = [[UILabel alloc] initWithFrame:CGRectMake(95, 2, 70, 25)];
		_code.backgroundColor = [UIColor clearColor];
		_code.font =  [UIFont fontWithName:@"Open Sans" size:13];
		_code.textColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.357 alpha:1];
		
		_status = [[UILabel alloc] initWithFrame:CGRectMake(65, 2, 70, 25)];
		_status.backgroundColor = [UIColor clearColor];
		_status.font =  [UIFont fontWithName:@"Open Sans" size:13];
		_status.text = @"B";
		_status.textColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.357 alpha:1];
		
		_mkt = [[UILabel alloc] initWithFrame:CGRectMake(160, 2, 70, 25)];
		_mkt.backgroundColor = [UIColor clearColor];
		_mkt.font =  [UIFont fontWithName:@"Open Sans" size:13];
		_mkt.text = @"INA";
		_mkt.textColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.357 alpha:1];
		
		_price = [[UILabel alloc] initWithFrame:CGRectMake(180, 2, 70, 25)];
		_price.backgroundColor = [UIColor clearColor];
		_price.textAlignment = NSTextAlignmentCenter;
		_price.font =  [UIFont fontWithName:@"Open Sans" size:13];
		_price.textColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.357 alpha:1];
		
		_vol = [[UILabel alloc] initWithFrame:CGRectMake(225, 2, 70, 25)];
		_vol.backgroundColor = [UIColor clearColor];
		_vol.textAlignment = NSTextAlignmentCenter;
		_vol.font =  [UIFont fontWithName:@"Open Sans" size:13];
		_vol.textColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.357 alpha:1];
		_vol.text = @"400";
		
		_pm = [[UILabel alloc] initWithFrame:CGRectMake(280, 2, 70, 25)];
		_pm.backgroundColor = [UIColor clearColor];
		_pm.textAlignment = NSTextAlignmentCenter;
		_pm.font =  [UIFont fontWithName:@"Open Sans" size:13];
		_pm.textColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.357 alpha:1];
		_pm.text = @"400";
		
		self.percent = [[UILabel alloc] initWithFrame:CGRectMake(310, 2, 70, 25)];
		self.percent.backgroundColor = [UIColor clearColor];
		self.percent.textAlignment = NSTextAlignmentCenter;
		self.percent.font =  [UIFont fontWithName:@"Open Sans" size:13];
		self.percent.textColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.357 alpha:1];
		self.percent.text = @"0.4";
		
		self.bs = [[UILabel alloc] initWithFrame:CGRectMake(370, 2, 70, 25)];
		self.bs.backgroundColor = [UIColor clearColor];
		self.bs.textAlignment = NSTextAlignmentCenter;
		self.bs.font =  [UIFont fontWithName:@"Open Sans" size:13];
		self.bs.textColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.357 alpha:1];
		self.bs.text = @"0.4";
		
		self.sell = [[UILabel alloc] initWithFrame:CGRectMake(420, 2, 70, 25)];
		self.sell.backgroundColor = [UIColor clearColor];
		self.sell.textAlignment = NSTextAlignmentCenter;
		self.sell.font =  [UIFont fontWithName:@"Open Sans" size:13];
		self.sell.textColor = [UIColor colorWithRed:0.18 green:0.8 blue:0.357 alpha:1];
		self.sell.text = @"0.4";
		
		
		[self.contentView addSubview:_time];
		[self.contentView addSubview:_code];
		[self.contentView addSubview:_mkt];
		[self.contentView addSubview:_price];
		[self.contentView addSubview:_vol];
		[self.contentView addSubview:_status];
		[self.contentView addSubview:_pm];
		[self.contentView addSubview:self.percent];
		[self.contentView addSubview:self.bs];
		[self.contentView addSubview:self.sell];
		
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
