//
//  ViewController.m
//  CirleDemo
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/9/6.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "ViewController.h"
#import "XQCircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    XQCircleView *circle = [[XQCircleView alloc] initWithFrame:CGRectMake(20, 100, width - 40, width - 40)];
    circle.dataArray = @[@0.3,@0.5,@0.2];
    circle.circleWidth = 20.0f;
    
    [self.view addSubview:circle];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
