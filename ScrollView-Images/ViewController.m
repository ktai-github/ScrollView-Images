//
//  ViewController.m
//  ScrollView-Images
//
//  Created by KevinT on 2018-02-26.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray<UIView*> *pages;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.pages = [[NSMutableArray alloc] init];
  [self.scrollView setPagingEnabled:YES];
  [self.scrollView setDelegate:self];
  [self setupPages];
  
//  CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
//
//  UIView *view = [[UIView alloc] initWithFrame:frame];
//
//  view.backgroundColor = [UIColor orangeColor];
//  [self.view addSubview:view];

//  CGRect frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)

  
}

- (void) setupPages {
  for (int i = 0; i < 3; i++) {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    switch (i) {
      case 0:
        [imageView setBackgroundColor:[UIColor greenColor]];
        break;
        
      case 1:
        [imageView setBackgroundColor:[UIColor redColor]];
        break;
        
      case 2:
        [imageView setBackgroundColor:[UIColor blueColor]];
        break;
        
    }
    [self.pages addObject:imageView];
    [self.scrollView addSubview:imageView];
    NSLog(@"added %d", i);
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
//    [imageView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
//    [imageView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
//    [imageView.leftAnchor constraintEqualToAnchor:self.scrollView.leftAnchor].active = YES;
//    [imageView.rightAnchor constraintEqualToAnchor:self.scrollView.rightAnchor].active = YES;
    
    
  }
  self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * self.pages.count, 0);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
