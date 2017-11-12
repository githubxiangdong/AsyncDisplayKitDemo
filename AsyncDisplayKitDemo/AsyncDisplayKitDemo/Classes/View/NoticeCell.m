//
//  NoticeCell.m
//  AsyncDisplayKitDemo
//
//  Created by 张向东 on 2017/11/9.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import "NoticeCell.h"

@implementation NoticeCell

#pragma mark:- 懒加载控件
- (ASNetworkImageNode *)goodsImageNode {
    
    if (!_goodsImageNode) {
        _goodsImageNode = [[ASNetworkImageNode alloc]init];
        _goodsImageNode.style.preferredSize = CGSizeMake(100, 100);
    }
    return _goodsImageNode;
}


- (instancetype)initWith{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
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
    self.goodsImageNode.URL = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
}


- (void)addSuperView {
    
    [self addSubnode:self.goodsImageNode];
}


#pragma mark - layoutSpecThatFits 布局
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {

    ASStackLayoutSpec *allContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[self.goodsImageNode]];
    
    // 整体边框约束
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:allContentStack];
}
@end








