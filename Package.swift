
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
    dependencies: [
        .package(url: "https://github.com/sendbird/sendbird-auth-ios.git", .exact("1.2.0"))
    ],
    targets: [
        .binaryTarget(
            name: "SendbirdChatSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.39.11/SendbirdChatSDK.xcframework.zip",
            checksum: "1c8274f70a0fea7454761beba0b2c1c65545aef97c68f9e82aed8db017c8eaef"
        ),
        .target(
            name: "SendbirdChatSDKWrapper",
            dependencies: [
                .target(name: "SendbirdChatSDK"),
                .product(name: "SendbirdAuthSDK", package: "sendbird-auth-ios")
            ]
        )
    ]
)

