//
//  AppDelegate.m
//  聊天_2015-09-17
//
//  Created by ActiveT on 15/9/17.
//  Copyright (c) 2015年 ActiveT. All rights reserved.
//

#import "AppDelegate.h"
#import "XMPPFramework.h"
#import "SuperNavGationViewController.h"
#import "UserInfo.h"
#import "LoginViewController.h"

@interface AppDelegate () <XMPPStreamDelegate>{
    XMPPStream *_xmppStream;
    XMPPResultBlock _resultBlock;
}

-(void)setupXmppStream;
-(void)conectionHost;
-(void)authUser;
-(void)onLine;
-(void)logout;

@end

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
//    [self conectionHost];
    [SuperNavGationViewController setupNav];
    
    NSLog(@"%@", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]);
//    NSLog(@"\n-----------");
//    NSLog(@"%@", [NSSearchPathForDirectoriesInDomains(NSUserDirectory, NSUserDomainMask, YES) lastObject]);
    
    [[UserInfo sharedUserInfo] loadFromSandBox];
    if ([UserInfo sharedUserInfo].loginStatus) {
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.window.rootViewController = board.instantiateInitialViewController;
        
        [self XMPPLogin:nil];
    }

    return YES;
}

-(void)setupXmppStream{
    XMPPStream *xmppStream = [[XMPPStream alloc] init];
    [xmppStream addDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    _xmppStream = xmppStream;
}

-(void)conectionHost{
    if (!_xmppStream) {
        [self setupXmppStream];
    }
    NSString *userName = nil;
    if (self.isRegOption) {
        userName = [UserInfo sharedUserInfo].regUser;
    } else {
        userName = [UserInfo sharedUserInfo].loginUser;
    }

    _xmppStream.myJID = [XMPPJID jidWithUser:userName domain:@"activet.local" resource:@"iphone"];
    _xmppStream.hostName = @"127.0.0.1";
    _xmppStream.hostPort = 5222;
    
    NSError *error = nil;
    if(![_xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error]){
        NSLog(@"%@", error);
    }
}

-(void)authUser{
    NSError *error = nil;
    NSString *pwd = nil;
    pwd = [UserInfo sharedUserInfo].loginPwd;

    if(![_xmppStream authenticateWithPassword:pwd error:&error]){
        NSLog(@"%@", error);
    }
}

-(void)onLine{
    [UserInfo sharedUserInfo].loginStatus = YES;
    
    [[UserInfo sharedUserInfo] saveToSandBox];
    
    XMPPPresence *xp = [XMPPPresence presence];
    [_xmppStream sendElement:xp];
}

-(void)xmppStreamDidConnect:(XMPPStream *)sender{
    NSLog(@"连接主机成功");
    
    if (self.isRegOption) {
        [_xmppStream registerWithPassword:[UserInfo sharedUserInfo].regPwd error:nil];
    } else {
        [self authUser];
    }
    
}

-(void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error{
    NSLog(@"验证失败");
    if (_resultBlock) {
        _resultBlock(XMPPResultTypeLoginNG);
    }
}

-(void)xmppStreamDidAuthenticate:(XMPPStream *)sender{
    NSLog(@"验证成功");
    [self onLine];
    
    if (_resultBlock) {
        _resultBlock(XMPPResultTypeLoginOK);
    }
}

-(void)logout{
    
    
    XMPPPresence *xp = [XMPPPresence presenceWithType:@"unavailable"];
    [_xmppStream sendElement:xp];
    
    [_xmppStream disconnect];
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    
    self.window.rootViewController = board.instantiateInitialViewController;
    
    [UserInfo sharedUserInfo].loginStatus = NO;
    [[UserInfo sharedUserInfo] saveToSandBox];
    
    NSLog(@"退出");
}

-(void)xmppStreamDidRegister:(XMPPStream *)sender{
    NSLog(@"XMPP--Delegate注册成功");
    if (_resultBlock) {
        _resultBlock(XMPPResultTypeRegOK);
    }
}

-(void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error{
    NSLog(@"XMPP--Delegate注册失败 %@", error);
    if (_resultBlock) {
        _resultBlock(XMPPResultTypeRegNG);
    }
}

-(void)XMPPLogin:(XMPPResultBlock)resultBlock{
    _resultBlock = resultBlock;
    [_xmppStream disconnect];
    
    [self conectionHost];
}

-(void)XMPPReg:(XMPPResultBlock)resultBlock{
    _resultBlock = resultBlock;
    [_xmppStream disconnect];
    [self conectionHost];
}

@end
