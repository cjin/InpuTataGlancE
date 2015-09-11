//
//  AppDelegate.m
//  InpuTataGlancE
//
//  Created by Can on 9/11/15.
//  Copyright © 2015 Can. All rights reserved.
//

#import "AppDelegate.h"
#import <Carbon/Carbon.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

- (void)handleInputSourceChange:(NSNotification*)note;
- (void)checkInputSource;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleInputSourceChange:) name:NSTextInputContextKeyboardSelectionDidChangeNotification object:nil];
    
    [self.window setOpaque:NO];
    NSColor *semiTransparent = [NSColor colorWithDeviceRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    self.window.backgroundColor = semiTransparent;
    self.window.styleMask = NSBorderlessWindowMask;
    self.window.acceptsMouseMovedEvents = NO;
    self.window.level = NSFloatingWindowLevel;
    self.window.hasShadow = NO;
    NSPoint pos;
    pos.x = [[NSScreen mainScreen] visibleFrame].origin.x + [[NSScreen mainScreen] visibleFrame].size.width - [self.window frame].size.width - 20;
    pos.y = [[NSScreen mainScreen] visibleFrame].origin.y + [[NSScreen mainScreen] visibleFrame].size.height - [self.window frame].size.height;
    [self.window setFrameOrigin:pos];
    [self.window setLevel:kCGMainMenuWindowLevel-1];
    [self.window setCollectionBehavior:NSWindowCollectionBehaviorStationary|NSWindowCollectionBehaviorCanJoinAllSpaces|NSWindowCollectionBehaviorFullScreenAuxiliary];
    
    [self checkInputSource];
}


- (void)handleInputSourceChange:(NSNotification*)note {
    NSLog(@"%@", note);
    
    [self checkInputSource];
}

- (void)checkInputSource {
    TISInputSourceRef source = TISCopyCurrentKeyboardInputSource();
    if (!source) {
        NSLog(@"Failed to get input source name.");
    }
    NSArray *inputSourceLang = (__bridge NSArray *)(TISGetInputSourceProperty(source, kTISPropertyInputSourceLanguages));
    if ([inputSourceLang containsObject:@"zh-Hans"]) {
        [self.window orderFront:self];
    } else {
        [self.window orderOut:self];
    }
    CFRelease(source);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
