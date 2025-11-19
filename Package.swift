
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.34.1/SendbirdChatSDK.xcframework.zip",
            checksum: "c943c8f20e8fc1dc2b48c277f1f1bd1ecff8195fbc5593934bc2c4aaaa8a2baa"
        ),
        .binaryTarget(
            name: "SendbirdAuthSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.34.1/SendbirdAuthSDK.xcframework.zip",
            checksum: "64d9e14c95ffce0fe0485f2629c9450758c83a4e3b21752d88d62f3cf411cc38"
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

