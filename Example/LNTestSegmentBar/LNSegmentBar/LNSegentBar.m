//
//  LNSegentBar.m
//  LNTestSegmentBar
//
//  Created by 宗丽娜 on 17/7/10.
//  Copyright © 2017年 nanaLxs. All rights reserved.
//

#import "LNSegentBar.h"
#import "UIView+LNSegmentBar.h"

#define kMinMargin 30

@interface LNSegentBar()
{
    UIButton *_lastBtn;
}
@property (nonatomic, weak) UIScrollView *contentView;

@property (nonatomic, strong) NSMutableArray <UIButton *>*itemBtns;
@property (nonatomic, weak) UIView *indicatorView;

@property (nonatomic, strong) LNSegmentBarConfig *config;
@end

@implementation LNSegentBar
-(LNSegmentBarConfig *)config{
    
    if (!_config) {
        
        _config = [LNSegmentBarConfig defaultCofig];
    }
    
    return _config;
    
}

+ (instancetype)segmentBarWithFrame: (CGRect)frame{

    LNSegentBar * segmentBar = [[LNSegentBar alloc] initWithFrame:frame];
    
    // 添加内容承载师徒
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.showsHorizontalScrollIndicator = NO;
    [segmentBar addSubview:scrollView];
    segmentBar.contentView = scrollView;
    
    return segmentBar;

};

- (NSMutableArray<UIButton *> *)itemBtns {
    if (!_itemBtns) {
        _itemBtns = [NSMutableArray array];
    }
    return _itemBtns;
}

-(void)setItems:(NSArray<NSString *> *)items{

    _items = items;
    
    [self.itemBtns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    self.itemBtns = nil;
    
    // 根据所有的选项数据源， 创建Button, 添加到内容视图
    for (NSString *item in items) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = self.itemBtns.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn setTitle:item forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        [self.itemBtns addObject:btn];

    }

    // 手动刷新布局
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (UIView *)indicatorView {
    if (!_indicatorView) {
        CGFloat indicatorH = 2;
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - indicatorH, 0, indicatorH)];
        indicatorView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

-(void)setSelectIndex:(NSInteger)selectIndex{

    
    //判断如果不符合规格 数据过滤
    if (self.itemBtns.count == 0 || selectIndex < 0 || selectIndex > self.itemBtns.count -1) {
        return;
    }

    _selectIndex = selectIndex;
    
    UIButton * btn = self.itemBtns[selectIndex];
    [self btnClick:btn];
}

-(void)btnClick:(UIButton *)btn{

    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:fromIndex:)]) {
        
         [self.delegate segmentBar:self didSelectIndex:btn.tag fromIndex:_lastBtn.tag];
    }

    _selectIndex = btn.tag;
    
    
    _lastBtn.selected = NO;
    btn.selected = YES;
    _lastBtn = btn;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.width = btn.width;
        self.indicatorView.centerX = btn.centerX;
    }];
    
    
    //btn的位置
    CGFloat scrollX = btn.centerX - self.contentView.width * 0.5;
    if (scrollX < 0) {
        scrollX = 0;
    }
    
    if (scrollX > self.contentView.contentSize.width - self.contentView.width) {
        scrollX = self.contentView.contentSize.width - self.contentView.width;
    }
    
    [self.contentView setContentOffset:CGPointMake(scrollX, 0) animated:YES];
    
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    self.contentView.frame = self.bounds;
    
    // 计算margin
    CGFloat totalBtnWidth = 0;
    for (UIButton *btn in self.itemBtns) {
        [btn sizeToFit];
        totalBtnWidth += btn.width;
    }
    
    
    CGFloat caculateMargin = (self.width - totalBtnWidth) / (self.items.count + 1);
    if (caculateMargin < kMinMargin) {
        caculateMargin = kMinMargin;
    }
    

    CGFloat lastX = caculateMargin;
    for (UIButton *btn in self.itemBtns) {
        // w, h
        [btn sizeToFit];
        // y 0
        // x, y,
        btn.y = 0;
        
        btn.x = lastX;
        
        lastX += btn.width + caculateMargin;
        
    }
       self.contentView.contentSize = CGSizeMake(lastX, 0);
};


-(void)updateWithConfig:(void(^)(LNSegmentBarConfig * config))configBlock{
   
    if (configBlock) {
        configBlock(self.config);
    }
    
    self.backgroundColor = self.config.segmentBarBackColor;
    
    for (UIButton * btn in self.itemBtns) {
        
        [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.itemFont;
    }
    
    // 指示器
    self.indicatorView.backgroundColor = self.config.indicatorColor;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];

    
    

}
@end
