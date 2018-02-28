//
//  ViewController.m
//  ScrollView-Images
//
//  Created by KevinT on 2018-02-26.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "ViewController.h"
#import "DetailedViewController.h"

//UIImageView *imageView;

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray<UIView*> *pages;
//@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.pages = [[NSMutableArray alloc] init];
  [self.scrollView setPagingEnabled:YES];
  [self.scrollView setDelegate:self];
  [self setupPages];
  
  
}

- (IBAction)imageTapped:(UITapGestureRecognizer *)sender {
  [self performSegueWithIdentifier:@"Segue" sender:sender.view];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  //self.currentPage = imageView.tag;

//  scrollView.contentOffset
//  int width = scrollView.frame.size.width;
//  float xPos = scrollView.contentOffset.x+10;
  UIPageControl *pageControl = [[UIPageControl alloc] init];
    if (scrollView.contentOffset.x < 300) {
      pageControl.currentPage = 1;
    } else if (scrollView.contentOffset.x >= 300 && scrollView.contentOffset.x < 600) {
      pageControl.currentPage = 2;
    } else {
      pageControl.currentPage = 3;
    }
  //
  //  NSLog(@"%d", self.currentPage);
  //Calculate the page we are on based on x coordinate position and width of scroll view
//  pageControl.currentPage = (int)xPos/width;
}                                               // any offset changes

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ([segue.identifier isEqualToString:@"Segue"]) {
    DetailedViewController *detailedViewController = segue.destinationViewController;
    detailedViewController.image = ((UIImageView *)sender).image;
  }
}

- (void) setupPages {
  
  
  for (int i = 0; i < 3; i++) {
  
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
    [imageView addGestureRecognizer:tapGestureRecognizer];
    [imageView setUserInteractionEnabled:true];
    //add tap gesture recognizer
//    [self.tapGestureRecognizer addTarget:imageView action:@selector(imageTapped:) ];

    switch (i) {
      case 0:
//        [imageView setBackgroundColor:[UIColor greenColor]];
//        self.policeSketch = [[PoliceSketchModel alloc] init];
//        // Do any additional setup after loading the view, typically from a nib.
//        self.policeSketch.eyes = [UIImage imageNamed:@"eyes_1"];
//        self.eyesImageView.image = self.policeSketch.eyes;
        imageView.image = [UIImage imageNamed:@"Lighthouse"];
        break;
        
      case 1:
        imageView.image = [UIImage imageNamed:@"Lighthouse-night"];
        break;
        
      case 2:
        imageView.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
        break;
        
    }
    imageView.tag = i;
    [self.pages addObject:imageView];
    [self.scrollView addSubview:imageView];
    NSLog(@"added %d", i);
//    imageView.translatesAutoresizingMaskIntoConstraints = NO;
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
