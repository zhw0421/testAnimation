//
//  JRJSuperSignalAnimationView.m
//  testAnimation
//
//  Created by 张宏伟 on 2018/10/26.
//  Copyright © 2018年 张宏伟. All rights reserved.
//

#import "JRJSuperSignalAnimationView.h"
#define POINT(_INDEX_) [(NSValue *)[points objectAtIndex:_INDEX_] CGPointValue]
IB_DESIGNABLE
@implementation JRJSuperSignalAnimationView

-(void)setLineColor1:(UIColor *)lineColor1{
    _lineColor1 = lineColor1;
}

-(void)setSmallCircleFristColor:(UIColor *)smallCircleFristColor{
    _smallCircleFristColor = smallCircleFristColor;
}
-(void)setSmallCircleFristColor2:(UIColor *)smallCircleFristColor2{
    _smallCircleFristColor2 = smallCircleFristColor2;
}
-(void)setSmallCircleSecondColor1:(UIColor *)smallCircleSecondColor1{
    _smallCircleSecondColor1 = smallCircleSecondColor1;
}
-(void)setSmallCircleSecondColor2:(UIColor *)smallCircleSecondColor2{
    _smallCircleSecondColor2 = smallCircleSecondColor2;
}

-(void)setFristShadowColor:(UIColor *)fristShadowColor{
    _fristShadowColor = fristShadowColor;
}
-(void)setCirclebgColor:(UIColor *)circlebgColor{
    _circlebgColor = circlebgColor;
}
-(void)setCircleMainColor:(UIColor *)circleMainColor{
    _circleMainColor = circleMainColor;
}
-(void)setCircleMainColor2:(UIColor *)circleMainColor2{
    _circleMainColor2 = circleMainColor2;
}
-(void)setLineSmoothColor:(UIColor *)lineSmoothColor{
    _lineSmoothColor = lineSmoothColor;
}
-(void)setAnimationColor:(UIColor *)animationColor{
    _animationColor = animationColor;
}
-(void)setTextUIColor:(UIColor *)textUIColor{
    _textUIColor = textUIColor;
}


- (void)drawRect:(CGRect)rect {
    //画竖线
    [self verticalLine];
    //画横线
    [self drawHorizonLine];
    //画点
    //画第一个点
    CGFloat screenWidth = self.frame.size.width;
    CGFloat horizonheight =  (screenWidth - 40 ) / 6;
    
    CGColorRef secondColor = _smallCircleSecondColor1 == nil ? [UIColor blackColor].CGColor:_smallCircleSecondColor1.CGColor;
    CGColorRef bigColor = _smallCircleSecondColor2 == nil ? [UIColor blackColor].CGColor:_smallCircleSecondColor2.CGColor;
    
    
    [self drawCiclePointWithArc:CGPointMake(20 + horizonheight, 90) withRadius:11.5 withColor:bigColor withFillColor:[UIColor clearColor].CGColor];
    [self drawCiclePointWithArc:CGPointMake(20 + horizonheight, 90) withRadius:7.5 withColor:secondColor withFillColor:secondColor];
    [self addCAGradientLayer:CGPointMake(20 + horizonheight, 90) withRadius:4.5];
    //画第二个点
    [self drawCiclePointWithArc:CGPointMake(20 + horizonheight*5.6, 87) withRadius:14.5 withColor:bigColor withFillColor:[UIColor clearColor].CGColor];
    [self drawCiclePointWithArc:CGPointMake(20 + horizonheight*5.6, 87) withRadius:7.5 withColor:bigColor withFillColor:secondColor];
    [self addCAGradientLayer:CGPointMake(20 + horizonheight*5.6, 87) withRadius:3.5 ];
    //画第三个点
    [self drawCiclePointWithArc:CGPointMake(20 + horizonheight*4.5, 57.5) withRadius:5 withColor:secondColor withFillColor:secondColor];
    [self addCAGradientLayer:CGPointMake(20 + horizonheight*4.5, 57.5) withRadius:2.5];
    //画曲线
    [self drawSmoothLine];
    //画中间圆圈
    
    [self drawAnimationCircle:70 withstartAngle:((float)M_PI * 0.78) withendAngle:((float)M_PI * 0.22) withLineWidth:10];
    
    _circlebgColor == nil ? [UIColor blackColor] : _circlebgColor;
    [self drawCenterCirclewithRadius:70  withstartAngle:((float)M_PI * 0.75) withendAngle:((float)M_PI * 0.25) withLineWidth:20 withColor:_circlebgColor];
    _circleMainColor == nil ? [UIColor blackColor] : _circleMainColor;
    NSArray *colors;
    if (_circleMainColor && _circleMainColor2) {
        colors = @[(__bridge id)_circleMainColor.CGColor,(__bridge id)_circleMainColor2.CGColor];
    }else{
        colors = @[(__bridge id)[UIColor blackColor].CGColor,(__bridge id)[UIColor blackColor].CGColor];
    }
    [self drawMainCirclewithRadius:70  withstartAngle:((float)M_PI * 0.75) withendAngle:((float)M_PI * 0.25) withLineWidth:10 withColor:colors];
    //写字 最里边的阴影圈
    [self drawZhwText];
}

