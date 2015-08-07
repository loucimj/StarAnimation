//
//  ViewController.m
//  StarAnimation
//
//  Created by Javi on 6/8/15.
//  Copyright (c) 2015 FuzeIdea. All rights reserved.
//

#import "ViewController.h"
#import "StarView.h"
#import "LineView.h"

@interface ViewController ()

@property (nonatomic, weak) CAShapeLayer *pathLayer;

@end

@implementation ViewController

StarView *star;
LineView *line;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    star = [[StarView alloc] init];
    
    line = [[LineView alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    star.frame = CGRectMake(self.view.frame.size.width/2-23, 150, 100, 100);
    line.frame = CGRectMake(self.view.frame.size.width/2, 150+38, 10,400);
    [self.view addSubview:star];
    [self.view addSubview:line];
}

- (IBAction)animateClick:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        [line startAnimation:^(void) { [star startAnimation]; }];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
