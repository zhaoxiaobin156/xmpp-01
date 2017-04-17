//
//  AppDelegate.h
//  WeChat
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    XMPPResultTypeLoginSuccess,//登录成功
    XMPPResultTypeLoginFailure,//登录失败
    XMPPResultTypeNetErr,//网络不给力
    XMPPResultTypeRegisterSuccess,//注册成功
    XMPPResultTypeRegisterFailure//注册失败
}XMPPResultType;

typedef void (^XMPPResultBlock)(XMPPResultType type);// XMPP请求结果的block


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 *  注册标识 YES 注册 / NO 登录
 */
@property (nonatomic, assign,getter=isRegisterOperation) BOOL  registerOperation;//注册操作

/**
 *  用户注销
 
 */
-(void)xmppUserlogout;
/**
 *  用户登录
 */
-(void)xmppUserLogin:(XMPPResultBlock)resultBlock;


/**
 *  用户注册
 */
-(void)xmppUserRegister:(XMPPResultBlock)resultBlock;
@end

