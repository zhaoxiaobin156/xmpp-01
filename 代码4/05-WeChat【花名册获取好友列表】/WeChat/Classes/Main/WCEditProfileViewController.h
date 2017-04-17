//
//  WCEditProfileViewController.h
//  WeChat
//
//  Created by apple on 14/12/9.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol WCEditProfileViewControllerDelegate <NSObject>

-(void)editProfileViewControllerDidSave;


@end

@interface WCEditProfileViewController : UITableViewController

@property (nonatomic, strong) UITableViewCell *cell;

@property (nonatomic, weak) id<WCEditProfileViewControllerDelegate> delegate;

@end
