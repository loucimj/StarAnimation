//
//  BubbleView.h
//  StarAnimation
//
//  Created by Pankti Patel on 11/08/15.
//  Copyright (c) 2015 FuzeIdea. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum AnimationType
{
    AnimationWithXPoint,
    AnimationWithYPoint
    
} AnimationState;

@interface BubbleView : UIView
{
    
}

@property (nonatomic) AnimationState *stateForAnimation;
-(void)startAnimation;
-(void)initializeView;
@end
