//
//  SMBasicSegment.m
//  testSegmentedControl
//
//  Created by 曹志宇 on 16/4/1.
//  Copyright © 2016年 www.caozhiyu. All rights reserved.
//

#import "SMBasicSegment.h"

@implementation SMBasicSegment

- (void)setSelected:(BOOL)selected inView:(SMBasicSegmentView *)view
{
    _isSelected = selected;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    if (!self.isSelected && self.segmentView){
        [self.segmentView selectSegmentAtIndex:self.index];
    }
}
@end
