#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint anythink_sdk.podspec` to validate before publishing.
#

Pod::Spec.new do |s|
  s.name             = 'anythink_sdk'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '10.0'
  s.static_framework = true
  
  #************************* Manual import ******************************#
# s.frameworks = 'SystemConfiguration', 'CoreGraphics','Foundation','UIKit','AVFoundation','AdSupport','AudioToolbox','CoreMedia','StoreKit','SystemConfiguration','WebKit','AppTrackingTransparency','CoreMotion','CoreTelephony','MessageUI','SafariServices','WebKit','CoreMotion','JavaScriptCore','CoreLocation','MediaPlayer'

#  s.pod_target_xcconfig =   {'OTHER_LDFLAGS' => ['-lObjC']}

#  s.libraries = 'c++', 'z', 'sqlite3', 'xml2', 'resolv', 'bz2.1.0','bz2','xml2','resolv.9','iconv','c++abi'

#  s.vendored_frameworks = '{ThirdPartySDK/tt/*.xcframework,ThirdPartySDK/tt/*.framework,ThirdPartySDK/Core/*.xcframework,ThirdPartySDK/gdt/*.xcframework,ThirdPartySDK/Masonry.framework}'

#  s.resource = 'ThirdPartySDK/**/*.bundle'

#  s.vendored_library = 'ThirdPartySDK/**/*.a'




  #*************************************************************#

  #************************ CocoaPod **********************************#
   
  s.dependency 'AnyThinkiOS','6.2.36'
  s.dependency 'Masonry'
  # s.dependency 'AnyThinkiOS/AnyThinkAdmobAdapter','6.2.36'
  s.dependency 'AnyThinkiOS/AnyThinkTTAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkPangleAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkFacebookAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkGDTAdapter','6.2.36'
   
#   s.dependency 'AnyThinkiOS/AnyThinkMintegralAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkApplovinAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkTapjoyAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkChartboostAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkUnityAdsAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkVungleAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkInmobiAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkIronSourceAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkMaioAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkNendAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkSigmobAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkStartAppAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkKidozAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkFyberAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkMyTargetAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkKuaiShouAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkBaiduAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkOguryAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkMopubAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkAdColonyAdapter','6.2.36'
#   s.dependency 'AnyThinkiOS/AnyThinkKlevinAdapter','6.2.36'

#*************************************************************#

  # Flutter.framework does not contain a i386 slice.
  # s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

#  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  
end
