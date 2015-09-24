//
//  AppDelegate.h
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/17.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    XMPPResultTypeLoginOK,
    XMPPResultTypeLoginNG,
    XMPPResultTypeRegOK,
    XMPPResultTypeRegNG
}XMPPResultType;

typedef void(^XMPPResultBlock)(XMPPResultType type);

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign, getter=isRegOption) BOOL regOption;


-(void)logout;

-(void)XMPPLogin:(XMPPResultBlock)resultBlock;
-(void)XMPPReg:(XMPPResultBlock)resultBlock;

@end