-(void)drawZhwText{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:50 startAngle:0 endAngle:((float)M_PI * 2) clockwise:YES];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    self.layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.lineWidth = 1;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.lineCap = @"round";
    layer.lineJoin = @"round";
    if (self.fristShadowColor) {
        layer.shadowColor = self.fristShadowColor.CGColor;
    }else{
        layer.shadowColor = [UIColor colorWithRed:81/255.0 green:0/255.0 blue:0/255.0 alpha:1].CGColor;
    }
    layer.shadowOpacity = 0.1;//阴影透明度,默认为0则看不到阴影
    layer.shadowRadius = 10;
    layer.shadowPath = path.CGPath;
    [self.layer addSublayer:layer];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"信号建议";
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    CGSize size = [label.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,NSFontAttributeName,nil]];
    label.frame = CGRectMake(self.frame.size.width/2 - size.width/2, self.frame.size.height/2 - 25, size.width, size.height);
    [self addSubview:label];
    self.descUILabel = [[UILabel alloc] init];
    NSString *tagStr = self.descArray[self.indexStyle];
    if (tagStr) {
        self.descUILabel.text = tagStr;
    }else{
        self.descUILabel.text = @"加仓";
    }
    self.descUILabel.font = [UIFont boldSystemFontOfSize:28];
    if (self.textUIColor) {
        self.descUILabel.textColor = self.textUIColor;
    }else{
        self.descUILabel.textColor = self.descUIColor;
    }
    CGSize size1 = [self.descUILabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.descUILabel.font,NSFontAttributeName,nil]];
    self.descUILabel.frame = CGRectMake(self.frame.size.width/2 - size1.width/2, self.frame.size.height/2 , size1.width, size1.height);
    [self addSubview:self.descUILabel];
    
    if (self.indexStyle != JRJSuperSignalNoAuthStockStyle) {
        self.infomationUILabel = [[UILabel alloc] init];
        self.infomationUILabel.text = self.desc;
        self.infomationUILabel.font = [UIFont systemFontOfSize:14.0];
        CGSize size2 = [self.infomationUILabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.infomationUILabel.font,NSFontAttributeName,nil]];
        self.infomationUILabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        self.infomationUILabel.frame = CGRectMake(self.frame.size.width/2 - size2.width/2, self.frame.size.height/2 + 70 + 4, size2.width, size2.height);
        [self addSubview:self.infomationUILabel];
    }else{
        self.infomationUILabel = [[UILabel alloc] init];
        self.infomationUILabel.text = @"*日前出现买卖信号！请务必注意风险 解锁查看";
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"signal_arrow"]];
        CGSize size3 = [UIImage imageNamed:@"signal_arrow"].size;
        self.infomationUILabel.font = [UIFont systemFontOfSize:14.0];
        CGSize size2 = [self.infomationUILabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.infomationUILabel.font,NSFontAttributeName,nil]];
        self.infomationUILabel.textColor = [UIColor colorWithHEX:0x333333];
        NSMutableAttributedString *textColor = [[NSMutableAttributedString alloc]initWithString:self.infomationUILabel.text];
        NSRange rangel = [[textColor string] rangeOfString:[self.infomationUILabel.text substringFromIndex:self.infomationUILabel.text.length - 5]];
        [textColor addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHEX:0x2E7CD7] range:rangel];
        [textColor addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0] range:rangel];
        [self.infomationUILabel setAttributedText:textColor];
        self.infomationUILabel.frame = CGRectMake(self.frame.size.width/2 - size2.width/2 - size3.width/2, self.frame.size.height/2 + 70 + 4, size2.width, size2.height);
        imageView.frame = CGRectMake(self.frame.size.width/2 + size2.width/2 +  size3.width/2, self.frame.size.height/2 + 70 + 7, size3.width, size3.height);
        [self addSubview:self.infomationUILabel];
        [self addSubview:imageView];
    }
}


