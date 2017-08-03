//
//  InfoModel.h
//  AutoTableViewCell
//
//  Created by liuyingjie on 2017/8/2.
//  Copyright © 2017年 liuyingjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoModel : NSObject

@property (nonatomic, copy) NSString *iconUrl;

@property (nonatomic, copy) NSString *titleStr;

@property (nonatomic, copy) NSString *contentStr;

@property (nonatomic, copy) NSString *timeStr;

@property (nonatomic, copy) NSString *imgUrl;

-(instancetype)initWithDic:(NSDictionary *)dic andPra:(id)parma;

+(instancetype)modelWithDic:(NSDictionary *)dic andPra:(id)parma;

@end
