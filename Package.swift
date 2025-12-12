
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.34.2/SendbirdChatSDK.xcframework.zip",
            checksum: "08a5f9e7ce1d8f058198cda9e32d65c0284786197f5557cee0e56eca1029b5d4"
        ),
        .binaryTarget(
            name: "SendbirdAuthSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.34.2/SendbirdAuthSDK.xcframework.zip",
            checksum: "b032f8d78f2df9ca6e81e7a9204224e1f657b5192d8fa3fd8e64d96b97044705"
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

