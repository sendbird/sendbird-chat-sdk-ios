
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
        .package(url: "https://github.com/sendbird/sendbird-auth-ios.git", .exact("1.1.0"))
    ],
    targets: [
        .binaryTarget(
            name: "SendbirdChatSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.39.1/SendbirdChatSDK.xcframework.zip",
            checksum: "43a7e0b7d66cee509cf47614e92188f79379733e960eef5b6234237ace49a280"
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

