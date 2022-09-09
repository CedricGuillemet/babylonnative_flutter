#ifndef FLUTTER_PLUGIN_BABYLONNATIVE_PLUGIN_H_
#define FLUTTER_PLUGIN_BABYLONNATIVE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace babylonnative {

class BabylonnativePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BabylonnativePlugin();

  virtual ~BabylonnativePlugin();

  // Disallow copy and assign.
  BabylonnativePlugin(const BabylonnativePlugin&) = delete;
  BabylonnativePlugin& operator=(const BabylonnativePlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace babylonnative

#endif  // FLUTTER_PLUGIN_BABYLONNATIVE_PLUGIN_H_
