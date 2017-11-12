//
//  HomeNodeCellViewModel.m
//  AsyncDisplayKitDemo
//
//  Created by 张向东 on 2017/11/9.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import "HomeNodeCellViewModel.h"

@implementation HomeNodeCellViewModel

- (ASCellNodeBlock)tableView:(ASTableView *)tableView nodeBlockForIndentifier:(NSString *)indentifier data:(id)data target:(id)target {

    if ([indentifier isEqualToString:@"noticeCellID"]) { // 快报
        
        return [self noticeTableNode:tableView nodeBlockForRowAtIndexPath:nil];
    }else if ([indentifier isEqualToString:@"tellCellID"]) { // 客服电话
        
        return [self tellTableNode:tableView nodeBlockForRowAtIndexPath:nil];
    }else if ([indentifier isEqualToString:@"loveCellID"]) { // 猜你喜欢
        
        return [self LoveTableNode:tableView nodeBlockForRowAtIndexPath:nil];
    }else if ([indentifier isEqualToString:@"hotCellID"]) { // 热门推荐
        
        return [self HotTableNode:tableView nodeBlockForRowAtIndexPath:nil];
    }else { // 组头
        
        return [self sectionTableNode:tableView nodeBlockForRowAtIndexPath:nil];
    }
}


// 每个组的头cell
- (ASCellNodeBlock)sectionTableNode:(ASTableView *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ASCellNode *(^ASCellNodeBlock)(void) = ^ASCellNode *() {
        
        SectionHeaderCell *cellNode = [[SectionHeaderCell alloc]initWith];
        cellNode.neverShowPlaceholders = YES;
        return cellNode;
    };
    
    return ASCellNodeBlock;
}


// 快报cell
- (ASCellNodeBlock)noticeTableNode:(ASTableView *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ASCellNode *(^ASCellNodeBlock)(void) = ^ASCellNode *() {
        
        NoticeCell *cellNode = [[NoticeCell alloc]initWith];
        cellNode.neverShowPlaceholders = YES;
        return cellNode;
    };
    
    return ASCellNodeBlock;
}


// 客服电话cell
- (ASCellNodeBlock)tellTableNode:(ASTableView *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ASCellNode *(^ASCellNodeBlock)(void) = ^ASCellNode *() {
        
        TellCell *cellNode = [[TellCell alloc]initWith];
        cellNode.neverShowPlaceholders = YES;
        return cellNode;
    };
    
    return ASCellNodeBlock;
}


// 猜你喜欢推荐cell
- (ASCellNodeBlock)LoveTableNode:(ASTableView *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ASCellNode *(^ASCellNodeBlock)(void) = ^ASCellNode *() {
        
        LoveRecommendCell *cellNode = [[LoveRecommendCell alloc]initWith];
        cellNode.neverShowPlaceholders = YES;
        return cellNode;
    };
    
    return ASCellNodeBlock;
}


// 热门推荐cell
- (ASCellNodeBlock)HotTableNode:(ASTableView *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ASCellNode *(^ASCellNodeBlock)(void) = ^ASCellNode *() {
        
        HotRecommendCell *cellNode = [[HotRecommendCell alloc]initWith];
        cellNode.neverShowPlaceholders = YES;
        return cellNode;
    };
    
    return ASCellNodeBlock;
}
@end



















