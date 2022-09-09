#include "include/babylonnative/babylonnative_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "babylonnative_plugin.h"

void BabylonnativePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  babylonnative::BabylonnativePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
