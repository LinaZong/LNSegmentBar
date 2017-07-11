//
//  LNSegmentBarConfig.m
//  LNTestSegmentBar
//
//  Created by 宗丽娜 on 17/7/11.
//  Copyright © 2017年 nanaLxs. All rights reserved.
//

#import "LNSegmentBarConfig.h"

@implementation LNSegmentBarConfig
+(instancetype)defaultCofig{
    LNSegmentBarConfig * config = [[LNSegmentBarConfig alloc] init];
    config.segmentBarBackColor = [UIColor clearColor];
    config.itemFont = [UIFont systemFontOfSize:15];
    config.itemNormalColor = [UIColor lightGrayColor];
    config.itemSelectColor = [UIColor redColor];
    
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorExtraW = 10;

    
    return config;

}

-(LNSegmentBarConfig *(^)(UIColor *))itemNC {

    return ^(UIColor * color){
    
        self.itemNormalColor = color;
        return self;
    };
}


-(LNSegmentBarConfig *(^)(UIColor *))itemSC {

    return ^(UIColor * color){

        self.itemSelectColor = color;
        
        return self;
    };

}
@end
