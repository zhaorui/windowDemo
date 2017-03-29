//
//  ViewController.m
//  app
//
//  Created by 赵睿 on 28/3/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "ViewController.h"
#import "ZRWindow.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)createModalWindow:(NSButton *)sender {
    
    //autorelease here would get problem, since by default window is released when closed!
    ZRWindow* window = [[[ZRWindow alloc] initWithContentRect:NSMakeRect(200, 200, 200, 200)
                                                   styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable
                                                     backing:NSBackingStoreBuffered defer:NO] autorelease];
    
    [window setReleasedWhenClosed:YES];
    [NSApp runModalForWindow:window];
    NSLog(@"Modal Window quit...");
}

- (IBAction)createChildWindow:(NSButton *)sender {
    NSWindow* window = [[NSWindow alloc] initWithContentRect:NSMakeRect(200, 200, 200, 200)
                                                   styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable | NSWindowStyleMaskMiniaturizable
                                                     backing:NSBackingStoreBuffered defer:NO] ;
    [[[self view] window] addChildWindow:window ordered:NSWindowAbove];
    [window makeFirstResponder:window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterFullScreen) name:NSWindowWillEnterFullScreenNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(quitFullScreen) name:NSWindowWillExitFullScreenNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowResize) name:NSWindowDidResizeNotification object:nil];
}

-(void) enterFullScreen {
    NSRect screenRect = [[NSScreen mainScreen] frame];
    [[[[[self view] window] childWindows] firstObject] setFrame:screenRect display:TRUE];
    NSLog(@"full screen!!");
}

-(void) quitFullScreen {
    NSRect screenRect = [[NSScreen mainScreen] frame];
    [[[[[self view] window] childWindows] firstObject] setFrame:screenRect display:TRUE];
    NSLog(@"full screen!!");
}

-(void) windowResize {
    //NSLog(@"%@", NSStringFromRect([[[self view] window] frame]));
    NSRect parent_rect = [[[self view] window] frame];
    [[[[[self view] window] childWindows] firstObject] setFrame:CGRectOffset(parent_rect, 200, -400) display:YES];
    
}

@end
