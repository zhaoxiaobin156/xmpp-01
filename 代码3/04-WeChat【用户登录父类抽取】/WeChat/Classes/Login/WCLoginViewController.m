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
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation WCLoginViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 设置TextField和Btn的样式
    self.pwdField.background = [UIImage stretchedImageWithName:@"operationbox_text"];
    
  
    [self.pwdField addLeftViewWithImage:@"Card_Lock"];
    
    [self.loginBtn setResizeN_BG:@"fts_green_btn" H_BG:@"fts_green_btn_HL"];
    
    
    // 设置用户名为上次登录的用户名
    
    //从沙盒获取用户名
    NSString *user = [WCUserInfo sharedWCUserInfo].user;
    self.userLabel.text = user;
}


- (IBAction)loginBtnClick:(id)sender {
    
    // 保存数据到单例
    
    WCUserInfo *userInfo = [WCUserInfo sharedWCUserInfo];
    userInfo.user = self.userLabel.text;
    userInfo.pwd = self.pwdField.text;
    
    // 调用父类的登录
    [super login];
    
}


@end
