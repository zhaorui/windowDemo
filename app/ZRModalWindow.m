//
//  ZRWindow.m
//  app
//
//  Created by 赵睿 on 28/3/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "ZRModalWindow.h"

@implementation ZRModalWindow

-(instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag {
    if (self = [super initWithContentRect:contentRect styleMask:style backing:bufferingType defer:flag]) {
        NSLog(@"\tzrmodalwin retain_count: %ld",[self retainCount]);
        [self setReleasedWhenClosed:NO];
        NSLog(@"\tzrmodalwin retain_count: %ld",[self retainCount]);
        [NSApp runModalForWindow:self];
        NSLog(@"\tzrmodalwin retain_count: %ld",[self retainCount]);
        NSLog(@"\tModal Window quit...");
    }
    return self;
}

-(void)close {
    NSLog(@"\tZRModalWindow close");
    NSLog(@"\tzrmodalwin retain_count: %ld",[self retainCount]);
    [super close];
    NSLog(@"\tzrmodalwin retain_count: %ld",[self retainCount]);
    [NSApp stopModal];
    NSLog(@"\tzrmodalwin retain_count: %ld",[self retainCount]);
}

@end
