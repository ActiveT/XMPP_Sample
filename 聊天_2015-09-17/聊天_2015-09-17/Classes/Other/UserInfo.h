//
//  UserInfo.h
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface UserInfo : NSObject
singleton_interface(UserInfo);

@property (nonatomic, copy) NSString *loginUser;
@property (nonatomic, copy) NSString *loginPwd;
@property (nonatomic, copy) NSString *regUser;
@property (nonatomic, copy) NSString *regPwd;

@property (nonatomic, assign) BOOL loginStatus;

-(void)saveToSandBox;
-(void)loadFromSandBox;
@end
