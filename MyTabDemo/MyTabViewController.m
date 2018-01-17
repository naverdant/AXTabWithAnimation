//
//  MyTabViewController.m
//  MyTabDemo
//
//  Created by Perfect on 2018/1/16.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import "MyTabViewController.h"
#import "LimeViewController.h"
#import "CreamViewController.h"
#import "IceViewController.h"

typedef NS_ENUM(NSInteger, ChildControllerTag){
    ChildControllerTagLime,
    ChildControllerTagCream,
    ChildControllerTagIce
};

@interface MyTabViewController () <LimeDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) LimeViewController *limeVC;
@property (strong, nonatomic) CreamViewController *creamVC;
@property (strong, nonatomic) IceViewController *iceVC;
@property (strong, nonatomic) UIViewController *originalChildVC;
@end

@implementation MyTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildViewController:self.limeVC];
    
    // containerView.frame is not determined in viewDidLoad. Adding this line to prevent displacement while adding subview.
    self.containerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    [self.containerView addSubview:self.limeVC.view];
    [self.limeVC didMoveToParentViewController:self];
    self.originalChildVC = self.limeVC;
}

- (void)cycleFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];

    toViewController.view.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);

    [self transitionFromViewController:fromViewController toViewController:toViewController duration:0.5 options:0 animations:^{
        // No need to addSubView or removeFromSuperView
        toViewController.view.frame = fromViewController.view.frame;
        fromViewController.view.frame = CGRectMake(- self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);

    } completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
    }];
    
    /* Without transition animation between child view controllers.
    [fromViewController willMoveToParentViewController:nil];
    [fromViewController.view removeFromSuperview];
    [fromViewController removeFromParentViewController];
    
    [self addChildViewController:toViewController];
    [self.containerView addSubview:toViewController.view];
    [toViewController didMoveToParentViewController:self];
    **/
    
    self.originalChildVC = toViewController;
}

#pragma mark - Delegate
- (void)goToDetailPage:(UIViewController *)childViewController {
    if([childViewController isKindOfClass:[LimeViewController class]]){
        NSLog(@"Lime go to detail.");
    }
}

#pragma mark - Actions
- (IBAction)myTabBarButtonWasPressed:(UIButton *)sender {
    if(sender.tag == ChildControllerTagLime){
        [self cycleFromViewController:self.originalChildVC toViewController:self.limeVC];
        
    }else if (sender.tag == ChildControllerTagCream){
        [self cycleFromViewController:self.originalChildVC toViewController:self.creamVC];
        
    }else if (sender.tag == ChildControllerTagIce){
        [self cycleFromViewController:self.originalChildVC toViewController:self.iceVC];
    }
}

#pragma mark - Lazy
- (LimeViewController *)limeVC {
    if(!_limeVC){
        _limeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LimeViewController"];
        _limeVC.delegate = self;
    }
    return _limeVC;
}

- (CreamViewController *)creamVC {
    if(!_creamVC){
        _creamVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CreamViewController"];
    }
    return _creamVC;
}

- (IceViewController *)iceVC {
    if(!_iceVC){
        _iceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"IceViewController"];
    }
    return _iceVC;
}

@end
