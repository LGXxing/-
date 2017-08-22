//
//  LLTCommentTableViewCell.m
//  GuoKu
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTCommentTableViewCell.h"

@implementation LLTCommentTableViewCell

+ (LLTCommentTableViewCell *)getCell
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"LLTCommentTableViewCell" owner:nil options:nil];
    for (id obj in array)
    {
        if ([obj isKindOfClass:[LLTCommentTableViewCell class]])
        {
            return obj;
        }
    }
    return nil;
}

+ (CGFloat)getHeightWithString:(NSString *)str
{
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 60, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    
    return rect.size.height;
}

- (void)setCurrentCommodity:(LLTCommodity *)currentCommodity
{
    if (_currentCommodity != currentCommodity)
    {
        _currentCommodity = currentCommodity;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _headBnt.frame.size.width, _headBnt.frame.size.width)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:currentCommodity.creator.avatarURLStr]];
        imageView.layer.cornerRadius = imageView.frame.size.width / 2.0;
        imageView.clipsToBounds = YES;
        [_headBnt addSubview:imageView];
        
        [_nameBtn setTitle:currentCommodity.creator.nickName forState:UIControlStateNormal];
        _commpentLabel.text = currentCommodity.content;
        CGRect labelRect = _commpentLabel.frame;
        labelRect.size.height = [LLTCommentTableViewCell getHeightWithString:currentCommodity.content];
        _commpentLabel.frame = labelRect;
        _goodBtn.Selected = currentCommodity.likeAlready;
        _timeLabel.text = [currentCommodity.sendTime componentsSeparatedByString:@" "][0];
        
    }
}

@end
