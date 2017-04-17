//
//  WCLoginViewController.m
//  WeChat
//
//  Created by apple on 14/12/8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "WCLoginViewController.h"

@interface WCLoginViewController()
@property (weak, nonatomic) IBOutlet UILabel *userLabel;

@end

@implementation WCLoginViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 设置用户名为上次登录的用户名
    
    //从沙盒获取用户名
    NSString *user = [WCUserInfo sharedWCUserInfo].user;
    self.userLabel.text = user;
}


@end
