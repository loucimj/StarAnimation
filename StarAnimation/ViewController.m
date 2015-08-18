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
NSArray *images;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
      
    bubbleView = [[BubbleView alloc] initWithFrame:mainView.frame];
    bubbleView.stateForAnimation = AnimationWithXPoint;
    
    images = @[
            @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpf1/v/t1.0-1/c0.38.200.200/p200x200/10462876_900776969941194_8681214819925943790_n.jpg?oh=b10db556689f18dc5b8b8eea648077b4&oe=563FC4B7&__gda__=1451003511_b8cfed5e2128de86c98a7474ef5d0cf3",
            @"https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg",
            @"http://cdn.devilsworkshop.org/files/2013/01/enlarged-facebook-profile-picture.jpg",
            @"https://static-secure.guim.co.uk/sys-images/Observer/Pix/pictures/2012/10/27/1351332704639/Javier-Bardem-Profile-011.jpg",
            @"https://pbs.twimg.com/profile_images/1731485432/justin-profile-face.jpg",
            @"https://pbs.twimg.com/profile_images/451007105391022080/iu1f7brY_400x400.png",
            @"https://pbs.twimg.com/profile_images/558109954561679360/j1f9DiJi.jpeg",
            @"http://cdn23.us1.fansshare.com/photos/javimartinez/javi-martinez-angry-face-close-up-profile-footballer-model-promo-product-shill-99980576.jpg"
            
               ];
    
    
//    bubbleView.stateForAnimation = AnimationWithYPoint;

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];


}


- (IBAction)animateClick:(id)sender {
    
    if ([bubbleView isDescendantOfView:self.view]) {
        bubbleView.layer.sublayers = nil;
        [bubbleView removeFromSuperview];
        
        long maxValue = [images count] -1;
        long imageNumber = rand() % maxValue;
        NSLog(@"%ld",imageNumber);
        NSLog (@"%@",images[imageNumber]);
        NSURL *imageURL = [NSURL URLWithString:images[imageNumber]];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        
        [bubbleView initializeView:image];

        
    }
    [mainView addSubview:bubbleView];
    [bubbleView startAnimation];
         
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
