//
//  InputMonitor.m
//  InpuTataGlancE
//
//  Created by Can on 9/11/15.
//  Copyright © 2015 Can. All rights reserved.
//

#import "InputMonitor.h"
#import <Carbon/Carbon.h>

@implementation InputMonitor

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleInputSourceChange:) name:NSTextInputContextKeyboardSelectionDidChangeNotification object:nil];
    }
    return self;
}

- (void)handleInputSourceChange:(NSNotification*)note {
    NSLog(@"%@", note);

    TISInputSourceRef source = TISCopyCurrentKeyboardInputSource();
    if (!source) {
        NSLog(@"Failed to get input source name.");
    }
    NSLog(@"languages: %@",
          TISGetInputSourceProperty(source, kTISPropertyInputSourceLanguages));
    NSLog(@"localized name: %@",
          TISGetInputSourceProperty(source, kTISPropertyLocalizedName));
    NSString *inputSourceLang = CFBridgingRelease(TISGetInputSourceProperty(source, kTISPropertyInputSourceLanguages));
    if ([inputSourceLang isEqualToString:@"zh-Hans"]) {
        // asdf
    } else {
        //
    }
    CFRelease(source);
}

@end
