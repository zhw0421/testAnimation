//
//  ZhwLayer.h
//  testAnimation
//
//  Created by 张宏伟 on 2018/11/1.
//  Copyright © 2018年 张宏伟. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface ZhwLayer : CAShapeLayer
@property (nonatomic,assign)CGFloat startAngle;
@property (nonatomic,assign)CGFloat endAngle;
@property (nonatomic,assign)BOOL    isSelected;

@end
