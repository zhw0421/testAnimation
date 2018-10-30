//
//  JRJSuperSignalAnimationView.h
//  testAnimation
//
//  Created by 张宏伟 on 2018/10/26.
//  Copyright © 2018年 张宏伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+ColorExtension.h"

 typedef NS_ENUM(NSInteger, JRJSuperSignalAnimationViewStyle) {
     JRJSuperSignalAddStockStyle = 0,
     JRJSuperSignalReduceStockStyle = 1,
     JRJSuperSignalSidelinesStockStyle = 2,
     JRJSuperSignalHoldingStockStyle = 3,
 };
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

@property (nonatomic, strong) IBInspectable UIColor *animationColor;

//文字的字体
@property (nonatomic, strong) IBInspectable NSString *desc;
@property (nonatomic, strong) IBInspectable UIColor *descUIColor;
@property (nonatomic, strong) IBInspectable UIColor *textUIColor;

@property (nonatomic, strong)UILabel *descUILabel;
@property (nonatomic, strong)UILabel *infomationUILabel;
@property (strong,nonatomic) NSArray *lineColor1Array;
@property (strong,nonatomic) NSArray *lineSmoothColorArray;
@property (strong,nonatomic) NSArray *smallCircleFristColorArray;
@property (strong,nonatomic) NSArray *smallCircleFristColor2Array;
@property (strong,nonatomic) NSArray *smallCircleSecondColor1Array;
@property (strong,nonatomic) NSArray *smallCircleSecondColor2Array;
@property (strong,nonatomic) NSArray *fristShadowColorArray;
@property (strong,nonatomic) NSArray *circlebgColor1Array;
@property (strong,nonatomic) NSArray *circleMainColorArray;
@property (strong,nonatomic) NSArray *circleMainColor2Array;
@property (strong,nonatomic) NSArray *animationColorArray;
@property (strong,nonatomic) NSArray *textColorArray;

-(void)initJRJSuperSignalUIView:(JRJSuperSignalAnimationViewStyle)index;
@end
