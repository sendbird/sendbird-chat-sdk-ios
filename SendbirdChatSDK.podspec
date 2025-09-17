
Pod::Spec.new do |s|
  s.name         = 'SendbirdChatSDK'
  s.version      = "0.0.101"
  s.summary      = 'Sendbird Chat iOS Framework'
  s.description  = 'Messaging and Chat API for Mobile Apps and Websites'
  s.homepage     = 'https://sendbird.com'
  s.license      = { :type => 'Commercial', :file => 'SendbirdChatSDK/LICENSE.md' }
  s.authors      = {
    'Sendbird' => 'sha.sdk_deployment@sendbird.com',
    'Jed Gyeong' => 'jed.gyeong@sendbird.com',
    'Celine Moon' => 'celine.moon@sendbird.com',
    'Tez Park' => 'tez.park@sendbird.com',
    'Damon Park' => 'damon.park@sendbird.com',
    'Young Hwang' => 'young.hwang@sendbird.com',
    'Kai Lee' => 'kai.lee@sendbird.com'
  }
  # Single distribution zip now contains both Chat & Auth xcframeworks inside SendbirdChatSDK/ folder
  s.source       = { :http => "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/0.0.101/SendbirdChatSDK.zip", :sha1 => "99f2a28d4343be88a81ac502d466b149288472d4" }
  s.requires_arc = true
  s.platform = :ios, '13.0'
  s.documentation_url = 'https://sendbird.com/docs/chat'
  s.ios.vendored_frameworks = [
    'SendbirdChatSDK/SendbirdChatSDK.xcframework',
    'SendbirdChatSDK/SendbirdAuth.xcframework'
  ]
  s.pod_target_xcconfig = {
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  }
  s.user_target_xcconfig = {
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  }
  s.ios.frameworks = ['UIKit', 'CFNetwork', 'Security', 'Foundation', 'Network', 'MobileCoreServices', 'SystemConfiguration', 'CoreFoundation']
  s.ios.library   = 'icucore'
end

