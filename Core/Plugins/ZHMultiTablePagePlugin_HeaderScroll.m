#import "ZHMultiTablePagePlugin_HeaderScroll.h"
#import "ZHMultiTablePage.h"
#import "UIViewController+ZHMultiTable.h"

@interface ZHMultiTablePagePlugin_HeaderScroll ()

@property (nonatomic, assign) NSInteger index;

@end


@implementation ZHMultiTablePagePlugin_HeaderScroll

#pragma mark - override
- (void)removePlugin {
    [self removePanGestureForIndex:self.tabViewController.curIndex];
}

- (void)loadPlugin {
    [self addPanGestureForIndex:self.tabViewController.curIndex];
    self.index = self.tabViewController.curIndex;
}

- (void)scrollViewWillScrollFromIndex:(NSInteger)index {
    self.index = index;
}

- (void)scrollViewDidScrollToIndex:(NSInteger)index {
    if (self.index == index) {
        return;
    }
    [self removePanGestureForIndex:self.index];
    [self addPanGestureForIndex:index];
    self.index = index;
}

#pragma mark -PanGesture
- (void)addPanGestureForIndex:(NSInteger)index {
    UIViewController *vc = [self.tabViewController viewControllerForIndex:index];
    UIScrollView *tabContentScrollView = vc.tabContentScrollView;
    if (tabContentScrollView) {
        [self.tabViewController.view addGestureRecognizer:tabContentScrollView.panGestureRecognizer];
    }
}

- (void)removePanGestureForIndex:(NSInteger)index {
    UIViewController *vc = [self.tabViewController viewControllerForIndex:index];
    UIScrollView *tabContentScrollView = vc.tabContentScrollView;
    if (tabContentScrollView) {
        [self.tabViewController.view removeGestureRecognizer:tabContentScrollView.panGestureRecognizer];
    }
}
@end
