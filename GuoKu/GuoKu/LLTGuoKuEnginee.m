//
//  LLTGuoKuEnginee.m
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTGuoKuEnginee.h"
#import "AFHTTPRequestOperationManager.h"

@implementation LLTGuoKuEnginee

+ (NSTimeInterval)getTimestamp
{
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    return timestamp;
}

+ (void)getCommodityWithCount:(NSInteger)count complete:(void (^)(NSArray *)) block
{
    NSString *urlStr = @"http://api.guoku.com/mobile/v4/selection/?api_key=0b19c2b93687347e95c6b6f5cc91bb87&count=30&rcat=0&sign=5e071ecdbb948f367d7ba88aac5771e3&timestamp=1446170864.682913";
    
    AFHTTPRequestOperationManager *request = [[AFHTTPRequestOperationManager alloc] init];
    [request GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableArray *commodityArray = [NSMutableArray array];
         for (NSDictionary *dict in responseObject)
         {
             LLTCommodity *commodity = [LLTCommodity commodityWithDict:dict];
             [commodityArray addObject:commodity];
         }
         
         block(commodityArray);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
    }];
}

+ (void)getTeleTextWithSize:(NSInteger)size complete:(void (^)(NSArray *)) block
{
    NSString *urlStr = @"http://api.guoku.com/mobile/v4/articles/?api_key=0b19c2b93687347e95c6b6f5cc91bb87&page=1&sign=990f46094218be3bf848c3ec761c2b9e&size=20&timestamp=1446117378.344964";
    
    AFHTTPRequestOperationManager *request = [[AFHTTPRequestOperationManager alloc] init];
    [request GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableArray *teleTextArray = [NSMutableArray array];
         for (NSDictionary *dict in responseObject)
         {
             LLTTeleText *teleText = [LLTTeleText teleTextWithDict:dict];
             [teleTextArray addObject:teleText];
         }
         
         block(teleTextArray);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
     }];
}

+ (void)getDiscovertWithComplete:(void (^)(NSDictionary *)) block
{
    NSString *urlStr = @"http://api.guoku.com/mobile/v4/discover/?api_key=0b19c2b93687347e95c6b6f5cc91bb87&sign=b6fbc461c473452b1fa344ae6d1af2c2";
    
    AFHTTPRequestOperationManager *request = [[AFHTTPRequestOperationManager alloc] init];
    [request GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableDictionary *discoverDict = [NSMutableDictionary dictionary];
         
         NSArray *unReadArticleArray = responseObject[@"articles"];
         NSMutableArray *articleArray = [NSMutableArray array];
         for (NSDictionary *dict in unReadArticleArray)
         {
             LLTTeleText *teleText = [LLTTeleText teleTextWithDict:dict[@"article"]];
             [articleArray addObject:teleText];
         }
         [discoverDict setObject:articleArray forKey:@"article"];
         
         NSArray *unReadBannerArray = responseObject[@"banner"];
         NSMutableArray *bannerArray = [NSMutableArray array];
         for (NSDictionary *dict in unReadBannerArray)
         {
             LLTBanner *banner = [LLTBanner bannerWithDict:dict];
             [bannerArray addObject:banner];
         }
         [discoverDict setObject:bannerArray forKey:@"banner"];
         
         NSArray *unReadCategoryArray = responseObject[@"categories"];
         NSMutableArray *categoryArray = [NSMutableArray array];
         for (NSDictionary *dict in unReadCategoryArray)
         {
             LLTCategory *category = [LLTCategory categoryWithDict:dict[@"category"]];
             [categoryArray addObject:category];
         }
         [discoverDict setObject:categoryArray forKey:@"category"];
         
         NSArray *unReadEntityArray = responseObject[@"entities"];
         NSMutableArray *entityArray = [NSMutableArray array];
         for (NSDictionary *dict in unReadEntityArray)
         {
             LLTCommodity *commodity = [LLTCommodity commodityWithDict:dict];
             [entityArray addObject:commodity];
         }
         [discoverDict setObject:entityArray forKey:@"entity"];
         
         
         block(discoverDict);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
     }];
}

