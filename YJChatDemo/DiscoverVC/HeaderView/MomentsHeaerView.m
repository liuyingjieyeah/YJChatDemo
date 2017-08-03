//
//  MomentsHeaerView.m
//  AutoTableViewCell
//
//  Created by liuyingjie on 2017/8/3.
//  Copyright © 2017年 liuyingjie. All rights reserved.
//

#import "MomentsHeaerView.h"
#import "SDAutoLayout.h"

@implementation MomentsHeaerView
{
    UIImageView *_backgroundImageView;
    UIImageView *_iconView;
    UILabel *_nameLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _backgroundImageView = [[UIImageView alloc]init];
        _iconView = [[UIImageView alloc]init];
        _nameLabel = [[UILabel alloc]init];
        
        _backgroundImageView.image = [UIImage imageNamed:@"pbg.jpg"];
        
        _iconView.image = [UIImage imageNamed:@"picon.jpg"];
        _iconView.layer.borderWidth = 2.0;
        _iconView.layer.borderColor = [UIColor whiteColor].CGColor;
        
        _nameLabel.text = @"liuyingjie";
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentRight;
        _nameLabel.font = [UIFont systemFontOfSize:15];
        
        [self sd_addSubviews:@[_backgroundImageView,_iconView,_nameLabel]];
        
        [self setFrame];
    }
    return self;
}

- (void)setFrame{
    //top、left、bottom、right
    _backgroundImageView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(-60, 0, 40, 0));
    
    _iconView.sd_layout
    .rightSpaceToView(self, 15)
    .bottomSpaceToView(self, 20)
    .widthIs(70)
    .heightIs(70);
    
    _nameLabel.tag = 1000;
    [_nameLabel setSingleLineAutoResizeWithMaxWidth:200];
    _nameLabel.sd_layout
    .rightSpaceToView(_iconView, 20)
    .bottomSpaceToView(_iconView, -35)
    .heightIs(20);
 
}


@end
