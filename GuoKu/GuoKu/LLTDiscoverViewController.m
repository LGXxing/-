//
//  LLTDiscoverViewController.m
//  GuoKu
//
//  Created by mac on 15-10-26.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTDiscoverViewController.h"

@implementation LLTDiscoverViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initUI];
    [self initData];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)initData
{
    [LLTGuoKuEnginee getDiscovertWithComplete:^(NSDictionary *dict) {
        
        self.articalArray = dict[@"article"];
        self.bannerArray = dict[@"banner"];
        self.categoryArray = dict[@"category"];
        self.entityArray = dict[@"entity"];
        
        [_dataTableView reloadData];
        [_picCollectionView reloadData];
        [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    }];
    
}

- (void)initUI
{
    LLTSearchResultViewController *searchResultVC = [[LLTSearchResultViewController alloc] init];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultVC];
    
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.searchResultsUpdater = searchResultVC;
    self.searchController.searchBar.placeholder = @"搜索";
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.barTintColor = [UIColor whiteColor];
    
    UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44)];
    searchView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:searchView];
    [searchView addSubview:self.searchController.searchBar];

    _dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 74, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 74 - 49) style:UITableViewStylePlain];
    _dataTableView.tableFooterView = [[UIView alloc] init];
    _dataTableView.sectionHeaderHeight = 30;
    _dataTableView.delegate = self;
    _dataTableView.dataSource = self;
    [self.view addSubview:_dataTableView];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 150);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    _picCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150) collectionViewLayout:flowLayout];
    _picCollectionView.delegate = self;
    _picCollectionView.dataSource = self;
    _picCollectionView.pagingEnabled = YES;
    _picCollectionView.showsHorizontalScrollIndicator = NO;
    _picCollectionView.backgroundColor = [UIColor whiteColor];
    [_picCollectionView registerNib:[UINib nibWithNibName:@"LLTImagesCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"collCell"];
    _dataTableView.tableHeaderView = _picCollectionView;
    
}

- (void)changeImage
{
    NSIndexPath *indexpath = [_picCollectionView indexPathsForVisibleItems][0];

    if (indexpath.row >= 10000 * self.bannerArray.count )
    {
        indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    else
    {
        indexpath = [NSIndexPath indexPathForRow:indexpath.row + 1 inSection:0];
    }

    [_picCollectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.bannerArray.count > 0? 10000 * self.bannerArray.count : 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LLTImagesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
    LLTBanner *banner = self.bannerArray[indexPath.row % self.bannerArray.count];
    [cell.showImageView sd_setImageWithURL:[NSURL URLWithString:banner.imageURLStr]];
    return cell;
}



#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LLTBanner *banner = self.bannerArray[indexPath.row % self.bannerArray.count];
    if (banner.bannerType == 1)
    {
        LLTTeleTextDetailViewController *detailVC = [[LLTTeleTextDetailViewController alloc] initWithDataURLStr:banner.urlStr];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    else
    {
        LLTCommodityDetailViewController * detailVC = [[LLTCommodityDetailViewController alloc] initEntityID:banner.urlStr];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    
}

// 去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 30;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (section == 1)
    {
        return self.articalArray.count;
    }
    return 1;
        
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        LLTDiscoverTJTableViewCell *tjCell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!tjCell)
        {
            tjCell = [LLTDiscoverTJTableViewCell getCell];
            tjCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        tjCell.categoryArray = self.categoryArray;
        tjCell.superVC = self;
        
        return tjCell;
    }
    else if (indexPath.section == 1)
    {
        LLTDiscoverRMTableViewCell *rmCell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!rmCell)
        {
            rmCell = [LLTDiscoverRMTableViewCell getCell];
            rmCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        LLTTeleText *teleText = self.articalArray[indexPath.row];
        
        [rmCell.showImageView sd_setImageWithURL:[NSURL URLWithString:teleText.coverURLStr]placeholderImage:[UIImage imageNamed:@"loading-static"]];
        rmCell.contentLabel.text = teleText.title;
        return rmCell;
    }
    LLTDiscoverSPTableViewCell *spCell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
    if (!spCell)
    {
        spCell = [LLTDiscoverSPTableViewCell getCell];
        spCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    spCell.superVC = self;
    spCell.entityArray = self.entityArray;
    return spCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {

        LLTTeleText *teleText = self.articalArray[indexPath.row];
        LLTTeleTextDetailViewController *detailVC = [[LLTTeleTextDetailViewController alloc] initWithDataURLStr:teleText];
        detailVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width , 30)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width - 10, 30)];
    titleLabel.font = [UIFont systemFontOfSize:14.0];
    titleLabel.textColor = [UIColor blackColor];
    
    if (section == 0)
    {
        titleLabel.text = @"推荐品类";
    }
    else if (section == 1)
    {
        titleLabel.text = @"热门图文";
    }
    else
    {
        titleLabel.text = @"热门商品";
    }
    [titleView addSubview:titleLabel];
    
    return titleView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return [LLTDiscoverTJTableViewCell getItemWidth] + 20;
    }
    if (indexPath.section == 1)
    {
        return 100;
    }
    CGFloat itemWidth = [LLTDiscoverSPTableViewCell getItemWidth];
    
    return itemWidth * 20 + 10;
}
@end
