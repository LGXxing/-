//
//  LLTRecommendViewController.h
//  GuoKu
//
//  Created by mac on 15-10-26.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTREcommendCell.h"

@interface LLTRecommendViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UILabel *_signLabel;
    UICollectionView *_collectionView;
}
@end
