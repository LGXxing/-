//
//  LLTCategory.h
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLTCategory : NSObject

+ (LLTCategory *)categoryWithDict:(NSDictionary *)dict;

@property (nonatomic, copy)NSString *categoryID;
@property (nonatomic, copy)NSString *coverURLStr;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, assign)BOOL   status;
@end
