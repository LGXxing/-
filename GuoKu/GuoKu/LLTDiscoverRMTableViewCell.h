//
//  LLTDiscoverRMTableViewCell.h
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLTDiscoverRMTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

+ (instancetype)getCell;
@end
