#!/bin/bash

VERSION=''

while getopts v: flag
do
    case "${flag}" in
        v) VERSION=${OPTARG};;
        *) error "Unexpected option ${flag}";;
    esac
done

echo $VERSION

if [ -z $VERSION ]; then
    echo 'Version is required'
fi

TEMPLATE="
Pod::Spec.new do |s|
  s.name         = 'SendbirdChatSDK'
  s.version      = \"$VERSION\"
  s.summary      = 'Sendbird Chat iOS Framework'
  s.description  = 'Messaging and Chat API for Mobile Apps and Websites'
  s.homepage     = 'https://sendbird.com'
  s.license      = 'Commercial'
  s.authors      = {
    'Jed Gyeong' => 'jed.gyeong@sendbird.com',
    'Celine Moon' => 'celine.moon@sendbird.com',
    'Erenst Hong' => 'ernest.hong@sendbird.com'
  }
  s.source       = { :http => \"https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/v#{s.version}/SendbirdChatSDK.xcframework.zip\" }
  s.requires_arc = true
  s.platform = :ios, '9.0'
  s.documentation_url = 'https://docs.sendbird.com/'
  s.ios.frameworks = ['UIKit', 'CFNetwork', 'Security', 'Foundation', 'Network', 'MobileCoreServices', 'SystemConfiguration', 'CoreFoundation']
  s.ios.library   = 'icucore'
end
"

echo -e "$TEMPLATE" > SendbirdChatSDK.podspec

