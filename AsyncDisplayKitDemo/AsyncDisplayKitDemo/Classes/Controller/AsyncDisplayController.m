//
//  AsyncDisplayController.m
//  AsyncDisplayKitDemo
//
//  Created by 张向东 on 2017/11/9.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import "AsyncDisplayController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "HomeDataViewModel.h"
#import "HomeNodeCellViewModel.h"
#import <MJRefresh/MJRefresh.h>

#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width

@interface AsyncDisplayController ()<ASTableDelegate, ASTableDataSource>

/// @brief 申明tableNode
@property (strong, nonatomic) ASTableNode *tableNode;
@property (strong, nonatomic) NSArray *dataSource;
@property (strong, nonatomic) HomeNodeCellViewModel *nodeCellVM;
@end

@implementation AsyncDisplayController

#pragma mark:- 懒加载控件
- (ASTableNode *)tableNode {
    
    if(!_tableNode) {
        
        _tableNode = [[ASTableNode alloc]initWithStyle:UITableViewStylePlain];
        _tableNode.delegate = self;
        _tableNode.dataSource = self;
        _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableNode;
}
- (HomeNodeCellViewModel *)nodeCellVM {
    
    if (!_nodeCellVM) {
        _nodeCellVM = [[HomeNodeCellViewModel alloc]init];
    }
    return _nodeCellVM;
}


#pragma mark:- 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}


#pragma mark:- 设置UI
- (void)setupUI {
    
    self.tableNode.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubnode:self.tableNode];
    
    self.tableNode.view.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownRefresh)];
}


#pragma mark:- 加载数据
- (void)loadData {
    
    HomeDataViewModel *dataVM = [HomeDataViewModel sharedInstance];
    [dataVM handleData:nil];
    self.dataSource = dataVM.dataSource;
    
    [self.tableNode reloadData];
}


#pragma mark:- 调用数据源协议ASTableDataSource ,ASTableDelegate
- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode {
    
    return self.dataSource.count;
}
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataSource[section][@"numberOfRows"] integerValue];
}
- (ASCellNodeBlock)tableView:(ASTableView *)tableView nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *sectionDic = self.dataSource[indexPath.section];
    NSArray *cellList = sectionDic[@"cellList"];
    NSDictionary *cellDic = cellList[indexPath.row];
    NSString *cellID = cellDic[@"cellID"];
    id data = cellDic[@"cellData"];
    
    return [self.nodeCellVM tableView:tableView nodeBlockForIndentifier:cellID data:data target:self];
}


- (void)pullDownRefresh {
    
    [self.tableNode.view.mj_header endRefreshing];
    [self.tableNode reloadData];
}
@end







