//
//  ViewController.h
//  testAnimation
//
//  Created by 张宏伟 on 2018/10/26.
//  Copyright © 2018年 张宏伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRJSuperSignalAnimationView.h"
#import "UIColor+ColorExtension.h"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet JRJSuperSignalAnimationView *zhwView;
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

@end

