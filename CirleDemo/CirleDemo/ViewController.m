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

@property (nonatomic, strong) UILabel *clickLabel;

@property (nonatomic, strong) XQCircleView *circle;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)setup{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    XQCircleView *circle = [[XQCircleView alloc] initWithFrame:CGRectMake(20, 100, width - 40, width - 40)];
    circle.dataArray = @[@0.2,@0.2,@0.1,@0.3,@0.2];
    circle.circleWidth = 40.0f;
    circle.progress = 0.1;
    circle.mainColor = [UIColor greenColor];
    circle.secondaryColor = [UIColor lightGrayColor];
    circle.selectedNum = ^(NSInteger number){
        self.clickLabel.text = [NSString stringWithFormat:@"点击了%ld个分块",number];
    };
    [self.view addSubview:circle];
    self.circle = circle;

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(width * 0.5 -100, 130 +width - 40 , 200, 25)];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    self.clickLabel = label;
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(width * 0.5 - 100, 90 + width + 45 , 200, 10)];
    [slider addTarget:self action:@selector(clickSliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];

}

-(void)clickSliderAction:(UISlider *)sender{
    self.circle.sliderValue = sender.value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
