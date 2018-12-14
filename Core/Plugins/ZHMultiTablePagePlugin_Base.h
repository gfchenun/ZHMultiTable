//
//  ZHMultiTablePagePlugin_Base.h
//  XueZhiYun
//
//  Created by chun.chen on 2018/9/12.
//  Copyright © 2018年 Zhihan. All rights reserved.
//  MutilTablePage插件

#import <Foundation/Foundation.h>
@class ZHMultiTablePage;
/*
需要在tablePage添加相关插件符合协议即可
 */
@protocol ZHMultiTablePagePlugin <NSObject>

/**
 纵向滑动距离

 @param contentPercentY 距离
 */
- (void)zh_scrollViewVerticalScroll:(CGFloat)contentPercentY;

/**
 横向滑动距离

 @param contentOffsetX 距离
 */
- (void)zh_scrollViewHorizontalScroll:(CGFloat)contentOffsetX;

/**
 即将滑动到上一个位置

 @param index 下标位置
 */
- (void)zh_scrollViewWillScrollFromIndex:(NSInteger)index;

/**
 已经滑动到

 @param index 当前所在的位置下标
 */
- (void)zh_scrollViewDidScrollToIndex:(NSInteger)index;

@end

@interface ZHMultiTablePagePlugin_Base : NSObject<ZHMultiTablePagePlugin>

@property (nonatomic, assign) ZHMultiTablePage  *tabViewController;

// Called only once when enable. Default does nothing
- (void)initPlugin;

// Called when tabViewController load. Default does nothing
- (void)loadPlugin;

// Called before tabViewController reload. Default does nothing
- (void)removePlugin;

@end