-(void)drawAnimationCircle:(CGFloat)radius withstartAngle:(CGFloat) startAngle
              withendAngle:(CGFloat) endAngle withLineWidth:(CGFloat )lineWidth{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    self.layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.lineWidth = 10;
    layer.lineCap = @"round";
    layer.lineJoin = @"round";
    if (self.animationColor) {
        layer.shadowColor = self.fristShadowColor.CGColor;
        layer.strokeColor = self.animationColor.CGColor;
        layer.fillColor = [UIColor whiteColor].CGColor;
    }else{
        layer.shadowColor = [UIColor blackColor].CGColor;
        layer.strokeColor = [UIColor blackColor].CGColor;
        layer.fillColor = [UIColor whiteColor].CGColor;
    }
    layer.frame = self.bounds;
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.fromValue =[NSNumber numberWithFloat:1.0];
    scale.toValue =[NSNumber numberWithFloat:1.3];
    // 4.将所有的动画添加到动画组中
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //配置起始位置（fromeVaue）和终止位置（toValue）
    opacityAnimation.fromValue = @(1.0);
    opacityAnimation.toValue = @(0.0);
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[scale,opacityAnimation];
    group.duration = 1.3;
    group.repeatDuration = 0.00;
    group.repeatCount = HUGE_VALF;
    group.removedOnCompletion = NO;
    [layer addAnimation:group forKey:nil];
    [self.layer addSublayer:layer];
}

-(void)drawCenterCirclewithRadius:(CGFloat) radius withstartAngle:(CGFloat) startAngle
                     withendAngle:(CGFloat) endAngle withLineWidth:(CGFloat )lineWidth withColor:(UIColor*)color{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.lineWidth = lineWidth;
    layer.strokeColor = color.CGColor;
    layer.lineCap = @"round";
    layer.lineJoin = @"round";
    [self.layer addSublayer:layer];
}

-(void)drawMainCirclewithRadius:(CGFloat) radius withstartAngle:(CGFloat) startAngle
                   withendAngle:(CGFloat) endAngle withLineWidth:(CGFloat )lineWidth withColor:(NSArray*)colors{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = lineWidth;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.lineCap = @"round";
    layer.lineJoin = @"round";
    layer.frame = self.bounds;
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = layer.frame;
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = colors;
    gl.locations = @[@(0.0),@(1.0)];
    gl.mask = layer;
    [self.layer addSublayer:gl];
}

