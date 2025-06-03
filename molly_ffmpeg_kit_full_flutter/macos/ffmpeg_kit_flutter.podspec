Pod::Spec.new do |s|
  s.name             = 'ffmpeg_kit_flutter'
  s.version          = '6.0.3'
  s.summary          = 'FFmpeg Kit for Flutter'
  s.description      = 'A Flutter plugin for running FFmpeg and FFprobe commands.'
  s.homepage         = 'https://github.com/arthenica/ffmpeg-kit'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ARTHENICA' => 'open-source@arthenica.com' }

  s.platform            = :osx
  s.requires_arc        = true
  s.static_framework    = true

  s.source              = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.default_subspec = 'ffmpeg_kit_mac_local'

  s.subspec 'ffmpeg_kit_mac_local' do |ss|
      ss.libraries        = ["z", "bz2", "c++", "iconv"]
      ss.osx.frameworks        = [
            "AudioToolbox",
            "AVFoundation",
            "CoreAudio",
            "CoreImage",
            "CoreMedia",
            "OpenCL",
            "OpenGL",
            "VideoToolbox"
          ]
      ss.vendored_frameworks = 'Frameworks/ffmpegkit.xcframework', 'Frameworks/libavcodec.xcframework', 'Frameworks/libavdevice.xcframework', 'Frameworks/libavfilter.xcframework', 'Frameworks/libavformat.xcframework', 'Frameworks/libavutil.xcframework', 'Frameworks/libswresample.xcframework', 'Frameworks/libswscale.xcframework'
      ss.osx.deployment_target = '10.15'
  end

  s.dependency          'FlutterMacOS'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.osx.deployment_target = '10.15'

end