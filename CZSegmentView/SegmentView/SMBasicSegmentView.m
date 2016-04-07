//
//  SMBasicSegmentView.m
//  testSegmentedControl
//
//  Created by 曹志宇 on 16/4/1.
//  Copyright © 2016年 www.caozhiyu. All rights reserved.
//

#import "SMBasicSegmentView.h"

@implementation SMBasicSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _indexOfSelectedSegment = NSNotFound;
        _segments = [[NSMutableArray<SMBasicSegment *> alloc] init];
        self.separatorColour = [UIColor lightGrayColor];
        self.separatorWidth = 1.0;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self updateFrameForSegments];
}

- (void)updateFrameForSegments
{
    if (0 == self.segments.count) {
        return;
    }
    
    NSUInteger count = self.segments.count;
    if (count > 1) {
        if (self.vertical == false) {
            float segmentWidth = (self.frame.size.width - self.separatorWidth*(count-1)) / count;
            float originX = 0.0;
            for (SMBasicSegment *segment in self.segments) {
                segment.frame = CGRectMake(originX, 0.0, segmentWidth, self.frame.size.height);
                originX += segmentWidth + self.separatorWidth;
            }
        } else {
            float segmentHeight = (self.frame.size.height - self.separatorWidth*(float)(count-1)) / (float)(count);
            float originY = 0.0;
            for (SMBasicSegment *segment in self.segments) {
                segment.frame = CGRectMake(0.0, originY, self.frame.size.width, segmentHeight);
            }
        }
    } else {
        SMBasicSegment *segment = [self.segments objectAtIndex:0];
        segment.frame = CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height);
    }
    [self setNeedsDisplay];
}

- (void)drawSeparatorWithContext:(CGContextRef _Nonnull)context
{
    CGContextSaveGState(context);
    if (self.segments.count > 1) {
        CGMutablePathRef path = CGPathCreateMutable();
        if (!self.vertical) {
            float originX = self.segments[0].frame.size.width + self.separatorWidth/2.0;
            for (int index = 1; index < self.segments.count; index++) {
                CGPathMoveToPoint(path, nil, originX, 0.0);
                CGPathAddLineToPoint(path, nil, originX, self.frame.size.height);
                SMBasicSegment *segment = [self.segments objectAtIndex:0];
                originX = originX + segment.frame.size.width + self.separatorWidth;
                
            }
        } else {
            SMBasicSegment *segment = [self.segments objectAtIndex:0];
            float originY = segment.frame.size.height + self.separatorWidth/2.0;
            for (int index = 1; index < self.segments.count; index++) {
                CGPathMoveToPoint(path, nil, 0.0, originY);
                CGPathAddLineToPoint(path, nil, self.frame.size.width, originY);
                originY += self.segments[index].frame.size.height + self.separatorWidth;
            }
        }
        CGContextAddPath(context, path);
        CGContextSetStrokeColorWithColor(context, self.separatorColour.CGColor);
        CGContextSetLineWidth(context, self.separatorWidth);
        CGContextDrawPath(context, kCGPathStroke);
    }
    CGContextRestoreGState(context);
    
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawSeparatorWithContext:context];
}

- (void)selectSegmentAtIndex:(NSInteger)index
{
    if (self.indexOfSelectedSegment != NSNotFound) {
        SMBasicSegment *previousSelectedSegment = self.segments[self.indexOfSelectedSegment];
        [previousSelectedSegment setSelected:NO inView:self];
    }
    _indexOfSelectedSegment = index;
    SMBasicSegment *segment = [self.segments objectAtIndex:index];
    [segment setSelected:YES inView:self];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectSegmentAtIndex:)]) {
        [self.delegate didSelectSegmentAtIndex:index];
    }
}

- (void)deselectSegment
{
    if (self.indexOfSelectedSegment != NSNotFound) {
        SMBasicSegment *segment = self.segments[self.indexOfSelectedSegment];
        [segment setSelected:NO inView:self];
        _indexOfSelectedSegment = NSNotFound;
    }
}

- (void)addSegment:(SMBasicSegment *)segment
{
    segment.index = self.segments.count;
    [self.segments addObject:segment];
    segment.segmentView = self;
    [self updateFrameForSegments];
    [self addSubview:segment];
}

- (void)orientationChangedTo:(SegmentOrganiseMode)mode
{
    [self setNeedsDisplay];
}

- (void)setSegments:(NSArray<SMBasicSegment *> *)segments
{
    int i = 0;
    for (SMBasicSegment *segment in segments) {
        segment.index = i;
        i++;
        segment.segmentView = self;
        [self addSubview:segment];
    }
    [self updateFrameForSegments];
}

- (void)setVertical:(BOOL)vertical
{
    _vertical = vertical;
    SegmentOrganiseMode mode = vertical? SegmentOrganiseVertical : SegmentOrganiseHorizontal;
    [self orientationChangedTo:mode];
}

- (NSInteger)numberOfSegments
{
    return self.segments.count;
}

- (void)setSeparatorColour:(UIColor *)separatorColour
{
    _separatorColour = separatorColour;
    [self setNeedsDisplay];
}

- (void)setSeparatorWidth:(float)separatorWidth
{
    _separatorWidth = separatorWidth;
    [self updateFrameForSegments];
}

@end
