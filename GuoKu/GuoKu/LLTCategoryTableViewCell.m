//
//  LLTCategoryTableViewCell.m
//  GuoKu
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTCategoryTableViewCell.h"

@implementation LLTCategoryTableViewCell


+ (LLTCategoryTableViewCell *)getCell
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"LLTCategoryTableViewCell" owner:nil options:nil];
    for (id obj in array)
    {
        if ([obj isKindOfClass:[LLTCategoryTableViewCell class]])
        {
            return obj;
        }
    }
    return nil;
}


- (void)setCommodity:(LLTCommodity *)commodity
{
    if (_commodity != commodity)
    {
        _commodity = commodity;
        [_showImageView sd_setImageWithURL:[NSURL URLWithString:_commodity.contentImageStr]];
        _titleLabel.text = commodity.title;
        _priceLabel.text =  [NSString stringWithFormat:@"¥%@",commodity.price];
        _likeLabel.text = [NSString stringWithFormat:@"%ld",commodity.likeCount];
        _commentLabel.text = [NSString stringWithFormat:@"%ld",commodity.noteCount];
    }
}

@end
