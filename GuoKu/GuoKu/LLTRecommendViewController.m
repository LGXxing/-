//
//  LLTRecommendViewController.m
//  GuoKu
//
//  Created by mac on 15-10-26.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTRecommendViewController.h"

@implementation LLTRecommendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
//    self.navigationController.navigationBarHidden = YES;
}

- (void)initUI
{
    UIView *navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.navigationController.navigationBar.frame.size.height)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 4.0 - 25 , 10, 50, 24);
    [leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [leftBtn setTitle:@"商品" forState:UIControlStateNormal];
    leftBtn.tag = 1;
    [leftBtn addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [navBarView addSubview:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 3 / 4.0 - 50, 10, 50, 24);
    [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [rightBtn setTitle:@"图文" forState:UIControlStateNormal];
    rightBtn.tag = 2;
    [rightBtn addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [navBarView addSubview:rightBtn];
    
    self.navigationItem.titleView = navBarView;
    _signLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 35, 2)];
    _signLabel.backgroundColor = [UIColor redColor];
    _signLabel.center = CGPointMake(leftBtn.center.x, leftBtn.frame.origin.y + leftBtn.frame.size.height + 5);
    [navBarView addSubview:_signLabel];
    [self headBtnClick:leftBtn];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout];
    _collectionView.pagingEnabled = YES;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"LLTREcommendCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"recommend"];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LLTREcommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommend" forIndexPath:indexPath];
    cell.cellType = indexPath.row;
    cell.superViewController = self;
    return cell;
}

- (void)headBtnClick:(UIButton *)sender
{
    UIButton *btn1 = (UIButton *)[self.navigationItem.titleView viewWithTag:1];
    UIButton *btn2 = (UIButton *)[self.navigationItem.titleView viewWithTag:2];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    [UIView animateWithDuration:0.5 animations:^
    {
        _signLabel.center = CGPointMake(sender.center.x, sender.frame.origin.y + sender.frame.size.height + 5);
    }];
    
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:sender.tag - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / self.view.frame.size.width;
    UIButton *btn = (UIButton *)[self.navigationItem.titleView viewWithTag:index + 1];
    [self headBtnClick:btn];
}

@end
