//
//  WCXMPPTool.h
//  WeChat
//
//  Created by apple on 14/12/9.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "XMPPFramework.h"

typedef enum {
    XMPPResultTypeLoginSuccess,//登录成功
    XMPPResultTypeLoginFailure,//登录失败
    XMPPResultTypeNetErr,//网络不给力
    XMPPResultTypeRegisterSuccess,//注册成功
    XMPPResultTypeRegisterFailure//注册失败
}XMPPResultType;

typedef void (^XMPPResultBlock)(XMPPResultType type);// XMPP请求结果的block

@interface WCXMPPTool : NSObject

singleton_interface(WCXMPPTool);

@property (nonatomic, strong)XMPPStream *xmppStream;
@property (nonatomic, strong)XMPPvCardTempModule *vCard;//电子名片
@property (nonatomic, strong)XMPPRosterCoreDataStorage *rosterStorage;//花名册数据存储
@property (nonatomic, strong)XMPPRoster *roster;//花名册模块

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
