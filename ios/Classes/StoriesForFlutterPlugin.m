#import "StoriesForFlutterPlugin.h"
#if __has_include(<Stories_for_Flutter/Stories_for_Flutter-Swift.h>)
#import <Stories_for_Flutter/Stories_for_Flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "Stories_for_Flutter-Swift.h"
#endif

@implementation StoriesForFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftStoriesForFlutterPlugin registerWithRegistrar:registrar];
}
@end
