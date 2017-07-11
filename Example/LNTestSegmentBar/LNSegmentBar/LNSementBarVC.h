//
//  LNSementBarVC.h
//  LNTestSegmentBar
//
//  Created by 宗丽娜 on 17/7/10.
//  Copyright © 2017年 nanaLxs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNSegentBar.h"
@interface LNSementBarVC : UIViewController

@property(nonatomic,weak)LNSegentBar * segmentBar;

- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;

@end
