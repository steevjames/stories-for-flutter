#import "StoriesForFlutterPlugin.h"
#if __has_include(<stories_for_flutter/stories_for_flutter-Swift.h>)
#import <stories_for_flutter/stories_for_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "stories_for_flutter-Swift.h"
#endif

@implementation StoriesForFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftStoriesForFlutterPlugin registerWithRegistrar:registrar];
}
@end
