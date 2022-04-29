Pod::Spec.new do |s|
  s.name         = "SendbirdChatSDK"
  s.version      = "4.0.0-beta.2"
  s.summary      = "SendBird iOS Framework"
  s.description  = "Messaging and Chat API for Mobile Apps and Websites"
  s.homepage     = "https://sendbird.com"
  s.license      = { :type => 'Commercial', :file => 'LICENSE.md' }
  s.authors      = { 
    "Minhyuk Kim" => "minhyuk.kim@sendbird.com",
    "Sendbird" => "sha.sdk_deployment@sendbird.com",
    "Jed Gyeong" => "jed.gyeong@sendbird.com", 
    "Woo" => "wooyoung.chung@sendbird.com", 
    "Celine Moon" => "celine.moon@sendbird.com",
    "Erenst Hong" => "ernest.hong@sendbird.com"
  }
  s.source       = { :http => 'https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/v4.0.0-beta.2/SendbirdChatSDK.zip', :sha1 => 'd2ef4e2ab7a7531678dd0e7c985b78c83a066e15' }
  s.requires_arc = true
  s.platform = :ios, "9.0"
  s.documentation_url = 'https://docs.sendbird.com/'
  s.ios.vendored_frameworks = "SendbirdChatSDK.xcframework"
  s.ios.frameworks = ["UIKit", "CFNetwork", "Security", "Foundation", "Network", "MobileCoreServices", "SystemConfiguration", "CoreFoundation"]
  s.ios.library   = "icucore"
end
