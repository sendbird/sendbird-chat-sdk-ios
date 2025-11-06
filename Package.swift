
// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SendbirdChatSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SendbirdChatSDK",
            targets: ["SendbirdChatSDKWrapper"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SendbirdChatSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/0.99.99/SendbirdChatSDK.xcframework.zip",
            checksum: "22a79432c37829df57cc3872cc1b0ad5b2b1486358cd3fb09cb20da70a91d483"
        ),
        .binaryTarget(
            name: "SendbirdAuthSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/0.99.99/SendbirdAuthSDK.xcframework.zip",
            checksum: "8419288bda7b19edd7736f3c21055819dc542517587132116da26a1655814ad9"
        ),
        .target(
            name: "SendbirdChatSDKWrapper",
            dependencies: [
                .target(name: "SendbirdChatSDK"),
                .target(name: "SendbirdAuthSDK")
            ]
        )
    ]
)

