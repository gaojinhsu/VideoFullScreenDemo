//
//  TransformVideoViewController.m
//  VideoFullScreenDemo
//
//  Created by Gaojin Hsu on 2018/5/29.
//  Copyright © 2018 Geensee. All rights reserved.
//

#import "TransformVideoViewController.h"
#import "UIView+HandyLayouts.h"


#define IOS11_OR_LATER_SPACE(par) \
({\
float space = 0.0;\
if (@available(iOS 11.0, *))\
space = par;\
(space);\
})

#define JF_KEY_WINDOW [UIApplication sharedApplication].keyWindow
#define JF_TOP_SPACE IOS11_OR_LATER_SPACE(JF_KEY_WINDOW.safeAreaInsets.top)
#define JF_TOP_ACTIVE_SPACE IOS11_OR_LATER_SPACE(MAX(0, JF_KEY_WINDOW.safeAreaInsets.top-20))
#define JF_BOTTOM_SPACE IOS11_OR_LATER_SPACE(JF_KEY_WINDOW.safeAreaInsets.bottom)


@interface MyVideoView : UIView
@property (nonatomic, strong) UIButton *fullScreenBtn;
@end

@implementation MyVideoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _fullScreenBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 120, 60)];
        [self addSubview:_fullScreenBtn];
        [_fullScreenBtn setTitle:@"full screen" forState:UIControlStateNormal];
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)layoutSubviews {
    _fullScreenBtn.frame = CGRectMake(0, 0, 120, 60);
}

@end


@interface TransformVideoViewController ()

@property (strong, nonatomic) MyVideoView *videoView;
@property (assign, nonatomic) CGRect originalFrame;
@property (assign, nonatomic) CGRect fullScreenFrame;

@end

@implementation TransformVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _originalFrame = CGRectMake(0, JF_TOP_ACTIVE_SPACE + 64, SCREEN_WIDTH, SCREEN_WIDTH * 3 /4);
    _fullScreenFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _videoView = [[MyVideoView alloc]initWithFrame:_originalFrame];
    [self.view addSubview:_videoView];
    [_videoView.fullScreenBtn addTarget:self action:@selector(fullScreen:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fullScreen:(id)sender {
    if (_videoView.fullScreenBtn.isSelected) {
        [UIView animateWithDuration:0.25 animations:^{
            self.videoView.transform = CGAffineTransformInvert(CGAffineTransformMakeRotation(0));
            self.videoView.frame = self.originalFrame;
        }];
        self.navigationController.navigationBar.hidden = NO;
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            self.videoView.transform = CGAffineTransformMakeRotation(M_PI/2);
            self.videoView.frame = self.fullScreenFrame;
        }];
        self.navigationController.navigationBar.hidden = YES;
    }
    _videoView.fullScreenBtn.selected = !_videoView.fullScreenBtn.isSelected;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden {
    return _videoView.fullScreenBtn.isSelected;
}

- (BOOL)shouldAutorotate {
    return NO;
}
@end
