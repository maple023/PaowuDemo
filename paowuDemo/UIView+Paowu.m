//
//  UIView+Paowu.m
//  paowuDemo
//
//  Created by happi on 2017/4/25.
//  Copyright © 2017年 xishan. All rights reserved.
//

#import "UIView+Paowu.h"

@implementation UIView (Paowu)

-(void)parabolaToPoint:(CGPoint)point duration:(float)duration{
    CAAnimation *animation = [self pathAnimationQuadCurveToPoint:point duration:duration scaleTo:1] ;
    animation.delegate = self;
    [self.layer addAnimation:animation forKey:@"parabola"];
    self.center = point;
}
-(void)parabolaToPoint:(CGPoint)point duration:(float)duration scaleTo:(float)scale{
    CAAnimation *animation = [self pathAnimationQuadCurveToPoint:point duration:duration scaleTo:scale] ;
    animation.delegate = self;
    [self.layer addAnimation:animation forKey:@"parabola"];
    self.transform =CGAffineTransformMakeScale(scale, scale);
    self.center = point;
}

- (CAAnimation*)pathAnimationQuadCurveToPoint:(CGPoint )pt duration:(float)duration scaleTo:(float)sc; {
    
    CGPoint orignal =  self.center;//起始点
    CGPoint contolPoin = CGPointZero;//中间点
    CGPoint destPoint = pt;//结束点
    
    contolPoin.x = orignal.x + (destPoint.x - orignal.x)/2;
    contolPoin.y = destPoint.y / 4;
    
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path,NULL,orignal.x,orignal.y);
    CGPathAddQuadCurveToPoint(path,NULL,contolPoin.x ,contolPoin.y,destPoint.x,destPoint.y);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setPath:path];
    [animation setDuration:duration];
    //    [animation setKeyTimes:@[@0,@1,@3]];
    CFRelease(path);
    
    
    CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @1.0;
    scaleAnimation.toValue = [NSNumber numberWithFloat:sc];
    scaleAnimation.duration = duration;
    
    
    
    
    
    CAAnimationGroup * animationGp = [CAAnimationGroup animation];
    animationGp.duration = duration;
    animationGp.animations = @[animation,scaleAnimation];
    return animationGp;
}
-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"抛物线开始");
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        NSLog(@"抛物线完成");
        //        [UIView animateWithDuration:0.03
        //                              delay:0
        //                            options:UIViewAnimationOptionCurveEaseInOut
        //                         animations:^{
        //                             self.alpha = 0.3;
        //                         }
        //                         completion:^(BOOL finished) {
        //                             [self removeFromSuperview];
        //                         }];
        
        //结束后 弹跳动画
        CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
        CGFloat currentTx = self.transform.ty;
        animation1.duration = 0.3;
        CGFloat height = 5;
        animation1.values = @[@(currentTx), @(currentTx + height), @(currentTx-height/3*2), @(currentTx + height/3*2), @(currentTx -height/3), @(currentTx + height/3), @(currentTx)];
        animation1.keyTimes = @[ @(0), @(0.225), @(0.425), @(0.6), @(0.75), @(0.875), @(1) ];
        animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.layer addAnimation:animation1 forKey:@"kViewShakerAnimationKey"];
        
    }
}

@end
