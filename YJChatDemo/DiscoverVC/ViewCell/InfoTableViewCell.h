//
//  InfoTableViewCell.h
//  AutoTableViewCell
//
//  Created by liuyingjie on 2017/8/2.
//  Copyright © 2017年 liuyingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InfoModel;

@interface InfoTableViewCell : UITableViewCell

@property (nonatomic, strong) InfoModel *inModel;

+ (InfoTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
