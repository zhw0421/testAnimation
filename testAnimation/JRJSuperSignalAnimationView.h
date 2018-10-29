//
//  JRJSuperSignalAnimationView.h
//  testAnimation
//
//  Created by 张宏伟 on 2018/10/26.
//  Copyright © 2018年 张宏伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRJSuperSignalAnimationView : UIView
//横竖线的颜色
@property (nonatomic, strong) IBInspectable UIColor *lineColor1;
//曲线的颜色
@property (nonatomic, strong) IBInspectable UIColor *lineSmoothColor;
//实心小圆点的渐变色
@property (nonatomic, strong) IBInspectable UIColor *smallCircleFristColor;
@property (nonatomic, strong) IBInspectable UIColor *smallCircleFristColor2;
//第二个圈的颜色
@property (nonatomic, strong) IBInspectable UIColor *smallCircleSecondColor1;
//最大的圆圈的颜色
@property (nonatomic, strong) IBInspectable UIColor *smallCircleSecondColor2;
//文字外边圈的阴影颜色
@property (nonatomic, strong) IBInspectable UIColor *fristShadowColor;
//重叠的两个圈下边的背景颜色
@property (nonatomic, strong) IBInspectable UIColor *circlebgColor;
//重叠的两个圈上边圈的2个颜色
@property (nonatomic, strong) IBInspectable UIColor *circleMainColor;
@property (nonatomic, strong) IBInspectable UIColor *circleMainColor2;
//文字的字体
@property (nonatomic, strong) IBInspectable NSString *desc;
@property (nonatomic, strong) IBInspectable UIColor *descUIColor;

@property (nonatomic, strong)UILabel *descUILabel;
@end
