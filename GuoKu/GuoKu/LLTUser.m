//
//  LLTUser.m
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTUser.h"

@implementation LLTUser

+ (LLTUser *)userWithDict:(NSDictionary *)dict
{
    LLTUser *user = [[LLTUser alloc] init];
    user.isCensor = [dict[@"is_censor"] boolValue];
    user.bio = dict[@"bio"];
    user.avatarURLStr = dict[@"avatar_small"];
    user.userID = [dict[@"user_id"] integerValue];
    user.followingCount = [dict[@"following_count"] integerValue];
    NSString *genter = dict[@"gender"];
    if ([genter isEqualToString:@"M"])
    {
        user.isGender = YES;
    }
    else
    {
        user.isGender = NO;
    }
    user.sinaName = dict[@"sina_screen_name"];
    user.website = dict[@"website"];
    user.entityNoteCount = [dict[@"entry_note_count"] integerValue];
    user.tagCount = [dict[@"tag_count"] integerValue];
    user.likeCount = [dict[@"like_count"] integerValue];
    user.location = dict[@"location"];
    user.nickName = dict[@"nickname"];
    user.email = dict[@"email"];
    return user;
}
@end
