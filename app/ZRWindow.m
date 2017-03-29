//
//  ZRWindow.m
//  app
//
//  Created by 赵睿 on 28/3/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "ZRWindow.h"

@implementation ZRWindow

-(void)close {
    [super close];
    [NSApp stopModal];
}

@end
