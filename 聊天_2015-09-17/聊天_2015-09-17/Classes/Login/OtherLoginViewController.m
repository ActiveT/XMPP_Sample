
//
//  OtherLoginViewController.m
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import "OtherLoginViewController.h"
#import "UIImage+CJ.h"
#import "UserInfo.h"

@interface OtherLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *otherLoginUser;
@property (weak, nonatomic) IBOutlet UITextField *otherLoginPwd;

@end

@implementation OtherLoginViewController
- (IBAction)cancle:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)login{
    [UserInfo sharedUserInfo].loginUser = self.otherLoginUser.text;
    [UserInfo sharedUserInfo].loginPwd = self.otherLoginPwd.text;
    
    [super login];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.otherLoginUser.background = [UIImage laImage:@"operationbox_text"];
    self.otherLoginPwd.background = [UIImage laImage:@"operationbox_text"];
}

-(void)dealloc{
    NSLog(@"%s", __func__);
}

@end
