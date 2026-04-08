
Pod::Spec.new do |s|
  s.name         = 'SendbirdChatSDK'
  s.version      = "4.38.2"
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
  s.source       = { :http => "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.38.2/SendbirdChatSDK.zip", :sha1 => "310961fb6c72298236a8466574f9505ca3ef89e1" }
  s.requires_arc = true
  s.platform = :ios, '13.0'
  s.documentation_url = 'https://sendbird.com/docs/chat'
  s.ios.vendored_frameworks = 'SendbirdChatSDK/SendbirdChatSDK.xcframework'
  s.dependency 'SendbirdAuthSDK', '1.0.2'
  s.pod_target_xcconfig = {
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  }
  s.user_target_xcconfig = {
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  }
  s.ios.frameworks = ['UIKit', 'CFNetwork', 'Security', 'Foundation', 'Network', 'MobileCoreServices', 'SystemConfiguration', 'CoreFoundation']
  s.ios.library   = 'icucore'
end

