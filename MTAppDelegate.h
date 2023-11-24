#import <UIKit/UIKit.h>
@class MTController;

@interface UIWindow (MTerminal)
- (void)_setSecure:(BOOL)arg0;
@end

@interface MTAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MTController *controller;
}
@end
