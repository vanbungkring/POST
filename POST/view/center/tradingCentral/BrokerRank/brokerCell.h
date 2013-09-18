//
//  brokerCell.h
//  POST
//
//  Created by Arie on 9/18/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface brokerCell : UITableViewCell
@property (nonatomic, strong) UILabel *no;
@property (nonatomic, strong) UILabel *code;
@property (nonatomic, strong) UILabel *b_freq;
@property (nonatomic, strong) UILabel *b_vol;
@property (nonatomic, strong) UILabel *b_val;
@property (nonatomic, strong) UILabel *s_freq;
@property (nonatomic, strong) UILabel *s_vol;
@property (nonatomic, strong) UILabel *s_val;
@property (nonatomic, strong) UILabel *n_vol;
@property (nonatomic, strong) UILabel *t_vol;
@property (nonatomic, strong) UILabel *n_val;
@property (nonatomic, strong) UILabel *t_val;
@end
