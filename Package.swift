
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.39.10/SendbirdChatSDK.xcframework.zip",
            checksum: "fa4fbf18f16008584cf1865e9c0880791a117634cdbeb2e9516c527234173fc5"
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

