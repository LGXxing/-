//
//  LLTREcommendCell.m
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTREcommendCell.h"

@implementation LLTREcommendCell

- (void)awakeFromNib
{
    _productTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 49) style:UITableViewStylePlain];
    _productTableView.delegate = self;
    _productTableView.dataSource = self;
    [self addSubview:_productTableView];
    _productTableView.tableFooterView = [[UIView alloc] init];
    
    [LLTGuoKuEnginee getCommodityWithCount:30 complete:^(NSArray *commodityArray)
     {
         self.commodityArray = commodityArray;
         [_productTableView reloadData];
     }];
    [LLTGuoKuEnginee getTeleTextWithSize:20 complete:^(NSArray *teleTextArray) {
        self.teleTextArray = teleTextArray;
        [_productTableView reloadData];
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.cellType == 0)
    {
        return _commodityArray.count;
    }
    return self.teleTextArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.cellType == 0)
    {
        static NSString *identifier1 = @"smallcell1";
        LLTRecommendSmallTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:identifier1];
        
        if (!cell1)
        {
            cell1 = [LLTRecommendSmallTableViewCell getCell];
            cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        LLTCommodity *commodity = self.commodityArray[indexPath.row];
        
        [cell1.cell1ImageBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:commodity.contentImageStr] forState:UIControlStateNormal];
        
        cell1.cell1ImageBtn.tag = indexPath.row;
        [cell1.cell1ImageBtn addTarget:self action:@selector(imageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        cell1.cell1ContentLabel.text = commodity.content;
        cell1.cell1TimeLabel.text = [LLTGuoKuEnginee getTimeStrWithPostTime:commodity.postTime];
        
        cell1.commentLabel.text = [NSString stringWithFormat:@"%ld",commodity.likeCount];
        
        return cell1;
    }
    else
    {
        static NSString *identifier2 = @"smallcell2";
        LLTRecommendSmall2TableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:identifier2];
        if (!cell2)
        {
            cell2 = [LLTRecommendSmall2TableViewCell getCell];
            
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        LLTTeleText *teleText = self.teleTextArray[indexPath.row];
        [cell2.cell2ImageView sd_setImageWithURL:[NSURL URLWithString:teleText.coverURLStr] placeholderImage:[UIImage imageNamed:@"loading-image"]];
        
        cell2.cell2TitleLabel.text = teleText.title;
        cell2.cell2ContentLabel.text = teleText.content;
        cell2.cell2TimeLabel.text = [LLTGuoKuEnginee getTimeStrWithPostTime:teleText.pubTime];
        
        return cell2;
    }
}

- (void)imageBtnClick:(UIButton *)sender
{
    LLTCommodity *commodity = self.commodityArray[sender.tag];
    
    LLTCommodityDetailViewController *commodityVC = [[LLTCommodityDetailViewController alloc] initWithCommodity:commodity];
    
    commodityVC.hidesBottomBarWhenPushed = YES;
    
    [self.superViewController.navigationController pushViewController:commodityVC animated:YES];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_cellType == 0)
    {
        return 470;
    }
    return 380;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (self.cellType == 0)
    {
        return;
    }
    LLTTeleText *teleText = self.teleTextArray[indexPath.row];
    
    LLTTeleTextDetailViewController *teleTextVC = [[LLTTeleTextDetailViewController alloc] initWithDataURLStr:teleText];
    teleTextVC.hidesBottomBarWhenPushed = YES;
    [self.superViewController.navigationController pushViewController:teleTextVC animated:YES];
}
@end
