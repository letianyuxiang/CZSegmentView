//
//  SMSegmentView.h
//  testSegmentedControl
//
//  Created by 曹志宇 on 16/4/1.
//  Copyright © 2016年 www.caozhiyu. All rights reserved.
//

#import "SMBasicSegmentView.h"
#import "SMSegment.h"

extern NSString *const keyContentVerticalMargin;

// The colour when the segment is under selected/unselected
extern NSString *const keySegmentOnSelectionColour;
extern NSString *const keySegmentOffSelectionColour;

// The colour of the text in the segment for the segment is under selected/unselected
extern NSString *const keySegmentOnSelectionTextColour;
extern NSString *const keySegmentOffSelectionTextColour;

// The font of the text in the segment
extern NSString *const keySegmentTitleFont;

@interface SMSegmentView : SMBasicSegmentView
@property (nonatomic) float segmentVerticalMargin;
@property (nonatomic, strong) UIColor * segmentOnSelectionColour;
@property (nonatomic, strong) UIColor * segmentOffSelectionColour;
@property (nonatomic, strong) UIColor * segmentOnSelectionTextColour;
@property (nonatomic, strong) UIColor * segmentOffSelectionTextColour;
@property (nonatomic, strong) UIFont * segmentTitleFont;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithFrame:(CGRect)frame separatorColour:(UIColor *)separatorColour separatorWidth:(float)separatorWidth segmentProperties:(NSDictionary<NSString *, id> *)segmentProperties;
- (SMSegment *)addSegmentWithTitle:(NSString *)title onSelectionImage:(UIImage *)onSelectionImage offSelectionImage:(UIImage *)offSelectionImage;
@end
