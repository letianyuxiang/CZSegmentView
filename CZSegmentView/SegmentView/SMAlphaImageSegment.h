//
//  SMAlphaImageSegment.h
//  testSegmentedControl
//
//  Created by 曹志宇 on 16/4/1.
//  Copyright © 2016年 www.caozhiyu. All rights reserved.
//

#import "SMBasicSegment.h"

@interface SMAlphaImageSegment : SMBasicSegment
@property (nonatomic) CGRect frame;
@property (nonatomic) float margin;
@property (nonatomic) BOOL vertical;
@property (nonatomic) NSTimeInterval animationDuration;
@property (nonatomic) float selectedAlpha;
@property (nonatomic) float unselectedAlpha;
@property (nonatomic) float pressedAlpha;
@property (nonatomic, strong) UIImageView * _Nonnull imageView;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder;
- (nonnull instancetype)initWithMargin:(float)margin selectedAlpha:(float)selectedAlpha unselectedAlpha:(float)unselectedAlpha pressedAlpha:(float)pressedAlpha image:(UIImage * _Nullable)image;
- (void)setupUIElements;
- (void)resetContentFrame;
- (void)setSelected:(BOOL)selected inView:(SMBasicSegmentView * _Nonnull)view;
- (void)startAnimationToAlpha:(float)alpha;
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;

@end
