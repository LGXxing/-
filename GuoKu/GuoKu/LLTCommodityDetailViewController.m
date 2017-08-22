//
//  LLTCommodityDetailViewController.m
//  GuoKu
//
//  Created by mac on 15-10-28.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTCommodityDetailViewController.h"


@implementation LLTCommodityDetailViewController

- (instancetype)initWithCommodity:(LLTCommodity *)commodity
{
    self = [super init];
    if (self)
    {
        _currentCommdity = commodity;
//        @[likeArray,noteArray,commodity];
        [LLTGuoKuEnginee getCommdityWithEntityID:commodity.entityID complete:^(NSArray *array) {
            self.likeArray = array[0];
            self.commentArray = array[1];
            self.currentCommdity = array[2];
            [_dataTabView reloadData];
            [_picCollectionView reloadData];
            [self initData];
            
        }];
//        sign值不可用
//        [LLTGuoKuEnginee getGuessWithEntityID:commodity.entityID complete:^(NSArray *array) {
//            self.entityArray = array;
//            [_dataTabView reloadData];
//        }];
        [self initUI];
        [self initData];
    }
    return self;
}

- (instancetype)initEntityID:(NSString *)entityID
{
    self = [super init];
    if (self)
    {

        [LLTGuoKuEnginee getCommdityWithEntityID:entityID complete:^(NSArray *array) {
            self.likeArray = array[0];
            self.commentArray = array[1];
            self.currentCommdity = array[2];
            [_dataTabView reloadData];
            [_picCollectionView reloadData];
            [self initData];
            
        }];
        //        sign值不可用
        //        [LLTGuoKuEnginee getGuessWithEntityID:commodity.entityID complete:^(NSArray *array) {
        //            self.entityArray = array;
        //            [_dataTabView reloadData];
        //        }];
        [self initUI];
        [self initData];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)initData
{
    _picPageControll.numberOfPages = self.currentCommdity.detailImagesArray.count;
    _titleLabel.text = self.currentCommdity.title;
}

- (void)initUI
{
    self.title = @"商品";
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    UILabel *backLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 44)];
    backLabel.textColor = [UIColor blackColor];
    backLabel.text = @"返回";
    [backView addSubview:backLabel];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(-20, 0, 44, 44)];
    [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"back_press"] forState:UIControlStateHighlighted];
    [backView addSubview:btn];
    
    UIButton *bigbtn = [[UIButton alloc] initWithFrame:CGRectMake(-20, 0, 70, 44)];
    [bigbtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:bigbtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backView];
    
    
    _dataTabView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:_dataTabView];
    _dataTabView.showsVerticalScrollIndicator = NO;
    
    UIView *headView =  [[UIView alloc] initWithFrame:CGRectMake(10, 0, _dataTabView.frame.size.width, 390)];

    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, headView.frame.size.width, 20)];
    [headView addSubview:_titleLabel];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(headView.frame.size.width, 300);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    _picCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, headView.frame.size.width, 300) collectionViewLayout:flowLayout];
    _picCollectionView.delegate = self;
    _picCollectionView.dataSource = self;
    _picCollectionView.pagingEnabled = YES;
    _picCollectionView.tag = 100;
    _picCollectionView.showsHorizontalScrollIndicator = NO;
    [headView addSubview:_picCollectionView];
    _picCollectionView.backgroundColor = [UIColor whiteColor];
    [_picCollectionView registerNib:[UINib nibWithNibName:@"LLTImagesCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"collCell"];
    
    _picPageControll = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _picCollectionView.frame.size.height, _picCollectionView.frame.size.width, 10)];
    _picPageControll.pageIndicatorTintColor = [UIColor lightGrayColor];
    _picPageControll.currentPageIndicatorTintColor = [UIColor blackColor];
    
    [_picPageControll addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventValueChanged];
    [headView addSubview:_picPageControll];
    
    UIButton *likeBtn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 4.0, 360, 20, 20)];
    [likeBtn setBackgroundImage:[UIImage imageNamed:@"like_gary"] forState:UIControlStateNormal];
    [likeBtn setBackgroundImage:[UIImage imageNamed:@"like_red"] forState:UIControlStateSelected];
    [headView addSubview:likeBtn];
    
    UIButton *commentBtn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0 - 20, 360, 20, 20)];
    [commentBtn setBackgroundImage:[UIImage imageNamed:@"comment_2"] forState:UIControlStateNormal];
    [headView addSubview:commentBtn];
    
    UIButton *shareBtn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 3 / 4.0 - 40, 360, 20, 20)];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"more_shop"] forState:UIControlStateNormal];
    [headView addSubview:shareBtn];
    
    _dataTabView.tableHeaderView = headView;
    _dataTabView.delegate = self;
    _dataTabView.dataSource = self;
    _dataTabView.sectionHeaderHeight = 30;
    _dataTabView.tableFooterView = [[UIView alloc] init];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 100)
    {
        int index = scrollView.contentOffset.x / scrollView.frame.size.width;
        _picPageControll.currentPage = index;
    }
}

- (void)changeImage:(UIPageControl *)pageControl
{
    [_picCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:pageControl.currentPage inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.currentCommdity.detailImagesArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LLTImagesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
    [cell.showImageView sd_setImageWithURL:[NSURL URLWithString:self.currentCommdity.detailImagesArray[indexPath.row]]];
    return cell;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num = 0;
    if (self.likeArray.count > 0)
    {
        num += 1;
    }
    if (self.commentArray.count > 0)
    {
        num += self.commentArray.count;
    }
    return num;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0 && self.likeArray.count > 0)
    {
        LLTLikeListTableViewCell *cell = [LLTLikeListTableViewCell getCell];
        cell.likeArray = self.likeArray;
        cell.likeLabel.text = [NSString stringWithFormat:@"%ld 人喜爱",self.currentCommdity.likeCount];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

    LLTCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    if (!cell)
    {
        cell = [LLTCommentTableViewCell getCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    LLTCommodity *commodity = self.commentArray[self.likeArray.count > 0?indexPath.row - 1 : indexPath.row];
    cell.currentCommodity = commodity;
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0 && self.likeArray.count > 0)
    {
        return 80;
    }
    LLTCommodity *commodity = self.commentArray[self.likeArray.count > 0?indexPath.row - 1 : indexPath.row];
    return [LLTCommentTableViewCell getHeightWithString:commodity.content] + 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.cornerRadius = 3.0;
        btn.clipsToBounds = YES;
        btn.frame = CGRectMake(0, 0, tableView.bounds.size.width, 30);
        btn.backgroundColor = [UIColor colorWithRed:65 / 255.0 green:176 / 255.0 blue:247 / 255.0 alpha:1];
        NSString *titleStr = [NSString stringWithFormat:@"¥%@ 去购买",self.currentCommdity.price];
        [btn setTitle:titleStr forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont fontWithName:@"Bradley Hand" size:15];
        
        return btn;
    }
    return nil;
}
@end
