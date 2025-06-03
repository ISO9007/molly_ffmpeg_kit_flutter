Pod::Spec.new do |s|
  s.name             = 'ffmpeg_kit_flutter'
  s.version          = '6.0.3'
  s.summary          = 'FFmpeg Kit for Flutter'
  s.description      = 'A Flutter plugin for running FFmpeg and FFprobe commands.'
  s.homepage         = 'https://github.com/arthenica/ffmpeg-kit'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ARTHENICA' => 'open-source@arthenica.com' }

  s.platform            = :ios
  s.requires_arc        = true
  s.static_framework    = true

  s.source              = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.default_subspec = 'ffmpeg_kit_ios_local'

  s.subspec 'ffmpeg_kit_ios_local' do |ss|
      ss.libraries        = ["z", "bz2", "c++", "iconv"]
      ss.osx.frameworks        = [
            "AudioToolbox",
            "AVFoundation",
            "CoreMedia",
            "VideoToolbox"
          ]
      ss.vendored_frameworks = 'Frameworks/ffmpegkit.xcframework', 'Frameworks/libavcodec.xcframework', 'Frameworks/libavdevice.xcframework', 'Frameworks/libavfilter.xcframework', 'Frameworks/libavformat.xcframework', 'Frameworks/libavutil.xcframework', 'Frameworks/libswresample.xcframework', 'Frameworks/libswscale.xcframework'
      ss.ios.deployment_target = '12.1'
  end

  s.dependency          'Flutter'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }

end
