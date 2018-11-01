//
//  ZhwPieChart.m
//  testAnimation
//
//  Created by 张宏伟 on 2018/11/1.
//  Copyright © 2018年 张宏伟. All rights reserved.
//

#import "ZhwPieChart.h"
#import "ZhwLayer.h"
#define Hollow_Circle_Radius 0 //中间空心圆半径，默认为0实心
#define KOffsetRadius 10 //偏移距离
#define KMargin 20 //边缘间距
IB_DESIGNABLE
@implementation ZhwPieChart
-(void)drawRect:(CGRect)rect{
//    CGFloat radius = self.radius == 0 ? 100 : self.radius;
    self.percentArr = self.percentArr == nil ? [NSArray arrayWithObjects:@0.2,@0.3,@0.4,@0.1, nil] : self.percentArr;
    self.percentColorArr = self.percentColorArr == nil ? [NSArray arrayWithObjects:[UIColor redColor],[UIColor greenColor],[UIColor orangeColor],[UIColor yellowColor], nil] : self.percentColorArr;
    float startAngle = 0;
    float endAngle = [self.percentArr[0] floatValue];
    float allcircle = (float)M_PI * 2;
    for (int i=0; i<self.percentArr.count; i++) {
        ZhwLayer *layer = [ZhwLayer layer];
        UIColor *scolor =  self.percentColorArr[i];
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2,  self.frame.size.height/2) radius:self.frame.size.width/4 startAngle:startAngle * allcircle endAngle:endAngle * allcircle  clockwise:YES];
        layer.startAngle = startAngle * allcircle;
        layer.endAngle = endAngle * allcircle;
        layer.path = path.CGPath;
        layer.lineWidth = self.frame.size.width/2;
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.strokeColor = scolor.CGColor;
        [self.layer addSublayer:layer];
        if (i < self.percentArr.count - 1) {
            float percent = [self.percentArr[i+1] floatValue];
            startAngle = endAngle;
            endAngle += percent;
        }
    }
    CAShapeLayer *masklayer = [ZhwLayer layer];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2,  self.frame.size.width/2) radius:self.frame.size.width/4 startAngle:0 endAngle:(float)M_PI*2 clockwise:YES];
    //设置边框颜色为不透明，则可以通过边框的绘制来显示整个view
    masklayer.strokeColor = [UIColor greenColor].CGColor;
    masklayer.lineWidth = self.frame.size.width/2;
    //设置填充颜色为透明，可以通过设置半径来设置中心透明范围
    masklayer.fillColor = [UIColor clearColor].CGColor;
    masklayer.path = maskPath.CGPath;
    masklayer.strokeEnd = 0;
    self.layer.mask = masklayer;
    [self strokeWithLayer:masklayer];
}

- (void)strokeWithLayer:(CAShapeLayer *)maskLayer{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 1.f;
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat:1.f];
    //禁止还原
    animation.autoreverses = NO;
    //禁止完成即移除
    animation.removedOnCompletion = NO;
    //让动画保持在最后状态
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [maskLayer addAnimation:animation forKey:@"strokeEnd"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [touches.anyObject locationInView:self];
    [self upDateLayersWithPoint:point];
}

- (void)upDateLayersWithPoint:(CGPoint)point{
    //遍历查找点击的是哪一个layer
    for (ZhwLayer *layer in self.layer.sublayers) {
        
        if (CGPathContainsPoint(layer.path, &CGAffineTransformIdentity, point, 0) && !layer.isSelected) {
            layer.isSelected = YES;
            //原始中心点为（0，0），扇形所在圆心、原始中心点、偏移点三者是在一条直线，通过三角函数即可得到偏移点的对应x，y。
            CGPoint currPos = layer.position;
            double middleAngle = (layer.startAngle + layer.endAngle)/2.0;
            CGPoint newPos = CGPointMake(currPos.x + KOffsetRadius*cos(middleAngle), currPos.y + KOffsetRadius*sin(middleAngle));
            layer.position = newPos;
            
        }else{
            layer.position = CGPointMake(0, 0);
            layer.isSelected = NO;
        }
    }
}

@end
