
#import <Cocoa/Cocoa.h>

@interface ColorView : NSView
{
    NSColor *fillColor;
}

- (void)setColor:(NSColor *)color;

@end
