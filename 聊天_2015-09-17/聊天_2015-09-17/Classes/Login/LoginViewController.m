//
//  LoginViewController.m
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import "LoginViewController.h"
#import "UITextField+CJ.h"
#import "UIImage+CJ.h"
#import "UserInfo.h"
#import "SuperNavGationViewController.h"
#import "RegViewController.h"

@interface LoginViewController ()<RegViewControllDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginPwd;


@end

@implementation LoginViewController

- (IBAction)Login {
    [UserInfo sharedUserInfo].loginUser = self.loginUser.text;
    [UserInfo sharedUserInfo].loginPwd = self.loginPwd.text;
    
    [super login];
}


- (void)viewDidLoad {
    NSLog(@"LoginView");
    [super viewDidLoad];
    
    self.loginUser.text = [UserInfo sharedUserInfo].loginUser;
    
    [self.loginPwd setLeftImage:@"Card_Lock"];
    self.loginPwd.background = [UIImage laImage:@"operationbox_text"];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    id dest = segue.destinationViewController;
    if ([dest isKindOfClass:[SuperNavGationViewController class]]) {
        SuperNavGationViewController *nav = dest;
        RegViewController *regView = (RegViewController *)nav.topViewController;
        regView.delegate = self;
    }
}

-(void)regUserFinsh{
    self.loginUser.text = [UserInfo sharedUserInfo].regUser;
}

@end
