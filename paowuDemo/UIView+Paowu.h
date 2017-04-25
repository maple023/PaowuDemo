//
//  UIView+Paowu.h
//  paowuDemo
//
//  Created by happi on 2017/4/25.
//  Copyright © 2017年 xishan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Paowu)<CAAnimationDelegate>

-(void)parabolaToPoint:(CGPoint)point duration:(float)duration;
-(void)parabolaToPoint:(CGPoint)point duration:(float)duration scaleTo:(float)scale;

@end
