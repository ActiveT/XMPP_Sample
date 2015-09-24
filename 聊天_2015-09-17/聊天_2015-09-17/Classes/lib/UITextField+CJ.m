//
//  UITextField+CJ.m
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import "UITextField+CJ.h"

@implementation UITextField (CJ)


-(void)setLeftImage:(NSString *)imageName{
    UIImageView *imageView = [[UIImageView alloc] init];
    CGRect bounds = self.bounds;
    bounds.size.width = self.bounds.size.height;
    imageView.bounds = bounds;
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeCenter;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = imageView;
    
}
@end
