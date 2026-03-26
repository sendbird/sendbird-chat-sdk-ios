
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
        .package(url: "https://github.com/sendbird/sendbird-auth-ios.git", .exact("1.0.1"))
    ],
    targets: [
        .binaryTarget(
            name: "SendbirdChatSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.38.1/SendbirdChatSDK.xcframework.zip",
            checksum: "7de3ef6bd9dc55c6e34a64502dd1644ad83879f73ff54fffda3e8d6926a9c150"
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

