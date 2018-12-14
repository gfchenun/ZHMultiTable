//
//  ZHMultiTablePagePlugin_BottomInset.h
//  XueZhiYun
//
//  Created by chun.chen on 2018/9/13.
//  Copyright © 2018年 Zhihan. All rights reserved.
//  tab底部插件

#import "ZHMultiTablePagePlugin_Base.h"

@interface UIScrollView (ZH_TabBottomInset)

@property (nonatomic, assign) CGFloat zh_tabBottomInset;

@end

// 使用header时修复scrollView底部间隔
@interface ZHMultiTablePagePlugin_BottomInset : ZHMultiTablePagePlugin_Base

@end
