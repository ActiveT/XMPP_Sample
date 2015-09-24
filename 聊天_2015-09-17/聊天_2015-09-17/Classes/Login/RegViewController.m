//
//  RegViewController.m
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import "RegViewController.h"
#import "UIImage+CJ.h"
#import "AppDelegate.h"
#import "UserInfo.h"

@interface RegViewController ()
@property (weak, nonatomic) IBOutlet UITextField *regUser;
@property (weak, nonatomic) IBOutlet UITextField *regPwd;

@end

@implementation RegViewController
- (IBAction)cancleReg:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)regNewUser {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.regOption = YES;
    
    [UserInfo sharedUserInfo].regUser = self.regUser.text;
    [UserInfo sharedUserInfo].regPwd = self.regPwd.text;
    
    __weak typeof(self) selfVc = self;
    [delegate XMPPReg:^(XMPPResultType type) {
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (type) {
                case XMPPResultTypeRegOK:
                    NSLog(@"注册成功");
                    [selfVc dismissViewControllerAnimated:YES completion:nil];
                    if ([selfVc.delegate respondsToSelector:@selector(regUserFinsh)]){
                        [selfVc.delegate regUserFinsh];
                    }
                    break;
                case XMPPResultTypeRegNG:
                    NSLog(@"注册失败");
                    break;
                default:
                    break;
            }
        });
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.regUser.background = [UIImage laImage:@"operationbox_text"];
    self.regPwd.background = [UIImage laImage:@"operationbox_text"];
}

-(void)dealloc{
    NSLog(@"%s", __func__);
}

@end
