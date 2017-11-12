//
//  HomeDataViewModel.m
//  AsyncDisplayKitDemo
//
//  Created by 张向东 on 2017/11/9.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import "HomeDataViewModel.h"

@implementation HomeDataViewModel
- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
+ (instancetype)sharedInstance {
    
    static HomeDataViewModel *shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shareClient = [[HomeDataViewModel alloc]init];
    });
    return shareClient;
}


- (void)handleData:(NSArray *)arr {
    
    NSArray *cellIDs = @[@"noticeCellID", @"tellCellID", @"sectionHeaderCellID", @"loveCellID", @"sectionHeaderCellID", @"hotCellID"];
    
    [self.dataSource removeAllObjects];
    // dataSource 里面放了两层数据
    // 第一层：表示有多少的楼层
    // 第二层：表示每个楼层里面有多少元素
    for (int i = 0; i < cellIDs.count; i++) {
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        NSMutableArray *cellList = [NSMutableArray array];
        
        // 1, 按需取出相应的值
        NSDictionary *cellDic = @{@"cellID" : cellIDs[i],
                                  @"cellData" : @"", //数据暂时不加
                                  };
        [cellList addObject:cellDic];
        
        // 2, 每一组的个数
        [dic setObject:@([cellList count]) forKey:@"numberOfRows"];
        
        // 3, 将每一组的数据放入字典
        [dic setObject:cellList forKey:@"cellList"];
        
        // 4, 将转换好的数据放入数据源
        [self.dataSource addObject:dic];
    }
}
@end










