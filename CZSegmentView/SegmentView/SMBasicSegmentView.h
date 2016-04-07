//
//  SMBasicSegmentView.h
//  testSegmentedControl
//
//  Created by 曹志宇 on 16/4/1.
//  Copyright © 2016年 www.caozhiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMBasicSegment.h"
@class SMBasicSegment;


typedef NS_ENUM(NSInteger, SegmentOrganiseMode) {
    SegmentOrganiseHorizontal = 0,
    SegmentOrganiseVertical = 1
};

@protocol SMBasicSegmentViewDelegate <NSObject>

@optional
- (void)didSelectSegmentAtIndex:(NSInteger)index;
@end

@interface SMBasicSegmentView : UIView
@property (nonatomic, copy) NSMutableArray<SMBasicSegment *> *segments;
@property (nonatomic, readonly) NSInteger indexOfSelectedSegment;
@property (nonatomic, readonly) NSInteger numberOfSegments;
@property (nonatomic) BOOL vertical;
@property (nonatomic, strong) UIColor *separatorColour;
@property (nonatomic) float separatorWidth;
@property (nonatomic, weak,) id <SMBasicSegmentViewDelegate> delegate;
- (void)layoutSubviews;
- (void)updateFrameForSegments;
- (void)drawSeparatorWithContext:(CGContextRef)context;
- (void)drawRect:(CGRect)rect;
- (void)selectSegmentAtIndex:(NSInteger)index;
- (void)deselectSegment;
- (void)addSegment:(SMBasicSegment *)segment;
- (instancetype)initWithFrame:(CGRect)frame;
@end
