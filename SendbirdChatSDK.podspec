
Pod::Spec.new do |s|
  s.name         = 'SendbirdChatSDK'
  s.version      = "4.0.8"
  s.summary      = 'Sendbird Chat iOS Framework'
  s.description  = 'Messaging and Chat API for Mobile Apps and Websites'
  s.homepage     = 'https://sendbird.com'
  s.license      = { :type => 'Commercial', :file => 'SendbirdChatSDK/LICENSE.md' }
  s.authors      = {
    'Minhyuk Kim' => 'minhyuk.kim@sendbird.com',
    'Sendbird' => 'sha.sdk_deployment@sendbird.com',
    'Jed Gyeong' => 'jed.gyeong@sendbird.com',
    'Celine Moon' => 'celine.moon@sendbird.com',
    'Ernest Hong' => 'ernest.hong@sendbird.com'
  }
  s.source       = { :http => "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/v4.0.8/SendbirdChatSDK.zip", :sha1 => "6a8a25b5383eb08ac24132afe46d61670823b67d" }
  s.requires_arc = true
  s.platform = :ios, '9.0'
  s.documentation_url = 'https://sendbird.com/docs/chat'
  s.ios.vendored_frameworks = 'SendbirdChatSDK/SendbirdChatSDK.xcframework'
  s.ios.frameworks = ['UIKit', 'CFNetwork', 'Security', 'Foundation', 'MobileCoreServices', 'SystemConfiguration', 'CoreFoundation']
  s.ios.library   = 'icucore'
end

