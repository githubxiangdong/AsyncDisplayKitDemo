//
//  HotRecommendCell.m
//  AsyncDisplayKitDemo
//
//  Created by 张向东 on 2017/11/9.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import "HotRecommendCell.h"

@implementation HotRecommendCell

#pragma mark:- 懒加载控件
- (ASNetworkImageNode *)goodsImageNode {
    
    if (!_goodsImageNode) {
        _goodsImageNode = [[ASNetworkImageNode alloc]init];
        _goodsImageNode.style.preferredSize = CGSizeMake(100, 200);
    }
    return _goodsImageNode;
}


- (instancetype)initWith{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSuperView];
        [self updateHomePageCellNodeWith];
    }
    return self;
}


/**
 刷新数据
 */
- (void)updateHomePageCellNodeWith {
    
    self.goodsImageNode.defaultImage = [UIImage imageNamed:@"adimage_01"];
}


- (void)addSuperView {
    
    [self addSubnode:self.goodsImageNode];
}


#pragma mark - layoutSpecThatFits 布局
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASStackLayoutSpec *allContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[self.goodsImageNode]];
    
    // 整体边框约束
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:allContentStack];
}

@end
