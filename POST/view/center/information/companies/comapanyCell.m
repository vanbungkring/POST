//
//  comapanyCell.m
//  POST
//
//  Created by Arie on 9/19/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "comapanyCell.h"

@implementation comapanyCell
@synthesize no;
@synthesize code;
@synthesize cp_name;
@synthesize prev;
@synthesize sb_sc;
@synthesize mk_cp;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		no = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 30, 25)];
		no.backgroundColor = [UIColor clearColor];
		no.textAlignment =  NSTextAlignmentCenter;
		no.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		no.textColor = [UIColor whiteColor];
		
		code = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 100, 25)];
		code.backgroundColor = [UIColor clearColor];
		code.textAlignment =  NSTextAlignmentCenter;
		code.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		code.textColor = [UIColor whiteColor];
		//code.text = @"AAPL";
		
		cp_name = [[UILabel alloc] initWithFrame:CGRectMake(190, 5, 200, 25)];
		cp_name.backgroundColor = [UIColor clearColor];
		cp_name.textAlignment =  NSTextAlignmentCenter;
		cp_name.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		cp_name.textColor = [UIColor whiteColor];
		//cp_name.text = @"AAPL";
		
		prev = [[UILabel alloc] initWithFrame:CGRectMake(450, 5, 100, 25)];
		prev.backgroundColor = [UIColor clearColor];
		prev.textAlignment =  NSTextAlignmentCenter;
		prev.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		prev.textColor = [UIColor whiteColor];
		
		sb_sc = [[UILabel alloc] initWithFrame:CGRectMake(620, 5, 160, 25)];
		sb_sc.backgroundColor = [UIColor clearColor];
		sb_sc.textAlignment =  NSTextAlignmentCenter;
		sb_sc.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		sb_sc.textColor = [UIColor whiteColor];
		
		mk_cp = [[UILabel alloc] initWithFrame:CGRectMake(820, 5, 120, 25)];
		mk_cp.backgroundColor = [UIColor clearColor];
		mk_cp.textAlignment =  NSTextAlignmentCenter;
		mk_cp.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
		mk_cp.textColor = [UIColor whiteColor];
		
		
		[self.contentView addSubview:no];
		[self.contentView addSubview:code];
		[self.contentView addSubview:cp_name];
		[self.contentView addSubview:prev];
		[self.contentView addSubview:sb_sc];
		[self.contentView addSubview:mk_cp];
		
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
