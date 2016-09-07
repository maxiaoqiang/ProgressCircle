//
//  XQCircleView.m
//  CirleDemo
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/9/6.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "XQCircleView.h"
#define separeteAngle 2

@interface XQCircleView ()


@end

@implementation XQCircleView


-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSUInteger sectionCount = self.dataArray.count;
    
    CGFloat wh = rect.size.width * 0.5;
    CGPoint center = CGPointMake(wh, wh);
    CGFloat innerRadius = wh - _circleWidth;
    CGFloat outerRadius = wh;
    ///每一度间隔所占度数
    CGFloat seperate = (separeteAngle * 2 * M_PI) / 360;
    CGFloat startAngle = -M_PI_2 + seperate * 0.5;
    
    for (NSUInteger i = 0; i < sectionCount; i ++) {
        CGFloat percentA = [self.dataArray[i] floatValue];
        CGFloat result = percentA * (360 - sectionCount * separeteAngle);
        CGFloat outResult = (result * 2 * M_PI)/360;
        CGFloat endAngle = startAngle + outResult;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:outerRadius startAngle:startAngle endAngle: endAngle clockwise:YES];
        [path addArcWithCenter:center radius:innerRadius startAngle:endAngle endAngle:startAngle clockwise:NO];
        [self.mainColor set];
        [path fill];

        startAngle += seperate + outResult;

    }

    
}


@end
