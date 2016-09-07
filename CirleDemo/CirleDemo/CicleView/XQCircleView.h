//
//  XQCircleView.h
//  CirleDemo
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/9/6.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickSectionNum)(NSInteger number);

@interface XQCircleView : UIView

///圆环各段所占比例
@property (nonatomic, strong) NSArray *dataArray;
///圆环进度百分比
@property (nonatomic, assign) CGFloat progress;
///圆环宽度
@property (nonatomic, assign) CGFloat circleWidth;
///未进行颜色
@property (nonatomic, strong) UIColor *secondaryColor;
///已进行颜色
@property (nonatomic, strong) UIColor *mainColor;

@property (nonatomic, copy)  clickSectionNum selectedNum;


@property (nonatomic, assign) CGFloat sliderValue;



@end
