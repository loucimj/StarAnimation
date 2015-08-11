//
//  ViewController.m
//  StarAnimation
//
//  Created by Javi on 6/8/15.
//  Copyright (c) 2015 FuzeIdea. All rights reserved.
//

#import "ViewController.h"
#import "BubbleView.h"

@interface ViewController ()

@property (nonatomic, weak) CAShapeLayer *pathLayer;

@end

@implementation ViewController

BubbleView *bubbleView;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
      
    bubbleView = [[BubbleView alloc] initWithFrame:mainView.frame];
    bubbleView.stateForAnimation = AnimationWithXPoint;
//    bubbleView.stateForAnimation = AnimationWithYPoint;

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];


}


- (IBAction)animateClick:(id)sender {
    
    if ([bubbleView isDescendantOfView:self.view]) {
        bubbleView.layer.sublayers = nil;
        [bubbleView removeFromSuperview];
        [bubbleView initializeView];

        
    }
    [mainView addSubview:bubbleView];
    [bubbleView startAnimation];
         
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
