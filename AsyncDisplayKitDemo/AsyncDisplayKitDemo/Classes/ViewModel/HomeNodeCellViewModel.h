//
//  HomeNodeCellViewModel.h
//  AsyncDisplayKitDemo
//
//  Created by 张向东 on 2017/11/9.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "NoticeCell.h"
#import "TellCell.h"
#import "LoveRecommendCell.h"
#import "HotRecommendCell.h"
#import "SectionHeaderCell.h"

@interface HomeNodeCellViewModel : NSObject

- (ASCellNodeBlock)tableView:(ASTableView *)tableView nodeBlockForIndentifier:(NSString *)indentifier data:(id)data target:(id)target;
@end