//画曲线
-(void)drawSmoothLine{
    CGFloat screenWidth = self.frame.size.width;
    CGFloat horizonheight =  (screenWidth - 40 ) / 6;
    CGPoint p0 = CGPointMake(0,10 + 35 + (self.frame.size.height - 35 - 80) / 3 * 2);
    CGPoint p1 = CGPointMake(20 + 10,20 + 35 + (self.frame.size.height - 35 - 80) / 3 * 2);
    CGPoint p2 =  CGPointMake(20 + horizonheight, 90);
    CGPoint p3 =  CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    CGPoint p4 = CGPointMake(20 + horizonheight*4.5-20, 57.5);
    CGPoint p5 = CGPointMake(20 + horizonheight*5.6, 87);
    CGPoint p6 = CGPointMake(screenWidth, self.frame.size.height/2);
    NSArray *arr = @[[NSValue valueWithCGPoint:p0],
                     [NSValue valueWithCGPoint:p1],
                     [NSValue valueWithCGPoint:p2],
                     [NSValue valueWithCGPoint:p3],
                     [NSValue valueWithCGPoint:p4]
                     ,[NSValue valueWithCGPoint:p5]
                     ,[NSValue valueWithCGPoint:p6]];
    [self smoothedPathWithPoints:arr andGranularity:5];
}
- (void)smoothedPathWithPoints:(NSArray *) pointsArray andGranularity:(NSInteger)granularity {
    
    NSMutableArray *points = [pointsArray mutableCopy];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, YES);
    CGContextSetStrokeColorWithColor(context, _lineSmoothColor == nil ? [UIColor grayColor].CGColor : _lineSmoothColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
    UIBezierPath *smoothedPath = [UIBezierPath bezierPath];
    [points insertObject:[points objectAtIndex:0] atIndex:0];
    [points addObject:[points lastObject]];
    [smoothedPath moveToPoint:POINT(0)];
    for (NSUInteger index = 1; index < points.count - 2; index++) {
        CGPoint p0 = POINT(index - 1);
        CGPoint p1 = POINT(index);
        CGPoint p2 = POINT(index + 1);
        CGPoint p3 = POINT(index + 2);
        for (int i = 1; i < granularity; i++) {
            float t = (float) i * (1.0f / (float) granularity);
            float tt = t * t;
            float ttt = tt * t;
            
            CGPoint pi; // intermediate point
            pi.x = 0.5 * (2*p1.x+(p2.x-p0.x)*t + (2*p0.x-5*p1.x+4*p2.x-p3.x)*tt + (3*p1.x-p0.x-3*p2.x+p3.x)*ttt);
            pi.y = 0.5 * (2*p1.y+(p2.y-p0.y)*t + (2*p0.y-5*p1.y+4*p2.y-p3.y)*tt + (3*p1.y-p0.y-3*p2.y+p3.y)*ttt);
            [smoothedPath addLineToPoint:pi];
        }
        
        // Now add p2
        [smoothedPath addLineToPoint:p2];
    }
    
    // finish by adding the last point
    [smoothedPath addLineToPoint:POINT(points.count - 1)];
    
    CGContextAddPath(context, smoothedPath.CGPath);
    CGContextDrawPath(context, kCGPathStroke);
    
}

-(void)drawCiclePointWithArc:(CGPoint) center withRadius:(CGFloat) radius withColor:(CGColorRef )color withFillColor:(CGColorRef )fillcolor {
    //x轴是75 y轴
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.name = @"Radius";
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapButt;
    CGFloat startAngle = 0; //
    CGFloat endAngle = ((float)M_PI * 2) ;
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    layer.path = path.CGPath;
    layer.lineWidth = 1.0;
    layer.strokeColor = color;
    layer.fillColor = fillcolor;
    [self.layer addSublayer:layer];
}

-(void)verticalLine{
    CGFloat screenWidth = self.frame.size.width;
    CGFloat screenHeight = self.frame.size.height;
    CGFloat horizonheight =  (screenWidth - 40 ) / 6;
    CGFloat x;
    CGFloat y = 30;
    for (int i = 0; i<7; i++) {
        x = 20 + horizonheight * i;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(x, y)];
        [path addLineToPoint:CGPointMake(x, screenHeight - 45)];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.lineWidth = 0.5;
        if (_lineColor1) {
            layer.strokeColor = _lineColor1.CGColor;
        }else{
            layer.strokeColor = [UIColor grayColor].CGColor;
        }
        layer.path = path.CGPath;
        [self.layer addSublayer:layer];
    }
}

