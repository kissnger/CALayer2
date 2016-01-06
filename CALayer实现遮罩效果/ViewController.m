//
//  ViewController.m
//  CALayer实现遮罩效果
//
//  Created by Massimo on 15/12/30.
//  Copyright © 2015年 Massimo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic , strong) CALayer *imageLayer;
@property (nonatomic, strong) CALayer *maskLayer;

@property (nonatomic , strong) UIImage *imageContents;
@property (nonatomic, strong) UIImage *maskContents;


@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor grayColor];
  self.imageContents = [UIImage imageNamed:@"原始图片"];
  self.maskContents = [UIImage imageNamed:@"maskLayerContents"];
  
  self.imageLayer = [CALayer layer];
  self.imageLayer.frame = CGRectMake(50, 50, 200, 200);
  self.imageLayer.contents = (__bridge id _Nullable)(self.imageContents.CGImage);
  
  [self.view.layer addSublayer:self.imageLayer];
  
  
  self.maskLayer = [CALayer layer];
  self.maskLayer.frame = self.imageLayer.bounds;
//  self.maskLayer.contents = (__bridge id _Nullable)(self.maskContents.CGImage);
  self.maskLayer.backgroundColor = [UIColor blackColor].CGColor;
  self.imageLayer.mask = self.maskLayer;
  
  [self performSelector:@selector(layerAnimation)
             withObject:nil
             afterDelay:3.f];
  
}


- (void)layerAnimation{
  self.maskLayer.frame = CGRectMake(50, 50, 200, 200);
}


@end
