//
//  XQCircleView.m
//  CirleDemo
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/9/6.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "XQCircleView.h"

@implementation XQCircleView


-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSUInteger sectionCount = self.dataArray.count;
    for (NSUInteger i = 0; i < sectionCount; i ++) {
        
    }

    
}


@end
