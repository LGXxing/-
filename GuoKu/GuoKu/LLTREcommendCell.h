//
//  LLTREcommendCell.h
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTGuoKuEnginee.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "LLTTeleTextDetailViewController.h"
#import "LLTRecommendSmallTableViewCell.h"
#import "LLTRecommendSmall2TableViewCell.h"
#import "LLTCommodityDetailViewController.h"

@interface LLTREcommendCell : UICollectionViewCell<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_productTableView;
}
@property (nonatomic, strong)NSArray *commodityArray;
@property (nonatomic, strong)NSArray *teleTextArray;
@property (nonatomic, assign)NSInteger cellType;
@property (nonatomic, assign)UIViewController *superViewController;
@end
