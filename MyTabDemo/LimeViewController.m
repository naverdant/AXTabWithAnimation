//
//  LimeViewController.m
//  MyTabDemo
//
//  Created by Perfect on 2018/1/16.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import "LimeViewController.h"

@interface LimeViewController ()

@end

@implementation LimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (IBAction)centerButtonWasPressed:(UIButton *)sender {
    [self.delegate goToDetailPage:self];
}

@end
