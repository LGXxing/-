//
//  LLTDiscoverViewController.h
//  GuoKu
//
//  Created by mac on 15-10-26.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTSearchResultViewController.h"
#import "LLTImagesCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "LLTGuoKuEnginee.h"
#import "LLTDiscoverTJTableViewCell.h"
#import "LLTDiscoverRMTableViewCell.h"
#import "LLTDiscoverSPTableViewCell.h"
#import "LLTTeleTextDetailViewController.h"
#import "LLTCommodityDetailViewController.h"

@interface LLTDiscoverViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_dataTableView;
    UICollectionView *_picCollectionView;
}
@property (nonatomic, strong)UISearchController *searchController;
@property (nonatomic, strong)NSArray *articalArray;
@property (nonatomic, strong)NSArray *bannerArray;
@property (nonatomic, strong)NSArray *categoryArray;
@property (nonatomic, strong)NSArray *entityArray;

@end
