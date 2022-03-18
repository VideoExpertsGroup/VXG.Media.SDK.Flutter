Pod::Spec.new do |s|
  s.name             = 'vxg_playersdk'
  s.version          = '0.0.1'
  s.summary          = 'VXG Player SDK for Flutter plugin'
  s.description      = <<-DESC
  VXG Player SDK for Flutter plugin
                       DESC
  s.homepage         = 'https://www.videoexpertsgroup.com/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'VXG' => 'contact@videoexpertsgroup.com/' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO', 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.preserve_paths = 'xcframeworks/openssl.xcframework/**/*', 'xcframeworks/ffmpeg.xcframework/**/*', 'xcframeworks/MediaPlayerSDK.xcframework/**/*'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework openssl -framework ffmpeg -framework MediaPlayerSDK' }
  s.vendored_frameworks = 'xcframeworks/openssl.xcframework', 'xcframeworks/ffmpeg.xcframework', 'xcframeworks/MediaPlayerSDK.xcframework'

  s.xcconfig = {
    'OTHER_LDFLAGS' => ' -liconv -lz -lbz2 -lc++',
  }

end
