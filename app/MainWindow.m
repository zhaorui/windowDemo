//
//  MainWindow.m
//  app
//
//  Created by 赵睿 on 30/3/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "MainWindow.h"

@implementation MainWindow

-(void)performClose:(id)sender {
    NSLog(@"MainWindow performClose: %@", sender);
    [super performClose:sender];
}

-(void)close {
    NSLog(@"MainWindow close");
    NSLog(@"Before close,  MainWindow retain count: %ld", [self retainCount]);
    
    //if main window close, we should close all its sub windows
    for (NSWindow* win in [self childWindows]) {
        [self removeChildWindow:win];
        [win close];
    }
    
    [super close];
    NSLog(@"After close, MainWindow retain count: %ld", [self retainCount]);
    
}

- (void)hide {
    NSLog(@"MainWindow hide");
}

-(void)dealloc {
    NSLog(@"MainWindow dealloc");
    [super dealloc];
}


@end
