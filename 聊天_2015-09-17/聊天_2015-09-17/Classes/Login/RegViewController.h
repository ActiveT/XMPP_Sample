//
//  RegViewController.h
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/19.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegViewControllDelegate <NSObject>

-(void)regUserFinsh;

@end

@interface RegViewController : UIViewController

@property (nonatomic, weak) id<RegViewControllDelegate> delegate;

@end
