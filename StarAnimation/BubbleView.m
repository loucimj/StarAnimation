//
//  BubbleView.m
//  StarAnimation
//
//  Created by Pankti Patel on 11/08/15.
//  Copyright (c) 2015 FuzeIdea. All rights reserved.
//

#import "BubbleView.h"
#import "StarView.h"
#import "LineView.h"
#import "Circle.h"



@implementation BubbleView

CGFloat xPoint, yPoint, width, height;
CGFloat limitLine;
CGFloat space = 30;
int count;
StarView *star;
LineView *line;
Circle *circle;

UIImage *image;


- (id)init {
    self = [super init];
    if (self) {
        
//        [self initializeView: image];
    }
    return self;
}

- (id)initWithFrame:(CGRect)theFrame {
    self = [super initWithFrame:theFrame];
    if (self) {
        
//        [self initializeView: image];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        
//        [self initializeView: image];
    }
    return self;
}

-(void)initializeView:(UIImage *)profileImage {
    
    image = profileImage;
    
    star = [[StarView alloc] init];
    
    line = [[LineView alloc] init];
    
    circle = [[Circle alloc] init];

    star.frame = CGRectMake(self.frame.size.width/2-23, 500, 100, 100);
    line.frame = CGRectMake(self.frame.size.width/2, 100, 10,400);
    circle.frame = CGRectMake(self.frame.size.width/2-20, 60, 40,40);

    [self addSubview:star];
    [self addSubview:line];
    [self addSubview:circle];

}

-(void)startAnimation{
    dispatch_async(dispatch_get_main_queue(), ^{
    
        [star startAnimation:^{
            [line startAnimation:^{
                [self addBubblesWithAnimationOnView];
                [circle startAnimation:^{
                }];
            }];
        }];
    });
}



-(void) addBubblesWithAnimationOnView {
    
    xPoint = 0, yPoint = 60, width = 60, height= 60;
    count = 0.1;
    //create Left view
    for (int i = 0; i < 10; i++) {
        
        CGRect nextBubbleFrame = [self getFrameForNextBubble:YES];
        CGRect fromRect = CGRectMake(-60, nextBubbleFrame.origin.y, nextBubbleFrame.size.width, nextBubbleFrame.size.height);
        CALayer *bubble = [self createBubbleView:fromRect];
        CALayer *containerLayer = [self createShadowLayer];
        if (i%2 == 0){
            containerLayer.opacity = 0.4;
        }
        
        [containerLayer addSublayer:bubble];
        [self.layer addSublayer:containerLayer];
        
        bubble.frame = nextBubbleFrame;
        
        if (self.stateForAnimation == AnimationWithXPoint) {
            
            [self addFallAnimationForLayer:bubble forLeftView:TRUE];
        }
        else{
        
            [self addFallAnimationOnYPointWithLayer:bubble];
        }
        
        
    }
    
    //create right view
    xPoint = 0, yPoint = 60, width = 60, height= 60;
    count = 0.1;
    for (int i = 0; i < 10; i++) {
        
        CGRect nextBubbleFrame = [self getFrameForNextBubble:NO];
        CGRect fromRect = CGRectMake(self.frame.size.width+60, nextBubbleFrame.origin.y, nextBubbleFrame.size.width, nextBubbleFrame.size.height);
        CALayer *bubble = [self createBubbleView:fromRect];
        
        CALayer *containerLayer = [self createShadowLayer];
        if (i%2 == 0){
            containerLayer.opacity = 0.4;
        }
        [containerLayer addSublayer:bubble];
        [self.layer addSublayer:containerLayer];
        
        bubble.frame = nextBubbleFrame;
        
        if (self.stateForAnimation == AnimationWithXPoint) {
            
            [self addFallAnimationForLayer:bubble forLeftView:TRUE];
        }
        else{
            
            [self addFallAnimationOnYPointWithLayer:bubble];
        }
        
    }
    
    
}


-(CALayer*) createShadowLayer{
    //draw shadow
    CALayer* containerLayer = [CALayer layer];
    containerLayer.shadowColor = [UIColor whiteColor].CGColor;
    containerLayer.shadowRadius = 5;
    containerLayer.shadowOffset = CGSizeMake(0.f, 0.f);
    containerLayer.shadowOpacity = 1.f;
    return containerLayer;
}
- (void)addFallAnimationForLayer:(CALayer *)layer  forLeftView:(BOOL)forLeftView{
    
    
    int startPoint;
    if (layer.frame.origin.x < limitLine) {
        startPoint = -60;
    }
    else{
        
        startPoint = self.frame.size.width;
    }
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(startPoint, layer.position.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(layer.position.x, layer.position.y)];
    animation.duration = count*0.1;
//    animation.repeatCount = 2;
//    animation.autoreverses = YES;
    count++;
    [layer addAnimation:animation forKey:animation.keyPath];
    
    
    
}

-(void)addFallAnimationOnYPointWithLayer:(CALayer *)layer{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(random()%(int)layer.position.x, random()%(int)layer.position.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(layer.position.x, layer.position.y-10)];
    animation.duration = 0.7;
    [layer addAnimation:animation forKey:animation.keyPath];
}


-(CGRect)getFrameForNextBubble:(BOOL)isLeftView{
    
    limitLine = self.frame.size.width/2 - 10;
    
    if (isLeftView) {
        
        if ((xPoint+space) * 2 > limitLine){
            
            yPoint+=height+space-10;
            xPoint = 20;
        }
        else{
            
            if (xPoint > 0){
                xPoint +=width+10;
                yPoint+= space;
            }
            else{
                xPoint = 20;
            }
        }
        
    }
    else{
        
        if (xPoint > 0){
            
            if (xPoint - width-space-10 < limitLine){
                
                yPoint+=height+space-10;
                xPoint = self.frame.size.width-width-10;
            }
            else{
                
                xPoint -= width+10;
                yPoint+= space;
            }
        }
        else{
            xPoint = self.frame.size.width-width-20;
        }
        
    }
    
    return CGRectMake(xPoint, yPoint, width, height);
}

-(CALayer *)createBubbleView: (CGRect)frame{
    
    CALayer *roundedLayer = [CALayer layer];
    [roundedLayer setFrame:frame];
    roundedLayer.cornerRadius = frame.size.width/2;
    roundedLayer.masksToBounds = TRUE;
    roundedLayer.borderColor = [UIColor whiteColor].CGColor;
    roundedLayer.borderWidth = 2;
    [roundedLayer setContents:(id)image.CGImage ];
    
    return roundedLayer;
}

@end
