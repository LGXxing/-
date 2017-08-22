//
//  LLTCommodityDetailViewController.h
//  GuoKu
//
//  Created by mac on 15-10-28.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTCommodity.h"
#import "LLTImagesCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "LLTDiscoverSPTableViewCell.h"
#import "LLTCommentTableViewCell.h"
#import "LLTLikeListTableViewCell.h"
#import "LLTGuoKuEnginee.h"

@interface LLTCommodityDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{
    UITableView *_dataTabView;
    UIPageControl *_picPageControll;
    UICollectionView *_picCollectionView;
    UILabel *_titleLabel;
}

- (instancetype)initWithCommodity:(LLTCommodity *)commodity;
- (instancetype)initEntityID:(NSString *)entityID;
@property (nonatomic, strong)LLTCommodity *currentCommdity;
@property (nonatomic, strong)NSArray *likeArray;
@property (nonatomic, strong)NSArray *commentArray;
@property (nonatomic, strong)NSArray *entityArray;

@end
