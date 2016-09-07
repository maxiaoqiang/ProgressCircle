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
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapAction:)];
        [self addGestureRecognizer:tap];
        
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
    
    ///底层颜色绘制
    for (NSUInteger i = 0; i < sectionCount; i ++) {
        CGFloat percentA = [self.dataArray[i] floatValue];
        CGFloat result = percentA * (360 - sectionCount * separeteAngle);
        CGFloat outResult = (result * 2 * M_PI)/360;
        CGFloat endAngle = startAngle + outResult;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:outerRadius startAngle:startAngle endAngle: endAngle clockwise:YES];
        [path addArcWithCenter:center radius:innerRadius startAngle:endAngle endAngle:startAngle clockwise:NO];
        [self.secondaryColor set];
        [path fill];

        startAngle += seperate + outResult;
    }
    ///进度颜色绘制
    //计算得出阶段总数
    NSInteger totalP = 0;
    CGFloat sumP = 0.0f;
    for (NSUInteger i = 0; i <sectionCount; i ++) {
        CGFloat percentA = [self.dataArray[i] floatValue];
        totalP += 1;
        sumP += percentA;

        if (sumP >=  self.progress) {
            
            break;
        }

    }
    ///进度颜色绘制
    CGFloat sumPer = 0.0f;
    for (NSUInteger i = 0; i < totalP; i ++) {
        CGFloat percentA = [self.dataArray[i] floatValue];
        if (i == totalP - 1) {
            percentA = self.progress - sumPer;
        }
        sumPer += percentA;

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

-(void)handleTapAction:(UITapGestureRecognizer *)tap{
    
    CGFloat width = self.bounds.size.width;
    
    CGPoint C = [tap locationInView:tap.view];
    CGPoint A = CGPointMake(width * 0.5, 0.0);
    CGPoint B = CGPointMake(width* 0.5, width * 0.5);
    CGFloat a=[self distancepointA:B pointB:C];
    CGFloat b=[self distancepointA:A pointB:C];
    CGFloat c=[self distancepointA:B pointB:A];
    CGFloat corB = (a * a + c * c - b* b) /(2*a*c);
    CGFloat currentCor = acosf(corB);
    
    if (a > (width* 0.5 - _circleWidth) && a < width * 0.5) {
        if (C.x < width * 0.5) {
            //在左侧情况下
            currentCor = 2 * M_PI - currentCor;
        }
    
    }
    
    self.selectedNum(2);
}

///计算两点之间的距离
-(CGFloat)distancepointA:(CGPoint)pointA pointB:(CGPoint)pointB{
    
    CGFloat dis = (pointA.x - pointB.x)*(pointA.x - pointB.x) + (pointA.y - pointB.y)*(pointA.y - pointB.y);
    return sqrtf(dis);
}

@end
