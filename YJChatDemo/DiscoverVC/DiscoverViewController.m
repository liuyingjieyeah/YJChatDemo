//
//  DiscoverViewController.m
//  YJChatDemo
//
//  Created by liuyingjie on 2017/8/2.
//  Copyright © 2017年 liuyingjie. All rights reserved.
//

#import "DiscoverViewController.h"

#import "MJRefresh.h"
#import "InfoModel.h"
#import "InfoTableViewCell.h"
#import "SDAutoLayout.h"
#import "MomentsHeaerView.h"

@interface DiscoverViewController ()

@property (nonatomic,strong)NSArray *dataArray;

@property (nonatomic,strong)NSMutableArray *ModelArray;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configModel];
    
    //添加刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.ModelArray = nil;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    //自动更改透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.tableView.mj_footer endRefreshing];
    }];
    
//    [self.view addSubview:self.tableView];
    
    [self setHeaderView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.edgesForExtendedLayout = UIRectEdgeTop;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)setHeaderView{
    MomentsHeaerView *headerV = [[MomentsHeaerView alloc]initWithFrame:CGRectMake(0, 0, 0, 260)];
    self.tableView.tableHeaderView = headerV;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoTableViewCell *cell = [InfoTableViewCell cellWithTableView:tableView];
    cell.inModel = self.ModelArray[indexPath.row];
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.ModelArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

//设置分区头大小
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
//设置分区脚大小
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
//返回分区脚视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.ModelArray[indexPath.row];
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"inModel" cellClass:[InfoTableViewCell class] contentViewWidth:[self cellContentViewWith]];
}

- (CGFloat)cellContentViewWith{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    self.tableView.frame = CGRectMake(0, 0, size.width, size.height);
    [self.tableView reloadData];
}

- (void)configModel{
    _dataArray = @[
                   @{@"icon":@"icon0.jpg",
                     @"title":@"巫师3",
                     @"content":@"内容要长，要丰富，要讨人喜欢，紫薯布丁！",
                     @"time":@"1分钟前",
                     @"image":@"pic1.jpg"},
                   @{@"icon":@"icon1.jpg",
                     @"title":@"绝地吃鸡",
                     @"content":@"内容要长，要丰富，要讨人喜欢，紫薯布丁紫薯布丁！",
                     @"time":@"2分钟前",
                     @"image":@"pic2.jpg"},
                   @{@"icon":@"icon2.jpg",
                     @"title":@"H1Z1",
                     @"content":@"内容要长，要丰富，要讨人喜欢，紫薯布丁紫薯布丁紫薯布丁！",
                     @"time":@"5分钟前",
                     @"image":@"pic3.jpg"},
                   @{@"icon":@"icon3.jpg",
                     @"title":@"CS_GO全球使命",
                     @"content":@"内容要长，要丰富，要讨人喜欢，紫薯布丁紫薯布丁紫薯布丁紫薯布丁！",
                     @"time":@"8分钟前",
                     @"image":@"pic4.jpg"},
                   @{@"icon":@"icon4.jpg",
                     @"title":@"守望先锋",
                     @"content":@"内容要长，要丰富，要讨人喜欢，紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁！",
                     @"time":@"2017-6-5",
                     @"image":@"pic5.jpg"},
                   @{@"icon":@"icon1.jpg",
                     @"title":@"光荣使命",
                     @"content":@"内容要长，要丰富，要讨人喜欢，紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁！",
                     @"time":@"2017-6-6",
                     @"image":@"pic6.jpg"},
                   @{@"icon":@"icon2.jpg",
                     @"title":@"使命召唤",
                     @"content":@"内容要长，要丰富，要讨人喜欢，紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁！",
                     @"time":@"2017-6-7",
                     @"image":@"pic7.jpg"},
                   @{@"icon":@"icon3.jpg",
                     @"title":@"极品飞车",
                     @"content":@"内容要长，要丰富，要讨人喜欢，紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁紫薯布丁！",
                     @"time":@"2017-6-8",
                     @"image":@"pic8.jpg"},
                   ];
    
}


- (NSMutableArray *)ModelArray{
    
    if (!_ModelArray) {
        _ModelArray = [NSMutableArray array];
        NSMutableArray *mutableArr = [NSMutableArray array];
        for (NSDictionary *dic in _dataArray) {
            InfoModel *model = [InfoModel modelWithDic:dic andPra:nil];
            [mutableArr addObject:model];
        }
        _ModelArray = mutableArr;
        mutableArr = nil;
    }
    return _ModelArray;
}


@end
