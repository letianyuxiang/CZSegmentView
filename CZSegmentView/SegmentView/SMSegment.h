//
//  SMSegment.h
//  testSegmentedControl
//
//  Created by 曹志宇 on 16/4/1.
//  Copyright © 2016年 www.caozhiyu. All rights reserved.
//

#import "SMBasicSegment.h"

@interface SMSegment : SMBasicSegment
@property (nonatomic) float verticalMargin;
@property (nonatomic, strong) UIColor * _Nonnull onSelectionColour;
@property (nonatomic, strong) UIColor * _Nonnull offSelectionColour;
@property (nonatomic, copy)   NSString * _Nullable title;
@property (nonatomic, strong) UIColor * _Nonnull onSelectionTextColour;
@property (nonatomic, strong) UIColor * _Nonnull offSelectionTextColour;
@property (nonatomic, strong) UIFont * _Nonnull titleFont;
@property (nonatomic, strong) UIImage * _Nullable onSelectionImage;
@property (nonatomic, strong) UIImage * _Nullable offSelectionImage;
- (nonnull instancetype)initWithVerticalMargin:(float)verticalMargin onSelectionColour:(UIColor * _Nonnull)onSelectionColour offSelectionColour:(UIColor * _Nonnull)offSelectionColour onSelectionTextColour:(UIColor * _Nonnull)onSelectionTextColour offSelectionTextColour:(UIColor * _Nonnull)offSelectionTextColour titleFont:(UIFont * _Nonnull)titleFont;
- (void)setupUIElements;
- (void)setSelected:(BOOL)selected inView:(SMBasicSegmentView * _Nonnull)view;
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
@end
