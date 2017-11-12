//
//  HotRecommendCell.h
//  AsyncDisplayKitDemo
//
//  Created by 张向东 on 2017/11/9.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface HotRecommendCell : ASCellNode

@property (strong, nonatomic) ASNetworkImageNode *goodsImageNode;
- (instancetype)initWith;
@end
