//
//  ViewController.m
//  02.XMPP框架的导入
//
//  Created by apple on 14/12/6.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // 做注销
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app logout];
    
}

@end
