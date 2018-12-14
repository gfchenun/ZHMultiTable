#import "ZHMultiTablePagePlugin_BottomInset.h"
#import <objc/runtime.h>

#import "ZHMultiTablePage.h"
#import "UIViewController+ZHMultiTable.h"

@implementation UIScrollView (ZH_TabBottomInset)

- (CGFloat)zh_tabBottomInset {
    return [objc_getAssociatedObject(self, @selector(zh_tabBottomInset)) floatValue];
}
- (void)setZh_tabBottomInset:(CGFloat)zh_tabBottomInset {
        objc_setAssociatedObject(self, @selector(zh_tabBottomInset), @(zh_tabBottomInset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation ZHMultiTablePagePlugin_BottomInset

#pragma mark - override
- (void)removePlugin {
    [self.tabViewController.viewControllers enumerateObjectsUsingBlock:^(UIViewController *viewController, NSUInteger idx, BOOL *stop) {
        UIScrollView *scrollView = viewController.tabContentScrollView;
        [scrollView removeObserver:self forKeyPath:@"contentSize"];
    }];
}

- (void)loadPlugin {
    if (!self.tabViewController.tabHeaderView) {
        return;
    }
    [self.tabViewController.viewControllers enumerateObjectsUsingBlock:^(UIViewController *viewController, NSUInteger idx, BOOL *stop) {
        UIScrollView *scrollView = viewController.tabContentScrollView;
        if (scrollView.zh_tabBottomInset == 0 && scrollView.contentInset.bottom > 0) {
            scrollView.zh_tabBottomInset = scrollView.contentInset.bottom;
        }
        if (scrollView) {
            [self autoFitBottomInset:scrollView];
            [scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
        }
    }];
}

#pragma mark - kvo
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    if (![keyPath isEqualToString:@"contentSize"]) {
        return;
    }
    [self autoFitBottomInset:object];
}

#pragma mark - private
- (void)autoFitBottomInset:(UIScrollView *)scrollView {
    CGFloat barHeight = 0;
    if ([self.tabViewController.tabDataSource respondsToSelector:@selector(tabHeaderBottomInsetForTabViewController:)]) {
        barHeight = [self.tabViewController.tabDataSource tabHeaderBottomInsetForTabViewController:self.tabViewController];
    }
    
    CGFloat minBottom = scrollView.contentSize.height + barHeight - CGRectGetHeight(scrollView.frame);
    if (minBottom >= 0) {
        if (scrollView.contentInset.bottom == scrollView.zh_tabBottomInset) {
            return;
        }
        minBottom = scrollView.zh_tabBottomInset;
    } else {
        minBottom = MAX(-minBottom, scrollView.zh_tabBottomInset);
    }
    
    UIEdgeInsets insets = scrollView.contentInset;
    insets.bottom = minBottom;
    scrollView.contentInset = insets;
}
@end
