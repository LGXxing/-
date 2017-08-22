//
//  LLTRecommendSmall2TableViewCell.h
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLTRecommendSmall2TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cell2ImageView;
@property (weak, nonatomic) IBOutlet UILabel *cell2TitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *cell2ContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *cell2TimeLabel;

+ (LLTRecommendSmall2TableViewCell *)getCell;
@end

