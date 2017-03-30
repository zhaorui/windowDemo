//
//  ViewController.m
//  app
//
//  Created by 赵睿 on 28/3/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

#import "ViewController.h"
#import "ZRModalWindow.h"
#import "ZRChildWindow.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.window.releasedWhenClosed = NO;
    NSLog(@"viewDidLoad, MainWindow retain count: %ld", [self.view.window retainCount]);
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)createModalWindow:(NSButton *)sender {
    
    ZRModalWindow *window = [ZRModalWindow alloc];
    NSLog(@"zrmodalwin retain_count: %ld", [window retainCount]);
    [window initWithContentRect:NSMakeRect(200, 200, 200, 200)
                      styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable
                        backing:NSBackingStoreBuffered defer:NO];
    NSLog(@"zrmodalwin retain_count: %ld", [window retainCount]);
    //By default we don't need to release window, since it's release when closed
    //However we use autorelease here, because in |ZRModalWindow| we set |releasedWhenClosed| to false
    [window autorelease];
    NSLog(@"zrmodalwin retain_count: %ld", [window retainCount]);
    
}

- (IBAction)createChildWindow:(NSButton *)sender {
    
    //[self.view.window setReleasedWhenClosed:YES];
    
    ZRChildWindow* window = [[ZRChildWindow alloc] initWithContentRect:NSMakeRect(200, 200, 200, 200)
                                                   styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable | NSWindowStyleMaskMiniaturizable
                                                     backing:NSBackingStoreBuffered defer:NO] ;
    
    NSLog(@"Before Create ChildWindow, MainWindow retain count: %ld", [self.view.window retainCount]);
    NSLog(@"\tZRChildWindow retainCount: %ld", [window retainCount]);
    [[[self view] window] addChildWindow:window ordered:NSWindowAbove];
    NSLog(@"\tZRChildWindow retainCount: %ld", [window retainCount]);
    NSLog(@"After Create ChildWindow, MainWindow retain count: %ld", [self.view.window retainCount]);
    
    //[window makeFirstResponder:window];
    
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterFullScreen) name:NSWindowWillEnterFullScreenNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(quitFullScreen) name:NSWindowWillExitFullScreenNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowResize) name:NSWindowDidResizeNotification object:nil];
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

- (IBAction)count:(NSButton *)sender {
    NSLog(@"%ld", self.view.window.childWindows.count);
}

@end
