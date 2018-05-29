//
//  UIView+HandyLayouts.h
//  Demo
//
//  Created by Gaojin Hsu on 2018/5/21.
//  Copyright © 2018 gaojinhsu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height

#define SCREEN_WITHOUT_STATUS_HEIGHT (SCREEN_HEIGHT - [[UIApplication sharedApplication] statusBarFrame].size.height)

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface UIView (HandyLayouts)

- (CGFloat)gj_x;
- (CGFloat)gj_y;

- (CGFloat)gj_width;
- (CGFloat)gj_height;

- (CGSize)gj_size;
- (CGPoint)gj_origin;

- (CGFloat)gj_centerX;
- (CGFloat)gj_centerY;

- (void)setGj_x:(CGFloat)x;
- (void)setGj_y:(CGFloat)y;

- (void)setGj_width:(CGFloat)width;
- (void)setGj_height:(CGFloat)height;

- (void)setGj_size:(CGSize)size;
- (void)setGj_origin:(CGPoint)point;

- (void)setGj_centerX:(CGFloat)x;
- (void)setGj_centerY:(CGFloat)y;

- (UIView*)gj_topSuperView;
@end
