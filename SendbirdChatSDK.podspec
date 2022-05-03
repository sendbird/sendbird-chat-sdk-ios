Pod::Spec.new do |s|
  s.name         = "SendbirdChatSDK"
  s.version      = "4.0.0-beta.3"
  s.summary      = "SendBird iOS Framework"
  s.description  = "Messaging and Chat API for Mobile Apps and Websites"
  s.homepage     = "https://sendbird.com"
  s.license      = { :type => 'Commercial', :file => 'SendbirdChatSDK/LICENSE.md' }
  s.authors      = { 
    "Minhyuk Kim" => "minhyuk.kim@sendbird.com",
    "Sendbird" => "sha.sdk_deployment@sendbird.com",
    "Jed Gyeong" => "jed.gyeong@sendbird.com", 
    "Woo" => "wooyoung.chung@sendbird.com", 
    "Celine Moon" => "celine.moon@sendbird.com",
    "Erenst Hong" => "ernest.hong@sendbird.com"
  }
  s.source       = { :http => 'https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/v4.0.0-beta.3/SendbirdChatSDK.zip', :sha1 => '1a9a72baecbde06e9bbe0bb498808892b0bb5b09' }
  s.requires_arc = true
  s.platform = :ios, "9.0"
  s.documentation_url = 'https://docs.sendbird.com/'
  s.ios.vendored_frameworks = "SendbirdChatSDK/SendbirdChatSDK.xcframework"
  s.ios.frameworks = ["UIKit", "CFNetwork", "Security", "Foundation", "Network", "MobileCoreServices", "SystemConfiguration", "CoreFoundation"]
  s.ios.library   = "icucore"
end
