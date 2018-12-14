//
//  UIViewController+ZHMultiTable.h
//  XueZhiYun
//
//  Created by chun.chen on 2018/9/12.
//  Copyright © 2018年 Zhihan. All rights reserved.
//  UIViewController+属性

#import <UIKit/UIKit.h>
#import "ZHMultiTablePage.h"

@interface UIViewController (ZHMultiTable)

/**< 当前页面关联的tabVC*/
@property (nonatomic, weak) ZHMultiTablePage *tabViewController;
/**< 当前页面的ScrollView*/
@property (nonatomic, weak) UIScrollView *tabContentScrollView;

@end
