//
//  LLTUser.h
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLTUser : NSObject

+ (LLTUser *)userWithDict:(NSDictionary *)dict;
@property (nonatomic, assign)BOOL isCensor;
@property (nonatomic, copy)NSString *bio;
@property (nonatomic, copy)NSString *avatarURLStr;
@property (nonatomic, assign)NSInteger userID;
@property (nonatomic, assign)NSInteger followingCount;
@property (nonatomic, assign)BOOL isGender;
@property (nonatomic, assign)NSInteger entityNoteCount;
@property (nonatomic, assign)NSInteger tagCount;
@property (nonatomic, assign)NSInteger likeCount;

@property (nonatomic, copy)NSString *sinaName;
@property (nonatomic, copy)NSString *website;

@property (nonatomic, copy)NSString *location;
@property (nonatomic, copy)NSString *nickName;
@property (nonatomic, copy)NSString *email;

@end
