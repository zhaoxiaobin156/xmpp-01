//
//  WCUserInfo.h
//  WeChat
//
//  Created by apple on 14/12/8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface WCUserInfo : NSObject

singleton_interface(WCUserInfo);

@property (nonatomic, copy) NSString *user;//用户名
@property (nonatomic, copy) NSString *pwd;//密码

/**
 *  登录的状态 YES 登录过/NO 注销
 */
@property (nonatomic, assign) BOOL  loginStatus;

/**
 *  从沙盒里获取用户数据
 */
-(void)loadUserInfoFromSanbox;

/**
 *  保存用户数据到沙盒
 
 */
-(void)saveUserInfoToSanbox;
@end
