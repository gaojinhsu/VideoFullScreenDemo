//
//  VideoViewController.m
//  VideoFullScreenDemo
//
//  Created by Gaojin Hsu on 10/26/15.
//  Copyright © 2015 Geensee. All rights reserved.
//

#import "VideoViewController.h"
#import "UINavigationController+Rotation.h"

@interface VideoViewController ()

@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *videoViewHeightConstraint;

@end

@implementation VideoViewController {
    NSInteger _originalVideoViewHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _originalVideoViewHeight = _videoViewHeightConstraint.constant;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(orientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterExitFullScreenMode:(id)sender {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        UIDeviceOrientation orientation=[[UIDevice currentDevice]orientation];
        int val = (orientation == UIDeviceOrientationPortrait ? UIInterfaceOrientationLandscapeRight : UIDeviceOrientationPortrait);
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }

}

- (BOOL)shouldAutorotate {
    return YES;
}

- (void)orientationDidChange:(NSNotification*)notification {
    UIDeviceOrientation Orientation=[[UIDevice currentDevice]orientation];
    
    if(Orientation==UIDeviceOrientationLandscapeLeft || Orientation==UIDeviceOrientationLandscapeRight) {
        // 修改视频Frame，显示全屏
        _videoViewHeightConstraint.constant = self.view.frame.size.height;
        [self.navigationController.navigationBar setHidden:YES];
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    } else if(Orientation==UIDeviceOrientationPortrait) {
        // 修改视频Frame，退出全屏
        _videoViewHeightConstraint.constant = _originalVideoViewHeight;
        [self.navigationController.navigationBar setHidden:NO];
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
