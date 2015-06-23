//
//  ViewController.m
//  ScrollView-Part1-4
//
//  Created by Arsalan Vakili on 2015-06-23.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate= self;
    UIImage *image1= [UIImage imageNamed:@"Lighthouse-in-Field"];
    UIImage *image2= [UIImage imageNamed:@"Lighthouse-night"];
    UIImage *image3= [UIImage imageNamed:@"Lighthouse-zoomed"];
    NSArray *images= @[image1,image2,image3];
    
    CGFloat xPosition= 0;
    for (UIImage *image in images) {
        UIImageView *imageView= [[UIImageView alloc] initWithImage:image];
        imageView.contentMode= UIViewContentModeScaleAspectFit;
//        UIView *imageView= [[UIView alloc]initWithFrame:{xPosition, 0, self.scrollView.frame.size.width,self.scrollView.frame.size.height}];
        xPosition+= self.scrollView.frame.size.width;
//        UIImageView *image= [[UIImageView alloc]init];
        
        
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize= (CGSize){
        xPosition, self.scrollView.frame.size.height
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
