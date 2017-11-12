//
//  HomeDataViewModel.h
//  AsyncDisplayKitDemo
//
//  Created by 张向东 on 2017/11/9.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDataViewModel : NSObject

@property (strong, nonatomic) NSMutableArray *dataSource;


+ (instancetype)sharedInstance;

/*
 *
 * arr 表示传入的模型数组
 */
- (void)handleData:(NSArray *)arr;
@end
