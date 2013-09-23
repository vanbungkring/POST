//
//  leftCell.m
//  POST
//
//  Created by Arie on 9/13/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "leftCell.h"

@implementation leftCell

@synthesize text = _text;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		_text = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 300, 25)];
		_text.backgroundColor = [UIColor clearColor];
		_text.textColor=[UIColor colorWithRed:0.941 green:0.957 blue:0.969 alpha:1];
		[_text setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13]];
		
		[self.contentView addSubview:_text];
		
		self.contentView.backgroundColor = [UIColor colorWithRed:0.106 green:0.145 blue:0.184 alpha:1];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	self.contentView.backgroundColor = [UIColor colorWithRed:0.173 green:0.239 blue:0.31 alpha:1] ;
    // Configure the view for the selected state
}

@end
