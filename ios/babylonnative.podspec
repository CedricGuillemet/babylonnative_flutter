#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint babylonnative.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'babylonnative'
  s.version          = '0.0.1'
  s.summary          = 'BabylonNative/Babylon.js inside Flutter apps'
  s.description      = <<-DESC
A new Flutter plugin project to get BabylonNative/Babylon.js inside Flutter apps.
                       DESC
  s.homepage         = 'https://github.com/CedricGuillemet/babylonnative_flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Babylon team' => 'cedric.guillemet@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }

  s.libraries = 'astc-codec',
                'astc',
                'etc1',
                'etc2',
                'nvtt',
                'squish',
                'pvrtc',
                'iqa',
                'edtaa3',
                'tinyexr',
                'BabylonNative',
                'bgfx',
                'bimg',
                'bx',
                'Canvas',
                'GenericCodeGen',
                'glslang',
                'Graphics',
                'jsRuntime',
                'OGLCompiler',
                'OSDependent',
                'MachineIndependent',
                'napi',
                'NativeCamera',
                'NativeCapture',
                'NativeEngine',
                'NativeInput',
                'NativeOptimizations',
                'NativeTracing',
                'NativeXR',
                'SPIRV',
                'spirv-cross-core',
                'spirv-cross-glsl',
                'spirv-cross-msl',
                'tinyexr',
                'UrlLib',
                'Window',
                'XMLHttpRequest',
                'xr'

  s.frameworks = "MetalKit", "ARKit"
end
