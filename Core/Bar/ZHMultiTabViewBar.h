//
//  ZHMultiTabViewBar.h
//  XueZhiYun
//
//  Created by chun.chen on 2018/9/12.
//  Copyright © 2018年 Zhihan. All rights reserved.
//  TabViewBar 如需自定义添加ZHMultiTabViewBarProtocol即可

#import <UIKit/UIKit.h>


static const CGFloat ZHTabViewBarDefaultHeight = 44.0f;

#pragma mark -protocol

@protocol ZHMultiTabViewBarProtocol

@required
/**< 刷新tab*/
- (void)zh_reloadTabBar;

@optional

/**
 横向滑动的百分比

 @param percent 百分比
 */
- (void)zh_tabScrollXPercent:(CGFloat)percent;

/**
 横向滑动的距离

 @param contentOffsetX 距离
 */
- (void)zh_tabScrollXOffset:(CGFloat)contentOffsetX;

/**
 滑动到的位置

 @param index 下标位置
 */
- (void)zh_tabDidScrollToIndex:(NSInteger)index;

@end

#pragma mark -delegate
@class ZHMultiTabViewBar;

@protocol ZHMultiTabViewBarDelegate <NSObject>

- (NSInteger)numberOfTabForTabViewBar:(ZHMultiTabViewBar *)tabViewBar;

- (UIButton *)tabViewBar:(ZHMultiTabViewBar *)tabViewBar buttonForIndex:(NSInteger)index;

@optional

- (void)tabViewBar:(ZHMultiTabViewBar *)tabViewBar didSelectIndex:(NSInteger)index;

@end


@interface ZHMultiTabViewBar : UIView<ZHMultiTabViewBarProtocol>

@property (nonatomic, weak) id<ZHMultiTabViewBarDelegate> delegate;


@end
