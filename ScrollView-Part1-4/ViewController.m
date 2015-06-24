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
@property (strong, nonatomic) UIImage *image1;
@property (strong ,nonatomic) UIImage *image2;
@property (strong, nonatomic) UIImage *image3;

@property (weak, nonatomic) IBOutlet UIPageControl *pageView;


@end

@implementation ViewController


- (IBAction)zoomIn:(UITapGestureRecognizer *)sender {
    
        // figuure out which image
    // pass along to the segue
    

    
    [self performSegueWithIdentifier:@"showImage" sender:sender];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int imagenumber= self.scrollView.contentOffset.x/self.scrollView.frame.size.width;
    self.pageView.currentPage= imagenumber;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate= self;
    self.image1= [UIImage imageNamed:@"Lighthouse-in-Field"];
    self.image2= [UIImage imageNamed:@"Lighthouse-night"];
    self.image3= [UIImage imageNamed:@"Lighthouse-zoomed"];
    NSArray *images= @[self.image1,self.image2,self.image3];
    
    CGFloat xPosition= 0;
    for (UIImage *image in images) {
        UIImageView *imageView= [[UIImageView alloc] initWithImage:image];
        CGRect frame= CGRectMake(xPosition, 0 , self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        imageView.frame= frame;
        xPosition+= self.scrollView.frame.size.width;
        imageView.contentMode= UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = YES;

//        UIImageView *image= [[UIImageView alloc]init];
        
        
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize= (CGSize){
        xPosition, self.scrollView.frame.size.height
    };
}



-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"showImage"]){
        ZoomOutViewController *target= [ segue destinationViewController];
        
        CGPoint location= [sender locationInView:self.scrollView];
        int image= location.x/self.scrollView.frame.size.width;
        
        if (image ==0) {
            target.zoomImage= self.image1;
        }
        else if (image ==1){
            target.zoomImage= self.image2;
        }
        else{
            target.zoomImage=self.image3;
        }
        
//        
//        
//        [someObject aMethod:aParameter];
//        [someObject someMethod];
//        
//        // exactly the same:
//        [someObject setProperty:newValue];
//        someObject.property = newValue;
        
        
    }
}

//




@end
