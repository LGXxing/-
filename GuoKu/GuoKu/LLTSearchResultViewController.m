//
//  LLTSearchResultViewController.m
//  GuoKu
//
//  Created by mac on 15-10-28.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTSearchResultViewController.h"


@implementation LLTSearchResultViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height - 64);

}


#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"Entering:%@",searchController.searchBar.text);
    
    //    [searchController.searchBar setShowsCancelButton:YES animated:YES];
}


@end
