#include "include/stories_for_flutter/stories_for_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "stories_for_flutter_plugin.h"

void StoriesForFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  stories_for_flutter::StoriesForFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
