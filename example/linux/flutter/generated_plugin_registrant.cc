//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <babylonnative/babylonnative_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) babylonnative_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "BabylonnativePlugin");
  babylonnative_plugin_register_with_registrar(babylonnative_registrar);
}
