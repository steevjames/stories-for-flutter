#ifndef FLUTTER_PLUGIN_STORIES_FOR_FLUTTER_PLUGIN_H_
#define FLUTTER_PLUGIN_STORIES_FOR_FLUTTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace stories_for_flutter {

class StoriesForFlutterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  StoriesForFlutterPlugin();

  virtual ~StoriesForFlutterPlugin();

  // Disallow copy and assign.
  StoriesForFlutterPlugin(const StoriesForFlutterPlugin&) = delete;
  StoriesForFlutterPlugin& operator=(const StoriesForFlutterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace stories_for_flutter

#endif  // FLUTTER_PLUGIN_STORIES_FOR_FLUTTER_PLUGIN_H_
