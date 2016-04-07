
//
//  SMAlphaImageSegment.m
//  testSegmentedControl
//
//  Created by 曹志宇 on 16/4/1.
//  Copyright © 2016年 www.caozhiyu. All rights reserved.
//

#import "SMAlphaImageSegment.h"

@implementation SMAlphaImageSegment

- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (nonnull instancetype)initWithMargin:(float)margin selectedAlpha:(float)selectedAlpha unselectedAlpha:(float)unselectedAlpha pressedAlpha:(float)pressedAlpha image:(UIImage * _Nullable)image
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.margin = margin;
        self.selectedAlpha = selectedAlpha;
        self.unselectedAlpha = unselectedAlpha;
        self.pressedAlpha = pressedAlpha;
        self.animationDuration = 0.5;
        _imageView = [[UIImageView alloc] init];
        self.imageView.image = image;
        [self setupUIElements];
    }
    return self;
}

- (void)orientationChangedTo:(SegmentOrganiseMode)mode
{
    self.vertical = mode == SegmentOrganiseVertical;
}

- (void)setupUIElements
{
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.imageView];
}

- (void)resetContentFrame
{
    float margin = self.vertical ? (self.margin * 1.5) : self.margin;
    CGRect imageViewFrame = CGRectMake(margin, margin, self.frame.size.width - margin*2, self.frame.size.height - margin*2);
    
    self.imageView.frame = imageViewFrame;
}

- (void)setSelected:(BOOL)selected inView:(SMBasicSegmentView * _Nonnull)view
{
    [super setSelected:selected inView:view];
    if (selected) {
        [self startAnimationToAlpha:self.selectedAlpha];
    } else {
        [self startAnimationToAlpha:self.unselectedAlpha];
    }
}

- (void)startAnimationToAlpha:(float)alpha
{
    [UIView animateWithDuration:self.animationDuration delay:0 usingSpringWithDamping: 0.8 initialSpringVelocity: 0.1 options:UIViewAnimationOptionCurveEaseOut |UIViewAnimationOptionBeginFromCurrentState animations:^(){
        self.imageView.alpha = alpha;
    }completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event
{
    [super touchesBegan:touches withEvent:event];
    if (!self.isSelected) {
        [self startAnimationToAlpha:self.pressedAlpha];
    }
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self resetContentFrame];
}

@end
