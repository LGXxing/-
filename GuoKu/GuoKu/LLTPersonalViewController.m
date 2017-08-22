//
//  LLTPersonalViewController.m
//  GuoKu
//
//  Created by mac on 15-10-26.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTPersonalViewController.h"

@implementation LLTPersonalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _cellTitleArray = @[@[@"微信分享",@"微博分享"],@[@"清除缓存",@"意见反馈",@"版本"]];
    [self initUI];
}

- (void)initUI
{
    UITableView *mytableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    [self.view addSubview:mytableView];
    
    mytableView.dataSource = self;
    mytableView.delegate = self;
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSArray *array = _cellTitleArray[indexPath.section];
    cell.textLabel.text = array[indexPath.row];
    if (indexPath.row == 2)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
        label.text = @"4.1.1";
        cell.accessoryView = label;
        
    }
    return cell;
}

@end
