

#import "ColorView.h"
#import "OverlayWindow.h"

@implementation ColorView

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    fillColor = [NSColor clearColor];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    fillColor=[NSColor clearColor];
    id view=[super initWithCoder:aDecoder];    
    return view;
}

- (void)setColor:(NSColor *)color
{
    fillColor=color;
}

- (void)drawRect:(NSRect)rect
{
    [fillColor set];
    
    NSRectFill(rect);
}

@end
