//
//  LineView.m
//  StarAnimation
//
//  Created by Javi on 6/8/15.
//  Copyright (c) 2015 FuzeIdea. All rights reserved.
//

#import "LineView.h"

@implementation LineView

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
    [path3651Path moveToPoint: CGPointMake(0, 400)];
    [path3651Path addLineToPoint: CGPointMake(0, 0)];
    [path3651Path closePath];
    path3651Path.miterLimit = 4;
    UIGraphicsBeginImageContext(self.frame.size);

    [UIColor.whiteColor setFill];
    [path3651Path fill];
    [color0 setStroke];
    path3651Path.lineWidth = 2.02;
    [path3651Path stroke];
    UIGraphicsEndImageContext();

    return path3651Path;
}

- (void)startAnimation: (executeAfterComplete) completionBlock
{
    
    
    if (self.pathLayer == nil)
    {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        
        shapeLayer.path = [[self samplePath] CGPath];
        shapeLayer.strokeColor = [[UIColor whiteColor] CGColor];
        shapeLayer.fillColor = nil;
        shapeLayer.lineWidth = 2.5f;
        shapeLayer.lineJoin = kCALineCapRound;
        
        [self.layer addSublayer:shapeLayer];
        
        self.pathLayer = shapeLayer;
    }
    
    [CATransaction begin];
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.65;
    pathAnimation.fromValue = @(0.0f);
    pathAnimation.toValue = @(1.0f);
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    if (completionBlock != nil) {
        [CATransaction setCompletionBlock: completionBlock];
    }

    [self.pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    [CATransaction commit];
}

@end
