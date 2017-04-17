//
//  AppDelegate.m
//  02.XMPP框架的导入
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "AppDelegate.h"
#import "XMPPFramework.h"
#import "WCNavigationController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 设置导航栏背景
    [WCNavigationController setupNavTheme];
    
    // 从沙里加载用户的数据到单例
    [[WCUserInfo sharedWCUserInfo] loadUserInfoFromSanbox];
    
    // 判断用户的登录状态，YES 直接来到主界面
    if([WCUserInfo sharedWCUserInfo].loginStatus){
        UIStoryboard *storayobard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.window.rootViewController = storayobard.instantiateInitialViewController;
        
        // 自动登录服务
        [[WCXMPPTool sharedWCXMPPTool] xmppUserLogin:nil];
    }
    return YES;
}

@end
