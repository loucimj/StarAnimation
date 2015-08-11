//
//  LineView.h
//  StarAnimation
//
//  Created by Javi on 6/8/15.
//  Copyright (c) 2015 FuzeIdea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineView : UIView
@property (nonatomic, weak) CAShapeLayer *pathLayer;
typedef void(^executeAfterComplete)();

- (void)startAnimation: (executeAfterComplete) completionBlock;

@end
