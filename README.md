<h1>介绍</h1>

学智多级联动视图

<h1>使用</h1>

1.Podfile 添加

	pod ZHMultiTable
	
2.引入头文件

	#import "ZHMultiTable.h"
    
    
<h1>Example</h1>

```
#import <ZHMultiTable/ZHMultiTable.h>


@interface XZHeaderTableVC ()
<
ZHMultiTablePageDelagate,
ZHMultiTablePageDataSource,
ZHMultiTabViewBarDelegate
>

@property (nonatomic, strong) ZHMultiTablePage *tablePage;

@end

@implementation XZHeaderTableVC
#pragma mark - system
+ (void)load
{
    BCRouterRegist( @"XZHeaderTableVC",  NSStringFromClass([self class]));
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializePageSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ZHMultiTablePageDataSource
- (NSInteger)numberOfViewControllerForTabViewController:(ZHMultiTablePage *)tabViewController {
    return 2;
}

- (UIViewController *)tabViewController:(ZHMultiTablePage *)tabViewController viewControllerForIndex:(NSInteger)index {
    XZTableVC *vc = [[XZTableVC alloc] init];
    vc.index = index;
    return vc;
}

- (UIView *)tabHeaderViewForTabViewController:(ZHMultiTablePage *)tabViewController {
    CGRect rect = CGRectMake(0, 0, 0, floor(300.0f));
    UIView *headerView = [[UIView alloc] initWithFrame:rect];
    headerView.backgroundColor = [UIColor redColor];
    return headerView;
}

- (CGFloat)tabHeaderBottomInsetForTabViewController:(ZHMultiTablePage *)tabViewController {
//    return ZHTabViewBarDefaultHeight + CGRectGetMaxY(self.navigationController.navigationBar.frame);
    return ZHTabViewBarDefaultHeight;
}

- (UIEdgeInsets)containerInsetsForTabViewController:(ZHMultiTablePage *)tabViewController {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark - ZHMultiTablePageDelagate
- (void)tabViewController:(ZHMultiTablePage *)tabViewController scrollViewVerticalScroll:(CGFloat)contentPercentY {
    
}

- (void)tabViewController:(ZHMultiTablePage *)tabViewController scrollViewHorizontalScroll:(CGFloat)contentOffsetX {
    
}

- (void)tabViewController:(ZHMultiTablePage *)tabViewController scrollViewWillScrollFromIndex:(NSInteger)index {
    
}

- (void)tabViewController:(ZHMultiTablePage *)tabViewController scrollViewDidScrollToIndex:(NSInteger)index {
    
}
#pragma mark - ZHMultiTabViewBarDelegate
- (NSInteger)numberOfTabForTabViewBar:(ZHMultiTabViewBar *)tabViewBar {
     return 2;
}

- (UIButton *)tabViewBar:(ZHMultiTabViewBar *)tabViewBar buttonForIndex:(NSInteger)index {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    if (index == 0) {
        [btn setTitle:@"aaaa" forState:UIControlStateNormal];
    }else{
        [btn setTitle:@"bbbbb" forState:UIControlStateNormal];
    }
    return btn;
}
- (void)tabViewBar:(ZHMultiTabViewBar *)tabViewBar didSelectIndex:(NSInteger)index {
    BOOL anim = labs(index - self.tablePage.curIndex) > 1 ? NO: YES;
    [self.tablePage scrollToIndex:index animated:anim];
}
#pragma mark - Page subviews
- (void)initializePageSubviews {
    self.navigationItem.title = @"table";
    
    self.tablePage = [[ZHMultiTablePage alloc] init];
    self.tablePage.tabDelegate = self;
    self.tablePage.tabDataSource = self;
    ZHMultiTabViewBar *tabViewBar = [[ZHMultiTabViewBar alloc] init];
    tabViewBar.delegate = self;
    ZHMultiTablePagePlugin_TabViewBar *tabViewBarPlugin = [[ZHMultiTablePagePlugin_TabViewBar alloc] initWithTabViewBar:tabViewBar delegate:nil];
    [self.tablePage enablePlugin:tabViewBarPlugin];
    [self.tablePage enablePlugin:[[ZHMultiTablePagePlugin_HeaderScroll alloc] init]];
    
    [self addChildViewController:self.tablePage];
    [self.view addSubview:self.tablePage.view];
    [self.tablePage didMoveToParentViewController:self];
    [self.tablePage.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}


@end

```

