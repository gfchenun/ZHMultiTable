//
//  ZHMultiTablePage.h
//  XueZhiYun
//
//  Created by chun.chen on 2018/9/12.
//  Copyright © 2018年 Zhihan. All rights reserved.
//  多级联动tableVC

#import <UIKit/UIKit.h>

@class ZHMultiTablePage;
@class ZHMultiTablePagePlugin_Base;

#pragma mark -Delagate
@protocol ZHMultiTablePageDelagate <NSObject>

@optional
- (void)tabViewController:(ZHMultiTablePage *)tabViewController scrollViewVerticalScroll:(CGFloat)contentPercentY;

- (void)tabViewController:(ZHMultiTablePage *)tabViewController scrollViewHorizontalScroll:(CGFloat)contentOffsetX;

- (void)tabViewController:(ZHMultiTablePage *)tabViewController scrollViewWillScrollFromIndex:(NSInteger)index;

- (void)tabViewController:(ZHMultiTablePage *)tabViewController scrollViewDidScrollToIndex:(NSInteger)index;

@end

#pragma mark -DataSource
@protocol ZHMultiTablePageDataSource <NSObject>

@required


/**
 需要加载的UIViewController数量

 @param tabViewController tabViewController description
 @return return value description
 */
- (NSInteger)numberOfViewControllerForTabViewController:(ZHMultiTablePage *)tabViewController;

/**
 返回对应的UIViewController

 @param tabViewController tabViewController description
 @param index index description
 @return return value description
 */
- (UIViewController *)tabViewController:(ZHMultiTablePage *)tabViewController viewControllerForIndex:(NSInteger)index;

@optional

/**
 可选|头部view

 @param tabViewController tabViewController description
 @return return value description
 */
- (UIView *)tabHeaderViewForTabViewController:(ZHMultiTablePage *)tabViewController;

/**
 header对应的底部间隔

 @param tabViewController tabViewController description
 @return return value description
 */
- (CGFloat)tabHeaderBottomInsetForTabViewController:(ZHMultiTablePage *)tabViewController;

/**
 外层的scrollView的UIEdgeInsets

 @param tabViewController tabViewController description
 @return return value description
 */
- (UIEdgeInsets)containerInsetsForTabViewController:(ZHMultiTablePage *)tabViewController;

@end


#pragma mark -TablePage
@interface ZHMultiTablePage : UIViewController

/**< 外层scrollView*/
@property (nonatomic, strong, readonly) UIScrollView *scrollView;
/**< 包含的viewController集合*/
@property (nonatomic, strong, readonly) NSArray *viewControllers;
/**< 当前显示的位置*/
@property (nonatomic, assign, readonly) NSInteger curIndex;
/**< tab数据源*/
@property (nonatomic, weak) id<ZHMultiTablePageDataSource> tabDataSource;
/**< 事件*/
@property (nonatomic, weak) id<ZHMultiTablePageDelagate> tabDelegate;

/**< 头部是否执行zoom动画 默认有header是YES*/
@property (nonatomic, assign) BOOL headerZoomIn;

/**< 头部*/
@property (nonatomic, strong) UIView *tabHeaderView;


/**
 滑到到指定位置

 @param index 下标位置
 @param animated 是否执行动画
 */
- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animated;

/**
 返回对应的UIViewController

 @param index 下标位置
 @return UIViewController
 */
- (UIViewController *)viewControllerForIndex:(NSInteger)index;


/**
 刷新
 */
- (void)reloadData;

/**
 激活插件

 @param plugin plugin description
 */
- (void)enablePlugin:(ZHMultiTablePagePlugin_Base *)plugin;

/**
 移除插件

 @param plugin plugin description
 */
- (void)removePlugin:(ZHMultiTablePagePlugin_Base *)plugin;

@end
 
