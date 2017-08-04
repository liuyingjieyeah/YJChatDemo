//
//  MomentsCellOperationMenu.h
//  YJChatDemo
//
//  Created by liuyingjie on 2017/8/3.
//  Copyright © 2017年 liuyingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MomentsCellOperationMenu : UIView

#warning getter???

@property (nonatomic, assign, getter = isShowing) BOOL show;    //, getter = isShowing

@property (nonatomic, copy) void (^likeButtonClickedOperation)();
@property (nonatomic, copy) void (^commentButtonClickedOperation)();


@end
