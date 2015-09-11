//
//  InputMonitor.h
//  InpuTataGlancE
//
//  Created by Can on 9/11/15.
//  Copyright © 2015 Can. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface InputMonitor : NSObject

- (instancetype)init;

- (void)handleInputSourceChange:(NSNotification*)note;

@end
