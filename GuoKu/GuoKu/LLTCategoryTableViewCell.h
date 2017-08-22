//
//  LLTCategoryTableViewCell.h
//  GuoKu
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTCommodity.h"
#import "UIImageView+WebCache.h"

@interface LLTCategoryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;

@property (strong, nonatomic)LLTCommodity *commodity;
+ (LLTCategoryTableViewCell *)getCell;

@end
