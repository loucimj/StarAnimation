//
//  Circle.m
//  StarAnimation
//
//  Created by Pankti Patel on 09/08/15.
//  Copyright (c) 2015 FuzeIdea. All rights reserved.
//

#import "Circle.h"

@implementation Circle


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 - (void) drawCircle
{
    self.layer.cornerRadius = (self.frame.size.width)/2;
    self.backgroundColor = [UIColor orangeColor];
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 2;
}


-(void)startAnimation: (executeAfterComplete) completionBlock{
    
    [self drawCircle];
    self.transform = CGAffineTransformMakeScale(0.3, 0.3);
    self.alpha = 0;
    
    [CATransaction begin];

    [UIView animateWithDuration:0.5 delay:.1 usingSpringWithDamping:0.2 initialSpringVelocity:5.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alpha = 1;

    } completion:^(BOOL finished) {
        
        [CATransaction setCompletionBlock: completionBlock];
        [CATransaction commit];
        
        
    }];
    
    
}

@end
