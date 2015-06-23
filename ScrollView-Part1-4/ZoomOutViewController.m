//
//  ZoomOutViewController.m
//  ScrollView-Part1-4
//
//  Created by Arsalan Vakili on 2015-06-23.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ZoomOutViewController.h"

@interface ZoomOutViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ZoomOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate= self;
    
    self.scrollView.delegate= self;
    UIImage *image1= [UIImage imageNamed:@"Lighthouse-in-Field"];
    UIImage *image2= [UIImage imageNamed:@"Lighthouse-night"];
    UIImage *image3= [UIImage imageNamed:@"Lighthouse-zoomed"];
    NSArray *images= @[image1,image2,image3];
    
    CGFloat xPosition= 0;
    for (UIImage *image in images) {
        UIImageView *imageView= [[UIImageView alloc] initWithImage:image];
        //        UIView *imageView= [[UIView alloc]initWithFrame:{xPosition, 0, self.scrollView.frame.size.width,self.scrollView.frame.size.height}];
        CGRect frame= CGRectMake(xPosition, 0 , self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        imageView.frame= frame;
        xPosition+= self.scrollView.frame.size.width;
        imageView.contentMode= UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UIImageView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [self.scrollView.subviews firstObject];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
