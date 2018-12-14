#import "ZHMultiTablePagePlugin_TabViewBar.h"
#import "ZHMultiTablePage.h"

@interface ZHMultiTablePagePlugin_TabViewBar () {
    BOOL _loadFlag;
    NSInteger _tabCount;
    CGFloat _maxIndicatorX;
}
@property (nonatomic, weak) id<ZHTabViewBarPluginDelagate> delegate;

@property (nonatomic, strong) ZHMultiTabViewBar *tabViewBar;

@end

@implementation ZHMultiTablePagePlugin_TabViewBar

#pragma mark - init
- (instancetype)initWithTabViewBar:(ZHMultiTabViewBar *)tabViewBar delegate:(id<ZHTabViewBarPluginDelagate>)delegate {
    if (self = [super init]) {
        self.tabViewBar = tabViewBar;
        self.delegate = delegate;
    }
    return self;
}

#pragma mark - override
- (void)removePlugin {
    [self.tabViewBar removeFromSuperview];
    _loadFlag = NO;
}

- (void)initPlugin {
    if (CGRectGetHeight(self.tabViewBar.frame) == 0) {
        self.tabViewBar.frame = CGRectMake(0, 0, 0, ZHTabViewBarDefaultHeight);
    }
}
- (void)loadPlugin {
    _tabCount = [self.tabViewController.tabDataSource numberOfViewControllerForTabViewController:self.tabViewController];
    _maxIndicatorX = CGRectGetWidth(self.tabViewController.scrollView.frame) * (_tabCount - 1);
    
    [self layoutTabViewBar];
    [self.tabViewBar zh_reloadTabBar];
    
    if ([self.delegate respondsToSelector:@selector(tabViewController:tabViewBarDidLoad:)]) {
        [self.delegate tabViewController:self.tabViewController tabViewBarDidLoad:self.tabViewBar];
    }
}

#pragma mark - layout
- (void)layoutTabViewBar {
    if (_loadFlag) {
        return;
    }
    _loadFlag = YES;
    
    CGFloat tabBarHeight = CGRectGetHeight(self.tabViewBar.frame);
    if (!self.tabViewController.tabHeaderView) {
        self.tabViewBar.frame = CGRectMake(0, 0, CGRectGetWidth(self.tabViewController.scrollView.frame), tabBarHeight);
        self.tabViewController.tabHeaderView = self.tabViewBar;
        return;
    }
    
    CGFloat tabBarFrameMinY = CGRectGetHeight(self.tabViewController.tabHeaderView.frame) - tabBarHeight;
    self.tabViewBar.frame = CGRectMake(0, tabBarFrameMinY, CGRectGetWidth(self.tabViewController.scrollView.frame), tabBarHeight);
    self.tabViewBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.tabViewController.tabHeaderView addSubview:self.tabViewBar];
}

#pragma mark - ZHMultiTablePagePlugin

- (void)zh_scrollViewHorizontalScroll:(CGFloat)contentOffsetX {
    if ([self.tabViewBar respondsToSelector:@selector(zh_tabScrollXOffset:)]) {
        [self.tabViewBar zh_tabScrollXOffset:contentOffsetX];
    }
    CGFloat percent = contentOffsetX / _maxIndicatorX;
    if ([self.tabViewBar respondsToSelector:@selector(zh_tabScrollXPercent:)]) {
        [self.tabViewBar zh_tabScrollXPercent:percent];
    }
}

- (void)zh_scrollViewDidScrollToIndex:(NSInteger)index {
    if ([self.tabViewBar respondsToSelector:@selector(zh_tabDidScrollToIndex:)]) {
        [self.tabViewBar zh_tabDidScrollToIndex:index];
    }
}
@end
