//
//  LLTRecommendSmallTableViewCell.m
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTRecommendSmallTableViewCell.h"

@implementation LLTRecommendSmallTableViewCell

- (void)awakeFromNib
{
    _commentLabel = [[UILabel alloc] initWithFrame:_commentImage.bounds];
    [_commentImage addSubview:_commentLabel];
    _commentLabel.textAlignment = NSTextAlignmentCenter;
    _commentLabel.textColor = [UIColor lightGrayColor];
    _commentLabel.font = [UIFont systemFontOfSize:14];
}

+ (LLTRecommendSmallTableViewCell *)getCell
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"LLTRecommendSmallTableViewCell" owner:nil options:nil];
    
    for (id obj in array)
    {
        if ([obj isKindOfClass:[LLTRecommendSmallTableViewCell class   ]])
        {
            return obj;
        }
    }
    return nil;
}

@end
