//
//  SuperNavGationViewController.m
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import "SuperNavGationViewController.h"

@interface SuperNavGationViewController ()

@end

@implementation SuperNavGationViewController

+(void)setupNav{
    UINavigationBar *bar = [UINavigationBar appearance];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"topbarbg_ios7"] forBarMetrics: UIBarMetricsDefault];

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    [bar setTitleTextAttributes:dict];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

@end
