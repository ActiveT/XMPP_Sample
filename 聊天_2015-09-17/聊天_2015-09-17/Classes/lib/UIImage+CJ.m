//
//  UIImage+CJ.m
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import "UIImage+CJ.h"

@implementation UIImage (CJ)

+(UIImage *)laImage:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    NSInteger left = image.size.width * 0.5;
    NSInteger top = image.size.height * 0.5;
    return [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
}
@end
