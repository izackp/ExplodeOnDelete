#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

CGEventRef myCGEventCallback(CGEventTapProxy proxy, CGEventType type, CGEventRef event, void *refcon);
CGEventRef myCGEventCallback(CGEventTapProxy proxy, CGEventType type, CGEventRef event, void *refcon)
{
  // Paranoid sanity check.
  if ((type != kCGEventKeyDown) && (type != kCGEventKeyUp))
    return event;
  
  // The incoming keycode
  CGKeyCode keycode = (CGKeyCode)CGEventGetIntegerValueField( event, kCGKeyboardEventKeycode);
  
  if (keycode == (CGKeyCode)0x33 && type == kCGEventKeyDown) {
    [(AppDelegate*)[[NSApplication sharedApplication] delegate] explodeAllWindows];
  }

  return event;
}

int main(int argc, char *argv[])
{
  
  CFMachPortRef      eventTap;
  CGEventMask        eventMask;
  CFRunLoopSourceRef runLoopSource;
  
  // Create an event tap. We are interested in key presses.
  eventMask = ((1 << kCGEventKeyDown) | (1 << kCGEventKeyUp));
  eventTap = CGEventTapCreate(kCGSessionEventTap, kCGHeadInsertEventTap, 0,
                              eventMask, myCGEventCallback, NULL);
  if (!eventTap) {
    fprintf(stderr, "failed to create event tap\n");
    exit(1);
  }
  
  // Create a run loop source.
  runLoopSource = CFMachPortCreateRunLoopSource(
                                                kCFAllocatorDefault, eventTap, 0);
  
  // Add to the current run loop.
  CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource,
                     kCFRunLoopCommonModes);
  
  // Enable the event tap.
  CGEventTapEnable(eventTap, true);
  
    return NSApplicationMain(argc, (const char **)argv);
}
