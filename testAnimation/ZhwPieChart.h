//
//  ZhwPieChart.h
//  testAnimation
//
//  Created by 张宏伟 on 2018/11/1.
//  Copyright © 2018年 张宏伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhwPieChart : UIView
@property (assign,nonatomic) IBInspectable CGFloat radius;
@property (strong,nonatomic) IBInspectable NSArray<NSNumber*> *percentArr;
@property (strong,nonatomic) IBInspectable NSArray<UIColor*> *percentColorArr;
@end
