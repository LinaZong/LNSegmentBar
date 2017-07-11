//
//  LNSegentBar.h
//  LNTestSegmentBar
//
//  Created by 宗丽娜 on 17/7/10.
//  Copyright © 2017年 nanaLxs. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "LNSegmentBarConfig.h"
@class LNSegentBar;

@protocol LNSegmentBarDelegate <NSObject>

- (void)segmentBar: (LNSegentBar *)segmentBar didSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex;


@end

@interface LNSegentBar : UIView

+ (instancetype)segmentBarWithFrame: (CGRect)frame;

@property(nonatomic,strong)NSArray <NSString *>*items;
@property(nonatomic,weak)id <LNSegmentBarDelegate> delegate;
@property (nonatomic, assign) NSInteger selectIndex;

-(void)  updateWithConfig :(void(^)(LNSegmentBarConfig * config)) configBlock;

@end
