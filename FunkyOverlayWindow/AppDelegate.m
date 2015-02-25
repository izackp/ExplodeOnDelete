//
//  AppDelegate.m
//  FunkyOverlayWindow
//
//  Created by Isaac Paul on 2/25/15.
//  Copyright (c) 2015 Apple, Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "OverlayWindow.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSMutableArray* windows;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  self.windows = [NSMutableArray new];
  for (id eachScreen in [NSScreen screens])
  {
    NSArray *tl;
    NSApplication *application = [NSApplication sharedApplication];
    [[NSBundle mainBundle] loadNibNamed:@"Window" owner:application topLevelObjects:&tl];
    for (id eachObj in tl)
    {
      if ([eachObj isKindOfClass:[NSWindow class]])
      {
          [eachObj setFrame:[eachScreen visibleFrame] display:true];
          [self.windows addObject:eachObj];
      }
    }
  }
}

- (void)explodeAllWindows {
  for (OverlayWindow* eachWindow in self.windows) {
    [eachWindow explode];
  }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tea
}

@end
