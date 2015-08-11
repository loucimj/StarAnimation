//
//  StarView.h
//  StarAnimation
//
//  Created by Javi on 6/8/15.
//  Copyright (c) 2015 FuzeIdea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
typedef void(^executeAfterComplete)();

@property (nonatomic, weak) CAShapeLayer *pathLayer;

- (void)startAnimation: (executeAfterComplete) completionBlock;
@end
