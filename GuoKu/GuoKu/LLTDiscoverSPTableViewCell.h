//
//  LLTDiscoverSPTableViewCell.h
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTImagesCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "LLTCommodity.h"
#import "LLTCommodityDetailViewController.h"

@interface LLTDiscoverSPTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{
    
    UICollectionView *_dataCollectionView;
}
@property (nonatomic, strong)NSArray *entityArray;
@property (nonatomic, weak)UIViewController *superVC;
+ (instancetype)getCell;
+ (CGFloat)getItemWidth;
@end
