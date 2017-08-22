//
//  LLTRecommendSmallTableViewCell.h
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLTRecommendSmallTableViewCell : UITableViewCell

{
    
    __weak IBOutlet UIImageView *_commentImage;
}

@property (weak, nonatomic) IBOutlet UIButton *cell1ImageBtn;
@property (weak, nonatomic) IBOutlet UILabel *cell1ContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *cell1TimeLabel;
@property (strong,nonatomic)UILabel *commentLabel;

+ (LLTRecommendSmallTableViewCell *)getCell;
@end
