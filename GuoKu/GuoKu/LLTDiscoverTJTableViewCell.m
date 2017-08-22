//
//  LLTDiscoverTJTableViewCell.m
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTDiscoverTJTableViewCell.h"

@implementation LLTDiscoverTJTableViewCell

- (void)awakeFromNib
{
    CGFloat itemWidth = [LLTDiscoverTJTableViewCell getItemWidth];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _dataCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, itemWidth + 20) collectionViewLayout:flowLayout];
    _dataCollectionView.delegate = self;
    _dataCollectionView.dataSource = self;
    _dataCollectionView.pagingEnabled = YES;
    _dataCollectionView.showsHorizontalScrollIndicator = NO;
    _dataCollectionView.backgroundColor = [UIColor colorWithRed:224 / 255.0 green:229 / 255.0 blue:235 / 255.0 alpha:1];
    
    [_dataCollectionView registerNib:[UINib nibWithNibName:@"LLTImagesWithLabelCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"collCell"];
    
    [self addSubview:_dataCollectionView];

}

+ (instancetype)getCell
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"LLTDiscoverTJTableViewCell" owner:nil options:nil];
    for (id obj in array)
    {
        if ([obj isKindOfClass:[LLTDiscoverTJTableViewCell class]])
        {
            return obj;
        }
    }
    return nil;
}

- (void)setCategoryArray:(NSArray *)categoryArray
{
    if (_categoryArray != categoryArray)
    {
        _categoryArray = categoryArray;
        [_dataCollectionView reloadData];
    }
}

+ (CGFloat)getItemWidth
{
    return ([UIScreen mainScreen].bounds.size.width - 10) / 3 - 10;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _categoryArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LLTImagesWithLabelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
    
    LLTCategory *category = self.categoryArray[indexPath.row];
    
    [cell.showImageView sd_setImageWithURL:[NSURL URLWithString:category.coverURLStr]];
    NSArray *strArray = [category.title componentsSeparatedByString:@" "];
    cell.upTitleLabel.text = strArray[0];
    cell.downTitleLabel.text = strArray[1];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LLTCategory *category = self.categoryArray[indexPath.row];
    LLTCategoryViewController *categoryVC = [[LLTCategoryViewController alloc] initWithCategory:category];
    [self.superVC.navigationController pushViewController:categoryVC animated:YES];
}
@end