-(void)drawHorizonLine{
    //画横线
    CGFloat screenWidth = self.frame.size.width;
    CGFloat screenHeight = self.frame.size.height;
    CGFloat horizonheight =  (screenHeight - 35 - 80) / 3;
    CGFloat x = 15;
    CGFloat y;
    for (int i = 0; i<4; i++) {
        y = 35 + horizonheight * i;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(x, y)];
        [path addLineToPoint:CGPointMake(screenWidth - x, y)];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.lineWidth = 0.5;
        if (_lineColor1) {
            layer.strokeColor = _lineColor1.CGColor;
        }else{
            layer.strokeColor = [UIColor grayColor].CGColor;
        }
        layer.path = path.CGPath;
        [self.layer addSublayer:layer];
    }
}

-(void)addCAGradientLayer:(CGPoint) center withRadius:(CGFloat) radius{
    CGColorRef smallcolor1 = _smallCircleFristColor == nil ? [UIColor blackColor].CGColor:_smallCircleFristColor.CGColor;
    CGColorRef smallcolor2 = _smallCircleFristColor2 == nil ? [UIColor blackColor].CGColor:_smallCircleFristColor2.CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapButt;
    CGFloat startAngle = 0;
    CGFloat endAngle = ((float)M_PI * 2) ;
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    layer.strokeColor = [UIColor clearColor].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = layer.frame;
    gradientLayer.locations = @[@(0.0),@(1.0)];
    // 起始点
    gradientLayer.startPoint = CGPointMake(0, 0);
    // 结束点
    gradientLayer.endPoint   = CGPointMake(1, 1);
    gradientLayer.colors = @[(__bridge id)smallcolor1,(__bridge id)smallcolor2];
    gradientLayer.mask = layer;
    [self.layer addSublayer:gradientLayer];
    
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
    
    self.textColorArray = @[[UIColor colorWithHEX:0xF54949],[UIColor colorWithHEX:0x27BE6B],[UIColor colorWithHEX:0x1592ED],[UIColor colorWithHEX:0xFC8D2F]];
    self.descArray = [NSArray arrayWithObjects:@"加仓",@"减仓",@"观望",@"持仓",@"***", nil];
}

-(void)initJRJSuperSignalUIView:(JRJSuperSignalAnimationViewStyle)indexStyle withDesc:(NSString*)desc{
    self.indexStyle = indexStyle;
    JRJSuperSignalAnimationViewStyle index;
    if (indexStyle == JRJSuperSignalNoAuthStockStyle) {
        index = 3;
    }else{
        index = indexStyle;
    }
    [self initColorArray];
    self.backgroundColor = [UIColor whiteColor];
    self.descUILabel.textColor = [UIColor blackColor];
    self.lineColor1 = self.lineColor1Array[index];
    self.lineSmoothColor = self.lineSmoothColorArray[index];
    self.smallCircleFristColor = self.smallCircleFristColorArray[index];
    self.smallCircleFristColor2 = self.smallCircleFristColor2Array[index];
    self.smallCircleSecondColor1 = self.smallCircleSecondColor1Array[index];
    self.smallCircleSecondColor2 = self.smallCircleSecondColor2Array[index];
    self.fristShadowColor = self.fristShadowColorArray[index];
    self.circlebgColor = self.circlebgColor1Array[index];
    self.circleMainColor = self.circleMainColorArray[index];
    self.circleMainColor2 = self.circleMainColor2Array[index];
    self.animationColor = self.animationColorArray[index];
    self.textUIColor = self.textColorArray[index];
    self.desc = desc;
}


@end
