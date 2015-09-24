//
//  BaseViewController.m
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "UserInfo.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)login{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.regOption = NO;
    
    __weak typeof(self) selfVc = self;
    [delegate XMPPLogin:^(XMPPResultType type) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (type) {
                case XMPPResultTypeLoginOK:{
                    [selfVc showMain];
                    break;
                }
                case XMPPResultTypeLoginNG:
                    NSLog(@"登录失败");
                    break;
                default:
                    break;
            }
        });
    }];
}

-(void)showMain{
    NSLog(@"OK");
    
    [UserInfo sharedUserInfo].loginStatus = YES;
    [[UserInfo sharedUserInfo] saveToSandBox];
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    self.view.window.rootViewController = board.instantiateInitialViewController;
}

@end
