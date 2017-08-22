//
//  LLTCommentTableViewCell.h
//  GuoKu
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTCommodity.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"

@interface LLTCommentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *headBnt;
@property (weak, nonatomic) IBOutlet UIButton *nameBtn;
@property (weak, nonatomic) IBOutlet UILabel *commpentLabel;
@property (weak, nonatomic) IBOutlet UIButton *goodBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *commpentBtn;

@property (nonatomic, strong)LLTCommodity *currentCommodity;
+ (LLTCommentTableViewCell *)getCell;

+ (CGFloat)getHeightWithString:(NSString *)str;

@end
