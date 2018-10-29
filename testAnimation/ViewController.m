//
//  ViewController.m
//  testAnimation
//
//  Created by 张宏伟 on 2018/10/26.
//  Copyright © 2018年 张宏伟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
////横竖线的颜色
//@property (nonatomic, strong) IBInspectable UIColor *lineColor1;
////曲线的颜色
//@property (nonatomic, strong) IBInspectable UIColor *lineSmoothColor;
////实心小圆点的渐变色
//@property (nonatomic, strong) IBInspectable UIColor *smallCircleFristColor;
//@property (nonatomic, strong) IBInspectable UIColor *smallCircleFristColor2;
////第二个圈的颜色
//@property (nonatomic, strong) IBInspectable UIColor *smallCircleSecondColor1;
////最大的圆圈的颜色
//@property (nonatomic, strong) IBInspectable UIColor *smallCircleSecondColor2;
////文字外边圈的阴影颜色
//@property (nonatomic, strong) IBInspectable UIColor *fristShadowColor;
////重叠的两个圈下边的背景颜色
//@property (nonatomic, strong) IBInspectable UIColor *circlebgColor;
////重叠的两个圈上边圈的2个颜色
//@property (nonatomic, strong) IBInspectable UIColor *circleMainColor;
//@property (nonatomic, strong) IBInspectable UIColor *circleMainColor2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initColorArray];
//    [self initJRJSuperSignalUIView:0];
//    [self initJRJSuperSignalUIView:1];
    [self initJRJSuperSignalUIView:2];
//    [self initJRJSuperSignalUIView:3];

}

-(void)initColorArray{
    //加仓 减仓 观望 持仓 解锁权限
    self.lineSmoothColorArray = @[[UIColor colorWithHEX:0xFAECEC],[UIColor colorWithHEX:0xE6FDF6],[UIColor colorWithHEX:0xEAF6FD],[UIColor colorWithHEX:0xFDF7EA]];
//    self.lineColor1Array = @[[UIColor colorWithHEX:0xFC6851],[UIColor colorWithHEX:0xF2FFF9],[UIColor colorWithHEX:0xF2FFF9],[UIColor colorWithHEX:0xFFFAF2]];
    self.lineColor1Array = self.lineSmoothColorArray;
    self.smallCircleFristColorArray = @[[UIColor colorWithHEX:0xFE6C64],[UIColor colorWithHEX:0x45C999],[UIColor colorWithHEX:0xFCEDD4],[UIColor colorWithHEX:0xFEB948]];
    self.smallCircleFristColor2Array = @[[UIColor colorWithHEX:0xFC6851],[UIColor colorWithHEX:0x00B271],[UIColor colorWithHEX:0x009FE5],[UIColor colorWithHEX:0xFCEDD4]];
    
    self.smallCircleSecondColor1Array = @[[UIColor colorWithHEX:0xFFDCDB],[UIColor colorWithHEX:0xCEFEED],[UIColor colorWithHEX:0xCFF1FF],[UIColor colorWithHEX:0xFDF7EA]];
    self.smallCircleSecondColor2Array = @[[UIColor colorWithHEX:0xFFD2D0],[UIColor colorWithHEX:0x7BF1C6],[UIColor colorWithHEX:0xA6E0F9],[UIColor colorWithHEX:0xFEDDA7]];
    
    self.fristShadowColorArray = @[[UIColor colorWithHEX:0x510000],[UIColor colorWithHEX:0x015F24],[UIColor colorWithHEX:0x062B5E],[UIColor colorWithHEX:0x643A02]];
    self.circlebgColor1Array = @[[UIColor colorWithHEX:0xFBF1F1],[UIColor colorWithHEX:0xEAFEF8],[UIColor colorWithHEX:0xEAF6FE],[UIColor colorWithHEX:0xFDF7E9]];

    self.circleMainColorArray = @[[UIColor colorWithHEX:0xFC6851],[UIColor colorWithHEX:0x14D879],[UIColor colorWithHEX:0x00ACE4],[UIColor colorWithHEX:0xFBBC4A]];
    self.circleMainColor2Array = @[[UIColor colorWithHEX:0xFF3D46],[UIColor colorWithHEX:0x0AAB6B],[UIColor colorWithHEX:0x186DED],[UIColor colorWithHEX:0xFC7C25]];
    self.lineSmoothColorArray = @[[UIColor colorWithHEX:0xFAECEC],[UIColor colorWithHEX:0xE6FDF6],[UIColor colorWithHEX:0xEAF6FD],[UIColor colorWithHEX:0xFDF7EA]];
    self.animationColorArray = @[[UIColor colorWithHEX:0xF9EBEB],[UIColor colorWithHEX:0xE5FDF6],[UIColor colorWithHEX:0xE5F4FD],[UIColor colorWithHEX:0xFDF6E5]];
}

-(void)initJRJSuperSignalUIView:(int)index{
    self.zhwView.backgroundColor = [UIColor whiteColor];
    self.zhwView.descUILabel.textColor = [UIColor blackColor];
    
    self.zhwView.lineColor1 = self.lineColor1Array[index];
    self.zhwView.lineSmoothColor = self.lineSmoothColorArray[index];
    self.zhwView.smallCircleFristColor = self.smallCircleFristColorArray[index];
    self.zhwView.smallCircleFristColor2 = self.smallCircleFristColor2Array[index];
    self.zhwView.smallCircleSecondColor1 = self.smallCircleSecondColor1Array[index];
    self.zhwView.smallCircleSecondColor2 = self.smallCircleSecondColor2Array[index];
    self.zhwView.fristShadowColor = self.fristShadowColorArray[index];
    self.zhwView.circlebgColor = self.circlebgColor1Array[index];
    self.zhwView.circleMainColor = self.circleMainColorArray[index];
    self.zhwView.circleMainColor2 = self.circleMainColor2Array[index];
    self.zhwView.animationColor = self.animationColorArray[index];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
