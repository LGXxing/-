//
//  LLTCommentTableViewCell.m
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTLikeListTableViewCell.h"

@implementation LLTLikeListTableViewCell

+ (LLTLikeListTableViewCell *)getCell
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"LLTLikeListTableViewCell" owner:nil options:nil];
    for (id obj in array)
    {
        if ([obj isKindOfClass:[LLTLikeListTableViewCell class]])
        {
            return obj;
        }
    }
    return nil;
}

- (void)initUI
{
    _likeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 25)];
    [self addSubview:_likeLabel];
    
    UIImageView *inImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 40, 10, 20, 20)];
    inImageView.image = [UIImage imageNamed:@"right"];
    [self addSubview:inImageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 30)];
    scrollView.contentSize = CGSizeMake(_likeArray.count * 40 + 20, 30);
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    
    for (int i = 0; i < _likeArray.count;i ++)
    {
        int x = i * 40 + 10;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, 30, 30)];
        btn.tag = i;
        LLTUser *user = _likeArray[i];
        
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:user.avatarURLStr] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = btn.frame.size.width / 2.0;
        btn.clipsToBounds = YES;
        
        [scrollView addSubview:btn];
    }
    
}

- (void)btnClicked:(UIButton *)sender
{
    LLTUser *user = _likeArray[sender.tag];
}

- (void)setLikeArray:(NSArray *)likeArray
{
    if (_likeArray != likeArray)
    {
        _likeArray = likeArray;
        [self initUI];
    }
}

@end
