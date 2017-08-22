//
//  LLTImagesWithLabelCollectionViewCell.h
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLTImagesWithLabelCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
@property (weak, nonatomic) IBOutlet UILabel *upTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *downTitleLabel;

@end
