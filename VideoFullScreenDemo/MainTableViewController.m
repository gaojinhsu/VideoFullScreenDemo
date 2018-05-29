//
//  MainTableViewController.m
//  VideoFullScreenDemo
//
//  Created by Gaojin Hsu on 10/26/15.
//  Copyright © 2015 Geensee. All rights reserved.
//

#import "MainTableViewController.h"
#import "VideoViewController.h"
#import "TransformVideoViewController.h"
#import "UINavigationController+Rotation.h"

@interface MainTableViewController () {
    BOOL _shouldAutoRotate;
}

@end

@implementation MainTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        UIDeviceOrientation orientation=[[UIDevice currentDevice]orientation];
        
        if (orientation != UIDeviceOrientationPortrait) {
            _shouldAutoRotate = YES;
            int val = UIDeviceOrientationPortrait;
            [invocation setArgument:&val atIndex:2];
            [invocation invoke];
            _shouldAutoRotate = NO;
        }
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_idenitfier" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"View Transform (Wrong Solution)";
    } else {
        cell.textLabel.text = @"Device Orientation (Better)";
    }
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TransformVideoViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"view_transform_vc"];
        [self.navigationController pushViewController:vc animated:YES];

    } else {
        VideoViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"device_orientation_vc"];
        [self.navigationController pushViewController:vc animated:YES];

    }
}

- (BOOL)shouldAutorotate {
    return _shouldAutoRotate;
}

@end
