//
//  LNSegmentBarConfig.h
//  LNTestSegmentBar
//
//  Created by 宗丽娜 on 17/7/11.
//  Copyright © 2017年 nanaLxs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNSegmentBarConfig : NSObject

+(instancetype)defaultCofig;
/*北京颜色
 */
@property(nonatomic,strong)UIColor * segmentBarBackColor;
@property (nonatomic, strong) UIColor *itemNormalColor;
@property (nonatomic, strong) UIColor *itemSelectColor;
@property (nonatomic, strong) UIFont *itemFont;
@property (nonatomic, strong) UIColor *indicatorColor;

@property (nonatomic, assign) CGFloat indicatorHeight;

@property (nonatomic, assign) CGFloat indicatorExtraW;

//链式编程的改法
-(LNSegmentBarConfig *(^)(UIColor * color))itemNC;
-(LNSegmentBarConfig *(^)(UIColor *color))itemSC;

@end
