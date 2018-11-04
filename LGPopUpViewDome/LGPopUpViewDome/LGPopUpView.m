//
//  PopWithBottomUp.m
//  qfxtaoguwang
//
//  Created by carnet on 2018/10/17.
//  Copyright © 2018年 qfx. All rights reserved.
//

#define lgScreenWidth [UIScreen mainScreen].bounds.size.width
#define lgScreenHeight [UIScreen mainScreen].bounds.size.height

#import "LGPopUpView.h"
@interface LGPopUpView ()
@property (nonatomic,strong) PopShowView *showView;
@property (nonatomic,assign) NSInteger referenceHeight;
@end
@implementation LGPopUpView
///自定义显示区域的UI
+ (LGPopUpView *)addShowSubView:(UIView *)view
{
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    LGPopUpView *pop = [[LGPopUpView alloc]initWithFrame:CGRectMake(window.frame.origin.x, window.frame.origin.y, lgScreenWidth, lgScreenHeight)];
    [window addSubview:pop];
    
    pop.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.3];
    pop.referenceHeight = view.frame.size.height;
    
    [pop.showView addSubview:view];
    
    return pop;
}
- (PopShowView *)showView
{
    if (!_showView) {
        _showView = [[PopShowView alloc]initWithFrame:CGRectMake(0,lgScreenHeight-_referenceHeight, lgScreenWidth, _referenceHeight)];
        [self addSubview:_showView];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, lgScreenWidth,lgScreenHeight-_referenceHeight)];
        [self addSubview:view];
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHide)];
        [view addGestureRecognizer:tap];
    }
    return _showView;
}

///弹出视图
- (void)popView
{
    self.hidden = NO;
    [self.showView popView];
}
///隐藏视图
- (void)hideView
{
    [self clickHide];
}
- (void)clickHide
{
    self.hidden = YES;
}
@end

@interface PopShowView ()
@property (nonatomic,assign) NSInteger referenceHeight;
@end

@implementation PopShowView
///弹出视图
- (void)popView
{
    self.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.05];
    
    [self layerKeyFrameAnimation];
}
//关键帧动画
-(void)layerKeyFrameAnimation
{
    _referenceHeight = self.frame.size.height+10;
    //画一个path
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(lgScreenWidth/2, lgScreenHeight+_referenceHeight/2)];
    [path addLineToPoint:CGPointMake(lgScreenWidth/2, lgScreenHeight-_referenceHeight/2)];
    //变动的属性,keyPath后面跟的属性是CALayer的属性
    CAKeyframeAnimation *keyFA = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //动画路径
    keyFA.path = path.CGPath;
    //动画总时间
    keyFA.duration = 0.3f;
    //重复次数，小于0无限重复
    keyFA.repeatCount = 1;
    keyFA.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    keyFA.fillMode = kCAFillModeForwards;
    keyFA.calculationMode = kCAAnimationPaced;
    //旋转的模式,auto就是沿着切线方向动，autoReverse就是转180度沿着切线动
    keyFA.rotationMode = kCAAnimationLinear;
    //结束后是否移除动画
    keyFA.removedOnCompletion = NO;
    //添加动画
    [self.layer addAnimation:keyFA forKey:@""];
}
- (void)drawRect:(CGRect)rect
{
    _referenceHeight = self.frame.size.height+10;
    
    UIColor *color = [UIColor whiteColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [self setPro:path];
    [path moveToPoint:CGPointMake(0,10)];
    [path addLineToPoint:CGPointMake(0, _referenceHeight)];
    [path addLineToPoint:CGPointMake(lgScreenWidth-0, _referenceHeight)];
    [path addLineToPoint:CGPointMake(lgScreenWidth-0, 10)];
    
    [path addArcWithCenter:CGPointMake(lgScreenWidth-10, 10)
                    radius:10
                startAngle:0
                  endAngle:-M_PI_2
                 clockwise:NO];
    
    [path addLineToPoint:CGPointMake(lgScreenWidth-10, 0)];
    [path addLineToPoint:CGPointMake(10, 0)];
    
    [path addArcWithCenter:CGPointMake(10, 10)
                    radius:10
                startAngle:-M_PI_2
                  endAngle:-M_PI
                 clockwise:NO];
    [path fill];
}
- (void)setPro:(UIBezierPath *)path
{
    ///线宽
    path.lineWidth = 1.0;
    //线条拐角
    path.lineCapStyle = kCGLineCapButt;
    //终点处理
    path.lineJoinStyle = kCGLineCapRound;
}

@end
