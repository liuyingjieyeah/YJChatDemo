//
//  InfoModel.m
//  AutoTableViewCell
//
//  Created by liuyingjie on 2017/8/2.
//  Copyright © 2017年 liuyingjie. All rights reserved.
//

#import "InfoModel.h"

@implementation InfoModel

- (instancetype)initWithDic:(NSDictionary *)dic andPra:(id)parma{
    self = [super init];
    if (self) {
        _titleStr = [dic valueForKey:@"title"];
        _contentStr = [dic valueForKey:@"content"];
        _timeStr = [dic valueForKey:@"time"];
        _imgUrl = [dic valueForKey:@"image"];
        _iconUrl = [dic valueForKey:@"icon"];
    }
    return self;
}


+ (instancetype)modelWithDic:(NSDictionary *)dic andPra:(id)parma{
    return [[self alloc]initWithDic:dic andPra:parma];
}


@end
