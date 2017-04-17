//
//  WCMeViewController.m
//  WeChat
//
//  Created by apple on 14/12/8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "WCMeViewController.h"
#import "AppDelegate.h"

@interface WCMeViewController()

- (IBAction)logoutBtnClick:(id)sender;

@end

@implementation WCMeViewController

- (IBAction)logoutBtnClick:(id)sender {
    
    //直接调用 appdelegate的注销方法
//    AppDelegate *app = [UIApplication sharedApplication].delegate;
//    
//    [app xmppUserlogout];
    
    [[WCXMPPTool sharedWCXMPPTool] xmppUserlogout];
}
@end
