//
//  LLTCommodity.m
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTCommodity.h"

@implementation LLTCommodity

+ (LLTCommodity *)commodityWithDict:(NSDictionary *)dict
{
    LLTCommodity *commodity = [[LLTCommodity alloc] init];

    
    NSDictionary *contentDict = dict[@"content"];
    NSDictionary *noteDict = nil;
    NSDictionary *entityDict = nil;
    if ([contentDict isKindOfClass:[NSDictionary class]])
    {
        noteDict = contentDict[@"note"];
        entityDict = contentDict[@"entity"];
    }
    if (noteDict == nil)
    {
        noteDict = dict;
    }
    
    commodity.userID = noteDict[@"user_id"];
    commodity.creator = [LLTUser userWithDict:noteDict[@"creator"]];
    commodity.content = noteDict[@"content"];
    commodity.commentCount = [noteDict[@"comment_count"] integerValue];
    commodity.sendTime = noteDict[@"post_time"];
    
    if (entityDict == nil)
    {
        entityDict = dict[@"entity"];
    }
    if (entityDict == nil)
    {
        entityDict = dict;
    }
    commodity.postTime = [entityDict[@"created_time"] integerValue];
    id obj = entityDict[@"entity_id"];
    if ([obj isKindOfClass:[NSString class]])
    {
        commodity.entityID = obj;
    }
    else
    {
        commodity.entityID = [obj stringValue];
    }
    commodity.price = entityDict[@"price"];
    commodity.contentImageStr = entityDict[@"chief_image"];
    
    NSMutableArray *array = [NSMutableArray array];
    
    if (entityDict[@"chief_image"] != nil)
    {
        [array addObject:entityDict[@"chief_image"]];
    }
    if (entityDict[@"detail_images"] != nil)
    {
        [array addObjectsFromArray:entityDict[@"detail_images"]];
    }
    commodity.detailImagesArray = array;
    commodity.title = entityDict[@"title"];
    commodity.likeAlready = [entityDict[@"like_already"] boolValue];
    commodity.likeCount = [entityDict[@"like_count"] integerValue];
    commodity.byLinkURLStr = entityDict[@"item_list"][0][@"buy_link"];
    commodity.noteCount = [entityDict[@"note_count"] integerValue];
    return commodity;
}
@end
