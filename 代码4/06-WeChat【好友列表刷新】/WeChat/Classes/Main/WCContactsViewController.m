//
//  WCContactsViewController.m
//  WeChat
//
//  Created by apple on 14/12/9.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "WCContactsViewController.h"

@interface WCContactsViewController()<NSFetchedResultsControllerDelegate>{
    NSFetchedResultsController *_resultsContrl;
}

@property (nonatomic, strong) NSArray *friends;

@end

@implementation WCContactsViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 从数据里加载好友列表显示
    [self loadFriends2];
    
}

-(void)loadFriends2{
    //使用CoreData获取数据
    // 1.上下文【关联到数据库XMPPRoster.sqlite】
    NSManagedObjectContext *context = [WCXMPPTool sharedWCXMPPTool].rosterStorage.mainThreadManagedObjectContext;
    
    
    // 2.FetchRequest【查哪张表】
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"XMPPUserCoreDataStorageObject"];
    
    // 3.设置过滤和排序
    // 过滤当前登录用户的好友
    NSString *jid = [WCUserInfo sharedWCUserInfo].jid;
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"streamBareJidStr = %@",jid];
    request.predicate = pre;
    
    //排序
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES];
    request.sortDescriptors = @[sort];
    
    // 4.执行请求获取数据
    _resultsContrl = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    
    _resultsContrl.delegate = self;
    
    NSError *err = nil;
    [_resultsContrl performFetch:&err];
    if (err) {
        WCLog(@"%@",err);
    }
    
}


#pragma mark 当数据的内容发生改变后，会调用 这个方法
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    WCLog(@"数据发生改变");
    //刷新表格
    [self.tableView reloadData];
}

-(void)loadFriends{
    //使用CoreData获取数据
    // 1.上下文【关联到数据库XMPPRoster.sqlite】
    NSManagedObjectContext *context = [WCXMPPTool sharedWCXMPPTool].rosterStorage.mainThreadManagedObjectContext;
    
    
    // 2.FetchRequest【查哪张表】
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"XMPPUserCoreDataStorageObject"];
    
    // 3.设置过滤和排序
    // 过滤当前登录用户的好友
    NSString *jid = [WCUserInfo sharedWCUserInfo].jid;
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"streamBareJidStr = %@",jid];
    request.predicate = pre;
    
    //排序
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES];
    request.sortDescriptors = @[sort];
    
    // 4.执行请求获取数据
    self.friends = [context executeFetchRequest:request error:nil];
    NSLog(@"%@",self.friends);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _resultsContrl.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];


    // 获取对应好友
    //XMPPUserCoreDataStorageObject *friend =self.friends[indexPath.row];
    XMPPUserCoreDataStorageObject *friend = _resultsContrl.fetchedObjects[indexPath.row];
    //    sectionNum
    //    “0”- 在线
    //    “1”- 离开
    //    “2”- 离线
    switch ([friend.sectionNum intValue]) {//好友状态
        case 0:
            cell.detailTextLabel.text = @"在线";
            break;
        case 1:
            cell.detailTextLabel.text = @"离开";
            break;
        case 2:
            cell.detailTextLabel.text = @"离线";
            break;
        default:
            break;
    }
    cell.textLabel.text = friend.jidStr;
    
    return cell;
}

@end
