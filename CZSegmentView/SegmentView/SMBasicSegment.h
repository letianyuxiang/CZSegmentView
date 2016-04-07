//
//  SMBasicSegment.h
//  testSegmentedControl
//
//  Created by 曹志宇 on 16/4/1.
//  Copyright © 2016年 www.caozhiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMBasicSegmentView.h"
@class SMBasicSegmentView;

@interface SMBasicSegment : UIView
@property (nonatomic) NSInteger index;
@property (nonatomic, strong) SMBasicSegmentView *segmentView;
@property (nonatomic, readonly) BOOL isSelected;
- (void)setSelected:(BOOL)selected inView:(SMBasicSegmentView *)view;
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
@end
