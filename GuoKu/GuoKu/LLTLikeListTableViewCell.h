//
//  LLTCommentTableViewCell.h
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTUser.h"
#import "UIButton+WebCache.h"

@interface LLTLikeListTableViewCell : UITableViewCell

@property (nonatomic, strong)NSArray *likeArray;
@property (nonatomic, strong)UILabel *likeLabel;
+ (LLTLikeListTableViewCell *)getCell;

@end
