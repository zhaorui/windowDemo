//
//  main.m
//  app
//
//  Created by 赵睿 on 28/3/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TestWindow : NSWindow

@end

@implementation TestWindow

- (void)close{
    [[NSApplication sharedApplication] stopModal];
    [super close];
}

@end

int main(int argc, const char * argv[]) {
//    TestWindow *window = [[TestWindow alloc] initWithContentRect:NSMakeRect(0, 0, 200, 200)
//                                                     styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable
//                                                       backing:NSBackingStoreBuffered
//                                                         defer:NO];
//    
//    NSLog(@"ref count: %lu", (unsigned long)[window retainCount]);
//    [NSApp runModalForWindow: window];
//    
//    [window release];
//    [window release];
//    [window release];
//    [window release];
//    NSLog(@"ref count: %lu", (unsigned long)[window retainCount]);
    
    return NSApplicationMain(argc, argv);
}
