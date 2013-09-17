//
//  sqCell.m
//  POST
//
//  Created by Arie on 9/17/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "sqCell.h"

@implementation sqCell
@synthesize no;
@synthesize code;
@synthesize last;
@synthesize change;
@synthesize change_p;
@synthesize fb_val;
@synthesize fb_vol;
@synthesize fs_val;
@synthesize fs_vol;
@synthesize value;
@synthesize volume;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		no = [[UILabel alloc] initWithFrame:CGRectMake(5, 2, 30, 25)];
		no.backgroundColor = [UIColor clearColor];
		no.textAlignment =  NSTextAlignmentCenter;
		no.font =  [UIFont fontWithName:@"HelveticaNeue" size:10];
		no.textColor = [UIColor whiteColor];
		
		code = [[UILabel alloc] initWithFrame:CGRectMake(70, 2, 50, 25)];
		code.backgroundColor = [UIColor clearColor];
		code.textAlignment =  NSTextAlignmentCenter;
		code.font =  [UIFont fontWithName:@"HelveticaNeue" size:10];
		code.textColor = [UIColor whiteColor];
		code.text = @"AAPL";
		
		last = [[UILabel alloc] initWithFrame:CGRectMake(165, 2, 50, 25)];
		last.backgroundColor = [UIColor clearColor];
		last.textAlignment =  NSTextAlignmentCenter;
		last.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		last.textColor = [UIColor whiteColor];
		last.text = @"100000";
		
		change = [[UILabel alloc] initWithFrame:CGRectMake(255, 2, 50, 25)];
		change.backgroundColor = [UIColor clearColor];
		change.textAlignment =  NSTextAlignmentCenter;
		change.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		change.textColor = [UIColor whiteColor];
		change.text = @"10000";
		
		change_p = [[UILabel alloc] initWithFrame:CGRectMake(355, 2, 50, 25)];
		change_p.backgroundColor = [UIColor clearColor];
		change_p.textAlignment =  NSTextAlignmentCenter;
		change_p.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		change_p.textColor = [UIColor whiteColor];
		change_p.text = @"2.5";
		
		fb_val = [[UILabel alloc] initWithFrame:CGRectMake(450, 2, 50, 25)];
		fb_val.backgroundColor = [UIColor clearColor];
		fb_val.textAlignment =  NSTextAlignmentCenter;
		fb_val.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		fb_val.textColor = [UIColor whiteColor];
		fb_val.text = @"150000";
		
		fb_vol = [[UILabel alloc] initWithFrame:CGRectMake(535, 2, 50, 25)];
		fb_vol.backgroundColor = [UIColor clearColor];
		fb_vol.textAlignment =  NSTextAlignmentCenter;
		fb_vol.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		fb_vol.textColor = [UIColor whiteColor];
		fb_vol.text = @"150000";
		
		fs_val = [[UILabel alloc] initWithFrame:CGRectMake(635, 2, 50, 25)];
		fs_val.backgroundColor = [UIColor clearColor];
		fs_val.textAlignment =  NSTextAlignmentCenter;
		fs_val.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		fs_val.textColor = [UIColor whiteColor];
		fs_val.text = @"50000";
		
		fs_vol = [[UILabel alloc] initWithFrame:CGRectMake(725, 2, 50, 25)];
		fs_vol.backgroundColor = [UIColor clearColor];
		fs_vol.textAlignment =  NSTextAlignmentCenter;
		fs_vol.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		fs_vol.textColor = [UIColor whiteColor];
		fs_vol.text = @"50000";
		
		value = [[UILabel alloc] initWithFrame:CGRectMake(825, 2, 50, 25)];
		value.backgroundColor = [UIColor clearColor];
		value.textAlignment =  NSTextAlignmentCenter;
		value.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		value.textColor = [UIColor whiteColor];
		value.text = @"50000";
		
		volume = [[UILabel alloc] initWithFrame:CGRectMake(915, 2, 50, 25)];
		volume.backgroundColor = [UIColor clearColor];
		volume.textAlignment =  NSTextAlignmentCenter;
		volume.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		volume.textColor = [UIColor whiteColor];
		volume.text = @"50000";
		
		
		[self.contentView addSubview:no];
		[self.contentView addSubview:code];
		[self.contentView addSubview:last];
		[self.contentView addSubview:change];
		[self.contentView addSubview:change_p];
		
		[self.contentView addSubview:fb_val];
		[self.contentView addSubview:fb_vol];
		
		[self.contentView addSubview:fs_val];
		[self.contentView addSubview:fs_vol];
		
		[self.contentView addSubview:value];
		[self.contentView addSubview:volume];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
	UIView *view = [[UIView alloc] initWithFrame:self.frame];
    view.backgroundColor = [UIColor blackColor];
	
    self.selectedBackgroundView = view;
	
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
