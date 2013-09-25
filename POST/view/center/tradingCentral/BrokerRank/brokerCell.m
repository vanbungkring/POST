//
//  brokerCell.m
//  POST
//
//  Created by Arie on 9/18/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "brokerCell.h"

@implementation brokerCell
@synthesize no;
@synthesize code;
@synthesize b_freq;
@synthesize b_vol;
@synthesize b_val;
@synthesize s_freq;
@synthesize s_vol;
@synthesize s_val;
@synthesize n_vol;
@synthesize t_vol;
@synthesize n_val;
@synthesize t_val;

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
		
		code = [[UILabel alloc] initWithFrame:CGRectMake(60, 2, 50, 25)];
		code.backgroundColor = [UIColor clearColor];
		code.textAlignment =  NSTextAlignmentCenter;
		code.font =  [UIFont fontWithName:@"HelveticaNeue" size:10];
		code.textColor = [UIColor whiteColor];
		code.text = @"AAPL";
		
		b_freq = [[UILabel alloc] initWithFrame:CGRectMake(125, 2, 50, 25)];
		b_freq.backgroundColor = [UIColor clearColor];
		b_freq.textAlignment =  NSTextAlignmentCenter;
		b_freq.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		b_freq.textColor = [UIColor whiteColor];
		b_freq.text = @"0";
		
		b_vol = [[UILabel alloc] initWithFrame:CGRectMake(200, 2, 50, 25)];
		b_vol.backgroundColor = [UIColor clearColor];
		b_vol.textAlignment =  NSTextAlignmentCenter;
		b_vol.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		b_vol.textColor = [UIColor whiteColor];
		b_vol.text = @"0";
		
		b_val = [[UILabel alloc] initWithFrame:CGRectMake(280, 2, 50, 25)];
		b_val.backgroundColor = [UIColor clearColor];
		b_val.textAlignment =  NSTextAlignmentCenter;
		b_val.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		b_val.textColor = [UIColor whiteColor];
		b_val.text = @"0";
		
		s_freq = [[UILabel alloc] initWithFrame:CGRectMake(355, 2, 50, 25)];
		s_freq.backgroundColor = [UIColor clearColor];
		s_freq.textAlignment =  NSTextAlignmentCenter;
		s_freq.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		s_freq.textColor = [UIColor whiteColor];
		s_freq.text = @"0";
		
		s_vol = [[UILabel alloc] initWithFrame:CGRectMake(445, 2, 50, 25)];
		s_vol.backgroundColor = [UIColor clearColor];
		s_vol.textAlignment =  NSTextAlignmentCenter;
		s_vol.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		s_vol.textColor = [UIColor whiteColor];
		s_vol.text = @"0";
		
		s_val = [[UILabel alloc] initWithFrame:CGRectMake(535, 2, 50, 25)];
		s_val.backgroundColor = [UIColor clearColor];
		s_val.textAlignment =  NSTextAlignmentCenter;
		s_val.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		s_val.textColor = [UIColor whiteColor];
		s_val.text = @"0";
		
		n_vol = [[UILabel alloc] initWithFrame:CGRectMake(620, 2, 50, 25)];
		n_vol.backgroundColor = [UIColor clearColor];
		n_vol.textAlignment =  NSTextAlignmentCenter;
		n_vol.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		n_vol.textColor = [UIColor whiteColor];
		n_vol.text = @"0";
		
		t_vol = [[UILabel alloc] initWithFrame:CGRectMake(700, 2, 50, 25)];
		t_vol.backgroundColor = [UIColor clearColor];
		t_vol.textAlignment =  NSTextAlignmentCenter;
		t_vol.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		t_vol.textColor = [UIColor whiteColor];
		t_vol.text = @"0";
		
		n_val = [[UILabel alloc] initWithFrame:CGRectMake(790, 2, 50, 25)];
		n_val.backgroundColor = [UIColor clearColor];
		n_val.textAlignment =  NSTextAlignmentCenter;
		n_val.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		n_val.textColor = [UIColor whiteColor];
		n_val.text = @"0";
		
		t_val = [[UILabel alloc] initWithFrame:CGRectMake(890, 2, 50, 25)];
		t_val.backgroundColor = [UIColor clearColor];
		t_val.textAlignment =  NSTextAlignmentCenter;
		t_val.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		t_val.textColor = [UIColor whiteColor];
		t_val.text = @"0";
		
		
		[self.contentView addSubview:no];
		[self.contentView addSubview:code];
		[self.contentView addSubview:b_freq];
		[self.contentView addSubview:b_vol];
		[self.contentView addSubview:b_val];
		
		[self.contentView addSubview:s_freq];
		[self.contentView addSubview:s_vol];
		
		[self.contentView addSubview:s_val];
		[self.contentView addSubview:n_vol];
		
		[self.contentView addSubview:t_vol];
		[self.contentView addSubview:n_val];
		[self.contentView addSubview:t_val];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
