//
//  ViewController.m
//  testAnimation
//
//  Created by 张宏伟 on 2018/10/26.
//  Copyright © 2018年 张宏伟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.zhwView initJRJSuperSignalUIView:JRJSuperSignalAddStockStyle withDesc:@"asdasdsa"];
    UILongPressGestureRecognizer *longpressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(dealTimeLine:)];
    longpressGesture.minimumPressDuration = 0.f;
    longpressGesture.numberOfTouchesRequired = 1;
    [self.zhwView addGestureRecognizer:longpressGesture];
}


-(void)dealTimeLine:(UILongPressGestureRecognizer *)longGesture{
    if (longGesture.state == UIGestureRecognizerStateBegan || longGesture.state == UIGestureRecognizerStateChanged)
    {//第一次长按获取 或者 长按然后变化坐标点
        
        //获取坐标
        CGPoint point = [longGesture locationInView:_zhwView];
        
        float x = 0.f;
        float y = 0.f;
        //判断临界情况
        if (point.x < 0)
        {
            x = 0.f;
        }else if (point.x > CGRectGetWidth(_zhwView.frame))
        {
            x = CGRectGetWidth(_zhwView.frame);
        }else
        {
            x = point.x;
        }
        if (point.y < 0)
        {
            y = 0.f;
        }else if (point.y > (CGRectGetHeight(_zhwView.frame) - 20.f))
        {
            y = CGRectGetHeight(_zhwView.frame) - 20.f;
        }else
        {
            y = point.y;
        }
        //开始绘制十字叉
        [_zhwView drawTicksWithPoint:CGPointMake(x, y)];
        
    } else
    {//事件取消
        
        //当抬起头后，清理十字叉
        [_zhwView clearTicks];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
