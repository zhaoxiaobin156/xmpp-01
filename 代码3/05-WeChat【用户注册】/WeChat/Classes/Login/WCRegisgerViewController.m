//
//  WCRegisgerViewController.m
//  WeChat
//
//  Created by apple on 14/12/8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "WCRegisgerViewController.h"
#import "AppDelegate.h"

@interface WCRegisgerViewController()

@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightConstraint;

@end

@implementation WCRegisgerViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"注册";
    
    // 判断当前设备的类型 改变左右两边约束的距离
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone){
        self.leftConstraint.constant = 10;
        self.rightConstraint.constant = 10;
    }
    
    // 设置TextFeild的背景
    self.userField.background = [UIImage stretchedImageWithName:@"operationbox_text"];
    self.pwdField.background = [UIImage stretchedImageWithName:@"operationbox_text"];
    
    [self.registerBtn setResizeN_BG:@"fts_green_btn" H_BG:@"fts_green_btn_HL"];
}

- (IBAction)registerBtnClick {
    // 1.把用户注册的数据保存单例
    WCUserInfo *userInfo = [WCUserInfo sharedWCUserInfo];
    userInfo.registerUser = self.userField.text;
    userInfo.registerPwd = self.pwdField.text;
    
    
    // 2.调用AppDelegate的xmppUserRegister

    AppDelegate *app = [UIApplication sharedApplication].delegate;

    app.registerOperation = YES;
    [app xmppUserRegister:^(XMPPResultType type) {
        
    }];
    
    
    
}

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
