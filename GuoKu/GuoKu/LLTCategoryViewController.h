//
//  LLTCategoryViewController.h
//  GuoKu
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTGuoKuEnginee.h"
#import "LLTCategory.h"
#import "LLTCategoryTableViewCell.h"
#import "LLTCommodityDetailViewController.h"

@interface LLTCategoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_dataTabView;
    UILabel *_titleLabel;
}
@property (nonatomic, strong)NSArray *entityArray;
@property (nonatomic, strong)LLTCategory *category;
- (instancetype)initWithCategory:(LLTCategory *)category;


@end
