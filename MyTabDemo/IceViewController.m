//
//  IceViewController.m
//  MyTabDemo
//
//  Created by Perfect on 2018/1/16.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import "IceViewController.h"

@interface IceViewController ()

@end

@implementation IceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (IBAction)centerButtonWasPressed:(UIButton *)sender {
    NSLog(@"ice ButtonWasPressed");
}

@end
