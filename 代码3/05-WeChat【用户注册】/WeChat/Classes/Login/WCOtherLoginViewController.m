//
//  WCOtherLoginViewController.m
//  WeChat
//
//  Created by apple on 14/12/8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "WCOtherLoginViewController.h"
#import "AppDelegate.h"

@interface WCOtherLoginViewController()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightConstraint;
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation WCOtherLoginViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"其它方式登录";
    
    // 判断当前设备的类型 改变左右两边约束的距离
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone){
        self.leftConstraint.constant = 10;
        self.rightConstraint.constant = 10;
    }
    
    // 设置TextFeild的背景
    self.userField.background = [UIImage stretchedImageWithName:@"operationbox_text"];
    self.pwdField.background = [UIImage stretchedImageWithName:@"operationbox_text"];
    
    [self.loginBtn setResizeN_BG:@"fts_green_btn" H_BG:@"fts_green_btn_HL"];
    
    
    
}
- (IBAction)loginBtnClick {
    // 登录
    
    /*
     * 官方的登录实现
     
     * 1.把用户名和密码放在WCUserInfo的单例
     
     
     * 2.调用 AppDelegate的一个login 连接服务并登录
     */
    
    WCUserInfo *userInfo = [WCUserInfo sharedWCUserInfo];
    userInfo.user = self.userField.text;
    userInfo.pwd = self.pwdField.text;
    
    [super login];
}



- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
