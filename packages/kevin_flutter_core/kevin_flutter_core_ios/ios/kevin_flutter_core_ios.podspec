#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint kevin_flutter_core_ios.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'kevin_flutter_core_ios'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin to communicate with kevin. SDK'
  s.description      = <<-DESC
Flutter plugin to communicate with kevin. SDK.
                       DESC
  s.homepage         = 'https://github.com/getkevin/kevin-flutter/tree/master/packages/kevin_flutter_core/kevin_flutter_core_ios'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'kevin.' => 'mobileteam@kevin.eu' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'kevin-ios', '2.4.0'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
