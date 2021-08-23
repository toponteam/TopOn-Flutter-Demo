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
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '10.0'
  
  #*************************手动导入******************************#
#  s.frameworks = 'SystemConfiguration', 'CoreGraphics','Foundation','UIKit','AVFoundation','AdSupport','AudioToolbox','CoreMedia','StoreKit','SystemConfiguration','WebKit','AppTrackingTransparency','CoreMotion','CoreTelephony','MessageUI','SafariServices','WebKit','CoreMotion','JavaScriptCore','CoreLocation','MediaPlayer'
#
#  s.pod_target_xcconfig =   {'OTHER_LDFLAGS' => ['-lObjC']}
#
#  s.libraries = 'c++', 'z', 'sqlite3', 'xml2', 'resolv', 'bz2.1.0','bz2','xml2','resolv.9','iconv','c++abi'
#
#  s.vendored_frameworks = 'ThrirdPartySDK/**/*.framework'
#
#  s.resource = 'ThrirdPartySDK/**/*.bundle'
#
#  s.vendored_library = 'ThrirdPartySDK/**/*.a'
#
#
  #*************************************************************#

  #************************自动导入**********************************#

  s.dependency 'AnyThinkiOS','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkAdmobAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkPangleAdapter','5.7.65'
  s.dependency 'Ads-CN-Beta','3.9.0.0'
  s.dependency 'AnyThinkiOS/AnyThinkFacebookAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkGDTAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkMintegralAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkApplovinAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkTapjoyAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkChartboostAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkUnityAdsAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkVungleAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkInmobiAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkIronSourceAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkMaioAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkNendAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkSigmobAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkStartAppAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkKidozAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkFyberAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkMyTargetAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkKSAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkBaiduAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkOguryAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkMopubAdapter','5.7.65'
  s.dependency 'AnyThinkiOS/AnyThinkAdColonyAdapter','5.7.65'

#*************************************************************#

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 armv7s arm64' }

#  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  
end
