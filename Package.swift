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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/0.0.100/SendbirdChatSDK.xcframework.zip",
            checksum: "3f47c6fc03104b0a01ace8435b2393dae5fa90af28e8a795d7b3091aae90bc9a"
        ),
        .binaryTarget(
            name: "SendbirdAuthInternal",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/0.0.100/SendbirdAuth.xcframework.zip",
            checksum: "69ebdd8c3f622e100a7960b2a2f329c0cefa9c178d96bdc59be6bc0f562705c9"
        ),
        .target(
            name: "SendbirdChatSDKWrapper",
            dependencies: [
                .target(name: "SendbirdChatSDK"),
                .target(name: "SendbirdAuthInternal")
            ]
        )
    ]
)
