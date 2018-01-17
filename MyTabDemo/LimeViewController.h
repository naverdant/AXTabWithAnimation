//
//  LimeViewController.h
//  MyTabDemo
//
//  Created by Perfect on 2018/1/16.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LimeDelegate<NSObject>
- (void)goToDetailPage:(UIViewController *)childViewController;
@end

@interface LimeViewController : UIViewController
@property (weak, nonatomic) id<LimeDelegate> delegate;
@end
