//
//  ViewController.m
//  05.聊天室
//
//  Created by apple on 14/12/5.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "ViewController.h"
#import "GCDAsyncSocket.h"

@interface ViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,GCDAsyncSocketDelegate>{
    
    GCDAsyncSocket *_socket;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputViewConstraint;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *chatMsgs;//聊天消息数组

@end

@implementation ViewController

-(NSMutableArray *)chatMsgs{
    if (!_chatMsgs) {
        _chatMsgs = [NSMutableArray array];
    }
    
    return _chatMsgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    
    // 2.收发数据
    // 做一个聊天
    // 1.用户登录
    // 2.收发数据
    
    // 监听键盘
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kbFrmWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}


-(void)kbFrmWillChange:(NSNotification *)noti{
    NSLog(@"%@",noti.userInfo);
    
    // 获取窗口的高度
    
    CGFloat windowH = [UIScreen mainScreen].bounds.size.height;
    
   
    
    // 键盘结束的Frm
    CGRect kbEndFrm = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
     // 获取键盘结束的y值
    CGFloat kbEndY = kbEndFrm.origin.y;
    
    
    self.inputViewConstraint.constant = windowH - kbEndY;
}



- (IBAction)connectToHost:(id)sender {
    // 1.建立连接
    NSString *host = @"127.0.0.1";
    int port = 12345;
    
    // 创建一个Socket对象
    _socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    
    // 连接
    NSError *error = nil;
    [_socket connectToHost:host onPort:port error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
}


#pragma mark -AsyncSocket的代理
#pragma mark 连接主机成功
-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    NSLog(@"连接主机成功");
}

#pragma mark 与主机断开连接
-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err{

    if(err){
        NSLog(@"断开连接 %@",err);
    }
}

- (IBAction)loginBtnClick:(id)sender {
    
    // 登录
    // 发送用户名和密码
    // 在这里做的时候，只发用户名，密码就不用发送
    
    // 如果要登录，发送的数据格式为 "iam:zhangsan";
    // 如果要发送聊天消息，数据格式为 "msg:did you have dinner";
    
    //登录的指令
    NSString *loginStr = @"iam:zhangsan";
    
    //把Str转成NSData
    NSData *data = [loginStr dataUsingEncoding:NSUTF8StringEncoding];

    
    //[_outputStream write:data.bytes maxLength:data.length];
    // 发送登录指令给服务
    [_socket writeData:data withTimeout:-1 tag:101];
}


#pragma mark 数据成功发送到服务器
-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"数据成功发送到服务器");
    //数据发送成功后，自己调用一下读取数据的方法，接着_socket才会调用下面的代理方法
    [_socket readDataWithTimeout:-1 tag:tag];
}

#pragma mark 服务器有数据，会调用这个方法
-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    // 从服务器接收到的数据
    NSString *recStr =  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@ %ld %@",[NSThread currentThread],tag, recStr);
    
    if (tag == 102) {//聊天返回的数据
        // 刷新表格
        [self reloadDataWithText:recStr];
    }
//    }else if(tag == 101 ){//登录返回数据，不应该把数据添加到表格里
//
//
//    }
   
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSString *text = textField.text;
    
    NSLog(@"%@",text);
    // 聊天信息
    NSString *msgStr = [NSString stringWithFormat:@"msg:%@",text];
    
    //把Str转成NSData
    NSData *data = [msgStr dataUsingEncoding:NSUTF8StringEncoding];
    
    // 刷新表格
    [self reloadDataWithText:msgStr];
    
    // 发送数据
    [_socket writeData:data withTimeout:-1 tag:102];
    
    // 发送完数据，清空textField
    textField.text = nil;
    
    return YES;
}

-(void)reloadDataWithText:(NSString *)text{
    [self.chatMsgs addObject:text];
    
    // UI刷新要主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        
        // 数据多，应该往上滚动
        NSIndexPath *lastPath = [NSIndexPath indexPathForRow:self.chatMsgs.count - 1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:lastPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    });
  
}

#pragma mark 表格的数据源

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.chatMsgs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
   
    cell.textLabel.text = self.chatMsgs[indexPath.row];
    
    return cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
@end

