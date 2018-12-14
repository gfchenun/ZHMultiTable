//
//  ZHMultiTablePagePlugin_TabViewBar.h
//  XueZhiYun
//
//  Created by chun.chen on 2018/9/13.
//  Copyright © 2018年 Zhihan. All rights reserved.
//  tabviewBar 插件

#import "ZHMultiTablePagePlugin_Base.h"
#import "ZHMultiTabViewBar.h"

@protocol ZHTabViewBarPluginDelagate <NSObject>

@optional

- (void)tabViewController:(ZHMultiTablePage *)tabViewController tabViewBarDidLoad:(ZHMultiTabViewBar *)tabViewBar;

@end

// 自定义tabViewBar需激活插件。 默认 tabViewBar nil
@interface ZHMultiTablePagePlugin_TabViewBar : ZHMultiTablePagePlugin_Base


/**
 初始化

 @param tabViewBar tab联动bar
 @param delegate 插件Delagat
 @return Plugin
 */
- (instancetype)initWithTabViewBar:(ZHMultiTabViewBar *)tabViewBar delegate:(id<ZHTabViewBarPluginDelagate>)delegate;

@end
