//
//  LLTDiscoverSPTableViewCell.m
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTDiscoverSPTableViewCell.h"

@implementation LLTDiscoverSPTableViewCell

- (void)initUI
{
    
    
    CGFloat itemWidth = [LLTDiscoverSPTableViewCell getItemWidth];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 0);
    _dataCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, itemWidth * ceil(_entityArray.count / 3)) collectionViewLayout:flowLayout];
    _dataCollectionView.delegate = self;
    _dataCollectionView.dataSource = self;
    _dataCollectionView.pagingEnabled = YES;
    _dataCollectionView.showsHorizontalScrollIndicator = NO;
    _dataCollectionView.backgroundColor = [UIColor colorWithRed:224 / 255.0 green:229 / 255.0 blue:235 / 255.0 alpha:1];
    
    [_dataCollectionView registerNib:[UINib nibWithNibName:@"LLTImagesCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"collCell"];
    _dataCollectionView.scrollEnabled = NO;
    
    [self addSubview:_dataCollectionView];
    
}

+ (CGFloat)getItemWidth
{
    return ([UIScreen mainScreen].bounds.size.width - 10) / 3 - 10;
}

- (void)setEntityArray:(NSArray *)entityArray
{
    if (_entityArray != entityArray)
    {
        _entityArray = entityArray;
        
        [self initUI];
        [_dataCollectionView reloadData];
    }
}

+ (instancetype)getCell
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"LLTDiscoverSPTableViewCell" owner:nil options:nil];
    for (id obj in array)
    {
        if ([obj isKindOfClass:[LLTDiscoverSPTableViewCell class]])
        {
            return obj;
        }
    }
    return nil;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _entityArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LLTImagesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
    LLTCommodity *commodity = self.entityArray[indexPath.row];
    
    [cell.showImageView sd_setImageWithURL:[NSURL URLWithString:commodity.contentImageStr] placeholderImage:[UIImage imageNamed:@"loading-static"]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LLTCommodity *commodity = self.entityArray[indexPath.row];
    LLTCommodityDetailViewController *deailVC = [[LLTCommodityDetailViewController alloc] initWithCommodity:commodity];
    deailVC.hidesBottomBarWhenPushed = YES;
    [self.superVC.navigationController pushViewController:deailVC animated:YES];
}
@end
