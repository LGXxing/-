//
//  LLTRecommendSmall2TableViewCell.m
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTRecommendSmall2TableViewCell.h"

@implementation LLTRecommendSmall2TableViewCell

+ (LLTRecommendSmall2TableViewCell *)getCell
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"LLTRecommendSmall2TableViewCell" owner:nil options:nil];
    
        for (id obj in array)
        {
            if ([obj isKindOfClass:[LLTRecommendSmall2TableViewCell class   ]])
            {
                return obj;
            }
        }
    return nil;
}

@end
