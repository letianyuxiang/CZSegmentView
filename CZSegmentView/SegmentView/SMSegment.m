//
//  SMSegment.m
//  testSegmentedControl
//
//  Created by 曹志宇 on 16/4/1.
//  Copyright © 2016年 www.caozhiyu. All rights reserved.
//

#import "SMSegment.h"

@interface SMSegment ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) double labelWidth;

@end

@implementation SMSegment

- (nonnull instancetype)initWithVerticalMargin:(float)verticalMargin onSelectionColour:(UIColor * _Nonnull)onSelectionColour offSelectionColour:(UIColor * _Nonnull)offSelectionColour onSelectionTextColour:(UIColor * _Nonnull)onSelectionTextColour offSelectionTextColour:(UIColor * _Nonnull)offSelectionTextColour titleFont:(UIFont * _Nonnull)titleFont
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _label = [[UILabel alloc] init];
        _imageView = [[UIImageView alloc] init];
        _onSelectionImage = [[UIImage alloc] init];
        _offSelectionImage = [[UIImage alloc] init];
        self.verticalMargin = verticalMargin;
        self.onSelectionColour = onSelectionColour;
        self.offSelectionColour = offSelectionColour;
        self.onSelectionTextColour = onSelectionTextColour;
        self.offSelectionTextColour = offSelectionTextColour;
        self.titleFont = titleFont;
        [self setupUIElements];
    }
    return self;
}

- (void)setupUIElements
{
    self.backgroundColor = self.offSelectionColour;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.imageView];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = self.titleFont;
    self.label.textColor = self.offSelectionTextColour;
    [self addSubview:self.label];
}

- (void)setSelected:(BOOL)selected inView:(SMBasicSegmentView * _Nonnull)view
{
    [super setSelected:selected inView:view];
    if (selected) {
        self.backgroundColor = self.onSelectionColour;
        self.label.textColor = self.onSelectionTextColour;
        self.imageView.image = self.onSelectionImage;
    } else {
        self.backgroundColor = self.offSelectionColour;
        self.label.textColor = self.offSelectionTextColour;
        self.imageView.image = self.offSelectionImage;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event
{
    [super touchesBegan:touches withEvent:event];
    if (!self.isSelected) {
        self.backgroundColor = [self willOnSelectionColour];
    }
}

- (void)resetContentFrame
{
    float distanceBetween = 0.0;
    CGRect imageViewFrame = CGRectMake(0.0, self.verticalMargin, 0.0, self.frame.size.height - self.verticalMargin*2);
    if (self.onSelectionImage != nil || self.offSelectionImage != nil) {
        imageViewFrame.size.width = self.frame.size.height - self.verticalMargin*2;
        distanceBetween = 5.0;
    }
    
    if (self.labelWidth == 0.0) {
        imageViewFrame.origin.x = fmax((self.frame.size.width - imageViewFrame.size.width) / 2.0, 0.0);
    } else {
        imageViewFrame.origin.x = fmax((self.frame.size.width - imageViewFrame.size.width - self.labelWidth) / 2.0 - distanceBetween, 0.0);
    }
    self.imageView.frame = imageViewFrame;
    
    self.label.frame = CGRectMake(imageViewFrame.origin.x + imageViewFrame.size.width + distanceBetween, self.verticalMargin, self.labelWidth, self.frame.size.height - self.verticalMargin * 2);
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self resetContentFrame];
}

- (void)setVerticalMargin:(float)verticalMargin
{
    _verticalMargin = verticalMargin;
    [self resetContentFrame];
}

- (void)setOnSelectionColour:(UIColor *)onSelectionColour
{
    _onSelectionColour = onSelectionColour;
    if (self.isSelected) {
        self.backgroundColor = self.onSelectionColour;
    }
}

- (void)setOffSelectionColour:(UIColor *)offSelectionColour
{
    _offSelectionColour = offSelectionColour;
    if (!self.isSelected) {
        self.backgroundColor = self.offSelectionColour;
    }
}

- (UIColor *)willOnSelectionColour
{
    CGFloat hue = 0.0;
    CGFloat saturation = 0.0;
    CGFloat brightness = 0.0;
    CGFloat alpha = 0.0;
    [self.onSelectionColour getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.label.text = title;
    self.labelWidth = [title boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : self.label.font} context:nil].size.width;
    [self resetContentFrame];
}

- (void)setOnSelectionTextColour:(UIColor *)onSelectionTextColour
{
    _onSelectionTextColour = onSelectionTextColour;
    if (self.isSelected) {
        self.label.textColor = self.onSelectionTextColour;
    }
}

- (void)setOffSelectionTextColour:(UIColor *)offSelectionTextColour
{
    _offSelectionTextColour = offSelectionTextColour;
    if (!self.isSelected) {
        self.label.textColor = self.offSelectionTextColour;
    }
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.label.font = titleFont;
    self.labelWidth = [self.label.text boundingRectWithSize:CGSizeMake(self.frame.size.width + 1.0, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : self.label.font} context:nil].size.width;
    [self resetContentFrame];
}

- (void)setOnSelectionImage:(UIImage *)onSelectionImage
{
    _onSelectionImage = onSelectionImage;
    if (self.onSelectionImage != nil) {
        [self resetContentFrame];
    }
    if (self.isSelected) {
        self.imageView.image = self.onSelectionImage;
    }
}

- (void)setOffSelectionImage:(UIImage *)offSelectionImage
{
    _offSelectionImage = offSelectionImage;
    if (self.offSelectionImage != nil) {
        [self resetContentFrame];
    }
    if (!self.isSelected) {
        self.imageView.image = self.offSelectionImage;
    }
}



@end
