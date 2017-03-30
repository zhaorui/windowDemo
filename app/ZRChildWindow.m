//
//  ZRChildWindow.m
//  app
//
//  Created by 赵睿 on 30/3/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "ZRChildWindow.h"

@implementation ZRChildWindow

-(void)close {
    
    //T̶O̶D̶O̶:(zhaorui) is it necessary to remove itself?
    //ANSWER: No need to remove child window, when it's closed, it would be auto-removed by parent window
    //[[self parentWindow] removeChildWindow:self];
    
    NSLog(@"\tZRChildWindow closed");
    NSLog(@"\tBefore close, ZRChildWindow retainCount: %ld", [self retainCount]);
    [super close];
    NSLog(@"\tAfter Close, ZRChildWindow retainCount: %ld", [self retainCount]);
}

-(void)dealloc {
    NSLog(@"ZRChildWindow dealloc");
    [super dealloc];
}

@end
