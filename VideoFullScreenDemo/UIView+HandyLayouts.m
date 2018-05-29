//
//  UIView+HandyLayouts.m
//  Demo
//
//  Created by Gaojin Hsu on 2018/5/21.
//  Copyright © 2018 gaojinhsu. All rights reserved.
//

#import "UIView+HandyLayouts.h"

@implementation UIView (HandyLayouts)
- (CGFloat)gj_x {
    return self.frame.origin.x;
}

- (CGFloat)gj_y; {
    return self.frame.origin.y;
}

- (CGFloat)gj_height {
    return self.frame.size.height;
}

- (CGFloat)gj_width {
    return self.frame.size.width;
}

- (CGSize)gj_size {
    return self.frame.size;
}

- (CGPoint)gj_origin {
    return self.frame.origin;
}

- (CGFloat)gj_centerX {
    return self.center.x;
}

- (CGFloat)gj_centerY {
    return self.center.y;
}

- (void)setGj_x:(CGFloat)x {
    CGRect frame = CGRectMake(x, self.gj_y, self.gj_width, self.gj_height);
    self.frame = frame;
}

- (void)setGj_y:(CGFloat)y {
    CGRect frame = CGRectMake(self.gj_x, y, self.gj_width, self.gj_height);
    self.frame = frame;
}

- (void)setGj_width:(CGFloat)width {
    CGRect frame = CGRectMake(self.gj_x, self.gj_y, width, self.gj_height);
    self.frame = frame;
}

- (void)setGj_height:(CGFloat)height {
    CGRect frame = CGRectMake(self.gj_x, self.gj_y, self.gj_width, height);
    self.frame = frame;
}

- (void)setGj_size:(CGSize)size {
    CGRect frame = CGRectMake(self.gj_x, self.gj_y, size.width, size.height);
    self.frame = frame;
}

- (void)setGj_origin:(CGPoint)point {
    CGRect frame = CGRectMake(point.x, point.y, self.gj_width, self.gj_height);
    self.frame = frame;
}

- (void)setGj_centerX:(CGFloat)x {
    CGPoint point = CGPointMake(x, self.gj_centerY);
    self.center = point;
}

- (void)setGj_centerY:(CGFloat)y {
    CGPoint point = CGPointMake(self.gj_centerX, y);
    self.center = point;
}

- (UIView*)gj_topSuperView {
    UIView *topSuperView = self.superview;
    if (!topSuperView) {
        return self;
    }
    while (topSuperView.superview) {
        topSuperView = topSuperView.superview;
    }
    return topSuperView;
}
@end
