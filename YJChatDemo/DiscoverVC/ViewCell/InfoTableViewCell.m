//
//  InfoTableViewCell.m
//  AutoTableViewCell
//
//  Created by liuyingjie on 2017/8/2.
//  Copyright © 2017年 liuyingjie. All rights reserved.
//

#import "InfoTableViewCell.h"
#import "InfoModel.h"
#import "UIImageView+WebCache.h"
#import "SDAutoLayout.h"

@interface InfoTableViewCell()

@property (nonatomic,strong)UIImageView *iconPic;
@property (nonatomic,strong)UILabel *nameLab;
@property (nonatomic,strong)UILabel *contentLab;
@property (nonatomic,strong)UILabel *timeLab;
@property (nonatomic,strong)UIImageView *imgPic;
@property (nonatomic,strong)UILabel *remarkLab;

@end

@implementation InfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        
        _iconPic = [[UIImageView alloc]init];
        
        _nameLab = [[UILabel alloc]init];
        _nameLab.font = [UIFont systemFontOfSize:14];
        _nameLab.textColor = [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];

        _remarkLab = [[UILabel alloc]init];
        _remarkLab.text = @"备注";
        _remarkLab.textColor = [UIColor whiteColor];
        _remarkLab.font = [UIFont systemFontOfSize:13];
        _remarkLab.backgroundColor = [UIColor lightGrayColor];
        
        _contentLab = [[UILabel alloc]init];
        _contentLab.numberOfLines = 0;
        _contentLab.font = [UIFont systemFontOfSize:15];
        
        _timeLab = [[UILabel alloc]init];
        _timeLab.font = [UIFont systemFontOfSize:13];
        _timeLab.textColor = [UIColor lightGrayColor];

        _imgPic = [[UIImageView alloc]init];
        
        [self.contentView sd_addSubviews:@[_iconPic,_nameLab,_remarkLab,_contentLab,_timeLab,_imgPic]];
        
        [self setUpFrame];
    }
    return self;
}

- (void)setUpFrame{
    
    _iconPic.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .heightIs(40)
    .widthIs(40);
    
    _nameLab.sd_layout
    .leftSpaceToView(_iconPic, 10)
    .topSpaceToView(self.contentView, 10)
    .heightIs(15);
    
    _remarkLab.sd_layout
    .leftSpaceToView(_nameLab, 5)
    .centerYEqualToView(_nameLab)
    .heightIs(15);
    
    _contentLab.sd_layout
    .leftEqualToView(_nameLab)
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(_nameLab, 10)
    .autoHeightRatio(0);    //多行内容高度自适应
    
    //高度在获取到网络图片后计算
    _imgPic.sd_layout
    .leftEqualToView(_nameLab)
    .topSpaceToView(_contentLab, 5)
    .widthRatioToView(_contentLab, 0.7);    //width为内容的0.7
    
    //设置单行文本label宽度自适应
    [_remarkLab setSingleLineAutoResizeWithMaxWidth:100];
    [_nameLab setSingleLineAutoResizeWithMaxWidth:200];
    
    _iconPic.sd_cornerRadiusFromWidthRatio = @(0.5);    //宽度圆角半径倍数
}


-(void)setInModel:(InfoModel *)inModel{
    _inModel = inModel;
    
    _iconPic.image = [UIImage imageNamed:_inModel.iconUrl];
    _nameLab.text = _inModel.titleStr;
    _contentLab.text = _inModel.contentStr;
    _timeLab.text = _inModel.timeStr;
//    [_imgPic sd_setImageWithURL:[NSURL URLWithString:_inModel.imgUrl]];
    
    UIImage *urlIMG = [UIImage imageNamed:_inModel.imgUrl];
    _imgPic.image = urlIMG;
    if (urlIMG.size.width > 0) {
        CGFloat scale = urlIMG.size.height/urlIMG.size.width;
        _imgPic.sd_layout.autoHeightRatio(scale);
        _imgPic.image = urlIMG;
    }else{
        _imgPic.sd_layout.autoHeightRatio(0);
    }
    
    _timeLab.sd_layout
    .topSpaceToView(_imgPic, 5)
    .leftEqualToView(_imgPic)
    .widthIs(200.0)
    .heightIs(14);
    
    [self setupAutoHeightWithBottomView:_timeLab bottomMargin:10];
}


+(InfoTableViewCell *)cellWithTableView:(UITableView *)tableView{

    NSString *identifier = @"infoTableViewIdenti";
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[InfoTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    return cell;
}



- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
