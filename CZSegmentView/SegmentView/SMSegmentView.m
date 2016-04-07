//
//  SMSegmentView.m
//  testSegmentedControl
//
//  Created by 曹志宇 on 16/4/1.
//  Copyright © 2016年 www.caozhiyu. All rights reserved.
//

#import "SMSegmentView.h"

NSString *const keyContentVerticalMargin = @"VerticalMargin";

// The colour when the segment is under selected/unselected
NSString *const keySegmentOnSelectionColour = @"OnSelectionBackgroundColour";
NSString *const keySegmentOffSelectionColour = @"OffSelectionBackgroundColour";

// The colour of the text in the segment for the segment is under selected/unselected
NSString *const keySegmentOnSelectionTextColour = @"OnSelectionTextColour";
NSString *const keySegmentOffSelectionTextColour = @"OffSelectionTextColour";

// The font of the text in the segment
NSString *const keySegmentTitleFont = @"TitleFont";

@implementation SMSegmentView

- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (nonnull instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = true;
    }
    return self;
}

- (nonnull instancetype)initWithFrame:(CGRect)frame separatorColour:(UIColor * _Nonnull)separatorColour separatorWidth:(float)separatorWidth segmentProperties:(NSDictionary<NSString *, id> * _Nullable)segmentProperties
{
    self = [super initWithFrame:frame];
    if (self) {
        self.separatorColour = separatorColour;
        self.separatorWidth = separatorWidth;
        id segmentVerticalMargin = [segmentProperties objectForKey:keyContentVerticalMargin];
        if (segmentVerticalMargin) {
            self.segmentVerticalMargin = [segmentVerticalMargin floatValue];
        } else {
            self.segmentVerticalMargin = 5.0;
        }
        UIColor *onSelectionColour = [segmentProperties objectForKey:keySegmentOnSelectionColour];
        if (onSelectionColour) {
            self.segmentOnSelectionColour = onSelectionColour;
        } else {
            self.segmentOnSelectionColour = [UIColor darkGrayColor];
        }
        UIColor *offSelectionColour = [segmentProperties objectForKey:keySegmentOffSelectionColour];
        if (offSelectionColour) {
            self.segmentOffSelectionColour = offSelectionColour;
        } else {
            self.segmentOffSelectionColour = [UIColor whiteColor];
        }
        UIColor *onSelectionTextColour = [segmentProperties objectForKey:keySegmentOnSelectionTextColour];
        if (onSelectionTextColour) {
            self.segmentOnSelectionTextColour = onSelectionTextColour;
        } else {
            self.segmentOnSelectionTextColour = [UIColor whiteColor];
        }
        UIColor *offSelectionTextColour = [segmentProperties objectForKey:keySegmentOffSelectionTextColour];
        if (offSelectionTextColour) {
            self.segmentOffSelectionTextColour = offSelectionTextColour;
        } else {
            self.segmentOffSelectionTextColour = [UIColor darkGrayColor];
        }
        UIFont *titleFont = [segmentProperties objectForKey:keySegmentTitleFont];
        if (titleFont) {
            self.segmentTitleFont = titleFont;
        } else {
            self.segmentTitleFont = [UIFont systemFontOfSize:17.0];
        }
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = true;
    }
    return self;
}

- (SMSegment * _Nonnull)addSegmentWithTitle:(NSString * _Nullable)title onSelectionImage:(UIImage * _Nullable)onSelectionImage offSelectionImage:(UIImage * _Nullable)offSelectionImage
{
    SMSegment *segment = [[SMSegment alloc] initWithVerticalMargin:self.segmentVerticalMargin onSelectionColour:self.segmentOnSelectionColour offSelectionColour:self.segmentOffSelectionColour onSelectionTextColour:self.segmentOnSelectionTextColour offSelectionTextColour:self.segmentOffSelectionTextColour titleFont:self.segmentTitleFont];
    
    segment.title = title;
    segment.onSelectionImage = onSelectionImage;
    segment.offSelectionImage = offSelectionImage;
    
    [self addSegment:segment];
    return segment;
}

- (void)setSegmentVerticalMargin:(float)segmentVerticalMargin
{
    _segmentVerticalMargin = segmentVerticalMargin;
    for (SMSegment *segment in self.segments) {
        segment.verticalMargin = self.segmentVerticalMargin;
    }
}

- (void)setSegmentOnSelectionColour:(UIColor *)segmentOnSelectionColour
{
    _segmentOnSelectionColour = segmentOnSelectionColour;
    for (SMSegment *segment in self.segments) {
        segment.offSelectionColour = self.segmentOffSelectionColour;
    }
}

- (void)setSegmentOnSelectionTextColour:(UIColor *)segmentOnSelectionTextColour
{
    _segmentOnSelectionTextColour = segmentOnSelectionTextColour;
    for (SMSegment *segment in self.segments) {
        segment.onSelectionTextColour = self.segmentOnSelectionTextColour;
    }
}

- (void)setSegmentOffSelectionTextColour:(UIColor *)segmentOffSelectionTextColour
{
    _segmentOffSelectionTextColour = segmentOffSelectionTextColour;
    for (SMSegment *segment in self.segments) {
        segment.offSelectionTextColour = self.segmentOffSelectionTextColour;
    }
}

- (void)setSegmentTitleFont:(UIFont *)segmentTitleFont
{
    _segmentTitleFont = segmentTitleFont;
    for (SMSegment *segment in self.segments) {
        segment.titleFont = segmentTitleFont;
    }
}


@end
