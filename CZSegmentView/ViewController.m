//
//  ViewController.m
//  CZSegmentView
//
//  Created by 曹志宇 on 16/4/6.
//  Copyright © 2016年 www.czy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0], keySegmentTitleFont, [UIColor blueColor], keySegmentOnSelectionColour, [UIColor whiteColor], keySegmentOffSelectionColour, [UIColor whiteColor], keySegmentOnSelectionTextColour, [UIColor blueColor], keySegmentOffSelectionTextColour, [[NSNumber alloc]initWithFloat:17.0f], @"VerticalMargin", nil];
    
    
    SMSegmentView *segmentView = [[SMSegmentView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50) separatorColour:[UIColor clearColor] separatorWidth:0.0 segmentProperties:dictionary];
    [segmentView addSegmentWithTitle:@"全部" onSelectionImage:nil offSelectionImage:nil];
    [segmentView addSegmentWithTitle:@"男" onSelectionImage:[UIImage imageNamed:@"male"] offSelectionImage:[UIImage imageNamed:@"male"]];
    [segmentView addSegmentWithTitle:@"女" onSelectionImage:[UIImage imageNamed:@"female"] offSelectionImage:[UIImage imageNamed:@"female"]];
    segmentView.delegate = self;
    [self.view addSubview:segmentView];
    self.view.backgroundColor = [UIColor darkGrayColor];
    [segmentView selectSegmentAtIndex:0];

}

- (void)didSelectSegmentAtIndex:(NSInteger)index
{
    NSLog(@"%ld", (long)index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
