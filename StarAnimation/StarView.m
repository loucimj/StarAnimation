//
//  StarView.m
//  StarAnimation
//
//  Created by Javi on 6/8/15.
//  Copyright (c) 2015 FuzeIdea. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "StarView.h"

@implementation StarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIBezierPath *)samplePath
{
    //// path3651 Drawing
    UIColor* color0 = [UIColor colorWithRed: 0.423 green: 0.423 blue: 0.423 alpha: 1];

    UIBezierPath* path3651Path = UIBezierPath.bezierPath;
    [path3651Path moveToPoint: CGPointMake(37.21, 45.5)];
    [path3651Path addLineToPoint: CGPointMake(23.02, 35.72)];
    [path3651Path addLineToPoint: CGPointMake(8.8, 45.44)];
    [path3651Path addLineToPoint: CGPointMake(13.27, 28.24)];
    [path3651Path addLineToPoint: CGPointMake(0.07, 17.03)];
    [path3651Path addLineToPoint: CGPointMake(17.02, 16.18)];
    [path3651Path addLineToPoint: CGPointMake(23.08, -0.48)];
    [path3651Path addLineToPoint: CGPointMake(29.09, 16.2)];
    [path3651Path addLineToPoint: CGPointMake(46.04, 17.11)];
    [path3651Path addLineToPoint: CGPointMake(32.81, 28.27)];
    [path3651Path addLineToPoint: CGPointMake(37.21, 45.5)];
    [path3651Path closePath];
    path3651Path.miterLimit = 4;
    
    [UIColor.whiteColor setFill];
    [path3651Path fill];
    [color0 setStroke];
    path3651Path.lineWidth = 2.02;
    [path3651Path stroke];
    
    return path3651Path;
}

- (void)startAnimation
{
    if (self.pathLayer == nil)
    {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        
        shapeLayer.path = [[self samplePath] CGPath];
        shapeLayer.strokeColor = [[UIColor darkGrayColor] CGColor];
        shapeLayer.fillColor = nil;
        shapeLayer.lineWidth = 2.5f;
        shapeLayer.lineJoin = kCALineCapRound;
        
        [self.layer addSublayer:shapeLayer];
        
        self.pathLayer = shapeLayer;
    }
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.35;
    pathAnimation.fromValue = @(0.0f);
    pathAnimation.toValue = @(1.0f);
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
}

@end
