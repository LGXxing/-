//
//  LLTDiscoverTJTableViewCell.h
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTImagesWithLabelCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "LLTCategoryViewController.h"
#import "LLTCategory.h"

@interface LLTDiscoverTJTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    
    UICollectionView *_dataCollectionView;
}
@property (nonatomic, strong)NSArray *categoryArray;
@property (nonatomic, weak)UIViewController *superVC;

+ (instancetype)getCell;
+ (CGFloat)getItemWidth;
@end
