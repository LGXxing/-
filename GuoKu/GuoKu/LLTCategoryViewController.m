//
//  LLTCategoryViewController.m
//  GuoKu
//
//  Created by mac on 15-10-30.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTCategoryViewController.h"


@implementation LLTCategoryViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (instancetype)initWithCategory:(LLTCategory *)category
{
    self = [super init];
    if (self)
    {
        _category = category;
        [LLTGuoKuEnginee getEntityWithCategoryID:category.categoryID complete:^(NSArray *array) {
            self.entityArray = array;
            [_dataTabView reloadData];
            [self initData];
        }];
        [self initUI];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)initUI
{
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
    _dataTabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:_dataTabView];
    _dataTabView.showsVerticalScrollIndicator = NO;
    _dataTabView.rowHeight = 106;
    _dataTabView.delegate = self;
    _dataTabView.dataSource = self;
    _dataTabView.tableFooterView = [[UIView alloc] init];
}
- (void)initData
{
    self.title = self.category.title;
}
- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entityArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LLTCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [LLTCategoryTableViewCell getCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    LLTCommodity *commodity = self.entityArray[indexPath.row];
    cell.commodity = commodity;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LLTCommodity *commodity = self.entityArray[indexPath.row];
    LLTCommodityDetailViewController *deatilVC = [[LLTCommodityDetailViewController alloc] initWithCommodity:commodity];
    deatilVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:deatilVC animated:YES];
}
@end
