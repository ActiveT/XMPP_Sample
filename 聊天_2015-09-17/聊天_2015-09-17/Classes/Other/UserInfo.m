//
//  UserInfo.m
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import "UserInfo.h"

#define UserKey @"UserKey"
#define UserPwd @"UserPwd"
#define UserLoginStatus @"UserLoginStatus"

@implementation UserInfo
singleton_implementation(UserInfo);



-(void)saveToSandBox{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.loginUser forKey:UserKey];
    [defaults setObject:self.loginPwd forKey:UserPwd];
    [defaults setBool:self.loginStatus forKey:UserLoginStatus];
    
    [defaults synchronize];
}

-(void)loadFromSandBox{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.loginUser = [defaults objectForKey:UserKey];
    self.loginPwd = [defaults objectForKey:UserPwd];
    self.loginStatus = [defaults boolForKey:UserLoginStatus];
}
@end
