//
//  LLTDiscoverRMTableViewCell.m
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTDiscoverRMTableViewCell.h"

@implementation LLTDiscoverRMTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)getCell
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"LLTDiscoverRMTableViewCell" owner:nil options:nil];
    for (id obj in array)
    {
        if ([obj isKindOfClass:[LLTDiscoverRMTableViewCell class]])
        {
            return obj;
        }
    }
    return nil;
}

@end
