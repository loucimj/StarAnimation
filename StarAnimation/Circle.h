//
//  Circle.h
//  StarAnimation
//
//  Created by Pankti Patel on 09/08/15.
//  Copyright (c) 2015 FuzeIdea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Circle : UIView
typedef void(^executeAfterComplete)();

-(void)startAnimation: (executeAfterComplete) completionBlock;
@end
