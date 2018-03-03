//
//  DetailedViewController.m
//  ScrollView-Images
//
//  Created by KevinT on 2018-02-26.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *detailedScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *detailedImageView;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.detailedImageView.image = self.image;
  
//  CGFloat width = 100;
//  CGFloat height = 100;
//
//  CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
//
//  UIView *view = [[UIView alloc] initWithFrame:frame];
  
//  view.backgroundColor = [UIColor purpleColor];
//  [self.view addSubview:view];
  
  UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(viewPinched:)];
  [self.detailedScrollView addGestureRecognizer:pinchGesture];

}

- (void)viewPinched:(UIPinchGestureRecognizer *) sender {
  CGFloat scale = sender.scale;
  sender.view.transform = CGAffineTransformMakeScale(scale, scale);
  
  scale = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  
  return self.detailedImageView;
}     // return a view that will be scaled. if delegate returns nil, nothing happens

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
