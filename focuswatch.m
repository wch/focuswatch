// Code borrowed from:
// https://stackoverflow.com/questions/8348627/what-is-the-correct-way-to-identify-the-currently-active-application-in-osx-10

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>


@interface MDAppController : NSObject <NSApplicationDelegate> {
    NSRunningApplication    *currentApp;
}
@property (retain) NSRunningApplication *currentApp;
@end

@implementation MDAppController
@synthesize currentApp;

- (id)init {
    if ((self = [super init])) {
        [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self
                      selector:@selector(activeAppDidChange:)
               name:NSWorkspaceDidActivateApplicationNotification object:nil];
    }
    return self;
}
- (void)dealloc {
    [[[NSWorkspace sharedWorkspace] notificationCenter] removeObserver:self];
    [super dealloc];
}
- (void)activeAppDidChange:(NSNotification *)notification {
    self.currentApp = [[notification userInfo] objectForKey:NSWorkspaceApplicationKey];
    NSLog(
        @"Current application: %5d: %@ - %@ - %@",
        currentApp.processIdentifier,
        currentApp.localizedName,
        currentApp.bundleIdentifier,
        currentApp.bundleURL
    );
}
@end

int main(int argc, const char * argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [NSApplication sharedApplication];
    MDAppController *appController = [[MDAppController alloc] init];
    [NSApp setDelegate:appController];
    [NSApp run];
    [pool release];
    return 0;
}
