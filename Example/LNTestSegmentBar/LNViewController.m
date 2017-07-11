//
//  LNViewController.m
//  LNTestSegmentBar
//
//  Created by nanaLxs on 07/10/2017.
//  Copyright (c) 2017 nanaLxs. All rights reserved.
//

#import "LNViewController.h"
#import "LNSementBarVC.h"
#import "LNSegmentBarConfig.h"

@interface LNViewController ()

@property (nonatomic, weak) LNSementBarVC * segmentBarVC;
@end

@implementation LNViewController
- (LNSementBarVC *)segmentBarVC {
    
    if (!_segmentBarVC) {
        
        LNSementBarVC *vc = [[LNSementBarVC alloc] init];
        
        [self addChildViewController:vc];
        
        _segmentBarVC = vc;
        
    }
    
    return _segmentBarVC;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.segmentBarVC.view.frame = self.view.bounds;
    
    
    [self.view addSubview:self.segmentBarVC.view];
    
    NSArray *items = @[@"专辑", @"声音", @"下载中"];
    
    // 添加几个自控制器
    // 在contentView, 展示子控制器的视图内容
    
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    
    
    [self.segmentBarVC setUpWithItems:items childVCs:@[vc1, vc2, vc3]];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSArray *items = @[@"专辑专辑", @"声xxx音", @"下载中xxxx", @"下载中xxxx", @"下载中xxxx"];
        
        // 添加几个自控制器
        // 在contentView, 展示子控制器的视图内容
        
        UIViewController *vc1 = [UIViewController new];
        vc1.view.backgroundColor = [UIColor redColor];
        
        UIViewController *vc2 = [UIViewController new];
        vc2.view.backgroundColor = [UIColor greenColor];
        
        UIViewController *vc3 = [UIViewController new];
        vc3.view.backgroundColor = [UIColor yellowColor];
        
        UIViewController *vc4 = [UIViewController new];
        vc4.view.backgroundColor = [UIColor greenColor];
        
        UIViewController *vc5 = [UIViewController new];
        vc5.view.backgroundColor = [UIColor yellowColor];
        
        
        [self.segmentBarVC setUpWithItems:items childVCs:@[vc1, vc2, vc3, vc4, vc5]];
        
        
    });
    
////    
    [self.segmentBarVC.segmentBar updateWithConfig:^(LNSegmentBarConfig *config) {
//        
       config.segmentBarBackColor = [UIColor cyanColor];
//        //            config.itemNormalColor = [UIColor brownColor];
//        //            config.itemSelectColor = [UIColor yellowColor];
//        config.itemSC([UIColor brownColor]).itemNC([UIColor yellowColor]);
        config.itemFont = [UIFont fontWithName:@"Zapfino" size:10];
    
        config.indicatorHeight = 5;
       config.indicatorColor = [UIColor blueColor];
        config.indicatorExtraW = 0;
        
    }];
    
    
    
    
};




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
