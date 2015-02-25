
#import "OverlayWindow.h"
#import "ColorView.h"

@implementation OverlayWindow

- (void)explode {
  
  NSImageView* image = [[NSImageView alloc] initWithFrame:NSMakeRect(rand() % (int)[self.contentView frame].size.width, rand() % (int)[self.contentView frame].size.height, 200.0f, 200.0f)];
  [image setImage:[NSImage imageNamed:@"explosion.gif"]];
  [self.contentView addSubview:image];
  [image performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1.8];
}

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:bufferingType defer:flag];
    
    if ( self ) {
        [self setOpaque:NO];
        [self setHasShadow:YES];
        [self setLevel:NSFloatingWindowLevel];
    }
    return self;
}

- (BOOL)canBecomeKeyWindow
{
    return YES;
}

@end
