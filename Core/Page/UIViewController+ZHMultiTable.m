//
//  UIViewController+ZHMultiTable.m
//  XueZhiYun
//
//  Created by chun.chen on 2018/9/12.
//  Copyright © 2018年 Zhihan. All rights reserved.
//

#import "UIViewController+ZHMultiTable.h"
#import <objc/runtime.h>

@implementation UIViewController (ZHMultiTable)
@dynamic tabViewController, tabContentScrollView;

- (ZHMultiTablePage *)tabViewController {
    return objc_getAssociatedObject(self, @selector(tabViewController));
}
- (void)setTabViewController:(ZHMultiTablePage *)tabViewController {
    objc_setAssociatedObject(self, @selector(tabViewController), tabViewController, OBJC_ASSOCIATION_ASSIGN);
}
- (UIScrollView *)tabContentScrollView {
    UIScrollView *scrollView = objc_getAssociatedObject(self, @selector(tabContentScrollView));
    if (scrollView) {
        return scrollView;
    }
    if ([self.view isKindOfClass:[UIScrollView class]]) {
        [self setTabContentScrollView:(UIScrollView *)self.view];
    } else {
        for (UIScrollView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[UIScrollView class]] && CGSizeEqualToSize(subview.frame.size, self.view.frame.size)) {
                [self setTabContentScrollView:subview];
                break;
            }
        }
    }
    return objc_getAssociatedObject(self, @selector(tabContentScrollView));
}

- (void)setTabContentScrollView:(UIScrollView *)tabContentScrollView {
    objc_setAssociatedObject(self, @selector(tabContentScrollView), tabContentScrollView, OBJC_ASSOCIATION_ASSIGN);
}
@end
