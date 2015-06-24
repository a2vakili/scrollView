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
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ZoomOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    self.imageView= [[UIImageView alloc]initWithImage:self.zoomImage];
    [self.scrollView addSubview:self.imageView];
    
   self.scrollView.delegate= self;


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UIImageView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    //return [self.scrollView.subviews firstObject];
    return self.imageView;
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
