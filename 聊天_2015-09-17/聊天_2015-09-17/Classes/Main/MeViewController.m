//
//  MeViewController.m
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import "MeViewController.h"
#import "AppDelegate.h"
#import "UserInfo.h"

@interface MeViewController ()

@end

@implementation MeViewController

-(void)viewDidLoad{
   self.title = [UserInfo sharedUserInfo].loginUser;
}

- (IBAction)cancleLogin:(UIBarButtonItem *)sender {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate logout];
}



@end