+ (void)getCommdityWithEntityID:(NSString *)entityID complete:(void (^)(NSArray *)) block
{
    NSString *urlStr = [NSString stringWithFormat:@"http://api.guoku.com/mobile/v4/entity/%@/?api_key=0b19c2b93687347e95c6b6f5cc91bb87&sign=b6fbc461c473452b1fa344ae6d1af2c2",entityID];
    
    AFHTTPRequestOperationManager *request = [[AFHTTPRequestOperationManager alloc] init];
    [request GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSArray *unReadLikeArray = responseObject[@"like_user_list"];
         NSMutableArray *likeArray = [NSMutableArray array];
         
         for (NSDictionary *dict in unReadLikeArray)
         {
             LLTUser *user = [LLTUser userWithDict:dict];
             [likeArray addObject:user];
         }
         
         NSArray *unReadNoteArray = responseObject[@"note_list"];
         NSMutableArray *noteArray = [NSMutableArray array];
         
         for (NSDictionary *dict in unReadNoteArray)
         {
             LLTCommodity *commodity = [LLTCommodity commodityWithDict:dict];
             [noteArray addObject:commodity];
         }
         
        LLTCommodity *commodity = [LLTCommodity commodityWithDict:responseObject[@"entity"]];
         
         NSArray *totalArray = @[likeArray,noteArray,commodity];
         
         block(totalArray);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
     }];
}
// sign值不可用
+ (void)getGuessWithEntityID:(NSString *)entityID complete:(void (^)(NSArray *)) block
{
    NSString *urlStr = [NSString stringWithFormat:@"http://api.guoku.com/mobile/v4/entity/guess/?api_key=0b19c2b93687347e95c6b6f5cc91bb87&cid=36&count=9&eid=%@&sign=af8243901ce4bfb982c13ac10801cd4e",entityID];
    
    AFHTTPRequestOperationManager *request = [[AFHTTPRequestOperationManager alloc] init];
    [request GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableArray *recommendArray = [NSMutableArray array];
         for (NSDictionary *dict in responseObject)
         {
             LLTCommodity *commodity = [LLTCommodity commodityWithDict:dict];
             [recommendArray addObject:commodity];
         }
         
         block(recommendArray);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
     }];
}


+ (void)getEntityWithCategoryID:(NSString *)categoryID complete:(void (^)(NSArray *)) block
{
    NSString *urlStr = [NSString stringWithFormat:@"http://api.guoku.com/mobile/v4/category/%@/selection/?api_key=0b19c2b93687347e95c6b6f5cc91bb87&page=1&sign=2a42c35005f57af37a930629b5e00aa5&sort=time",categoryID];
    
    AFHTTPRequestOperationManager *request = [[AFHTTPRequestOperationManager alloc] init];
    [request GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableArray *entityArray = [NSMutableArray array];
         for (NSDictionary *dict in responseObject)
         {
             LLTCommodity *commodity = [LLTCommodity commodityWithDict:dict];
             [entityArray addObject:commodity];
         }
         
         block(entityArray);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
     }];
}

+ (NSString *)getTimeStrWithPostTime:(NSInteger)postTime
{
    NSInteger time = ceil(([[NSDate date] timeIntervalSince1970] - postTime));
    NSString *timeStr = nil;
    if (time < 60)
    {
        timeStr = [NSString stringWithFormat:@"%ld秒前",time];
    }
    else if (time < 3600)
    {
        timeStr = [NSString stringWithFormat:@"%ld分钟前",(NSInteger)ceil(time / 60)];
    }
    else if (time < 3600 * 24)
    {
        timeStr = [NSString stringWithFormat:@"%ld小时前",(NSInteger)ceil(time / 3600)];
    }
    else if (time < 3600 * 24 * 30)
    {
        timeStr = [NSString stringWithFormat:@"%ld天前",(NSInteger)ceil(time / (3600 * 24))];
    }
    else if (time < 3600 * 24 * 30 * 30)
    {
        timeStr = [NSString stringWithFormat:@"%ld月前",(NSInteger)ceil(time / (3600 * 24 * 30))];
    }
    else if (time < 3600 * 24 * 30 * 30 * 12)
    {
        timeStr = [NSString stringWithFormat:@"%ld年前",(NSInteger)ceil(time / (3600 * 24 * 30 * 12))];
    }
    return timeStr;
}

@end
