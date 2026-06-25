
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
        .package(url: "https://github.com/sendbird/sendbird-auth-ios.git", .exact("1.1.3"))
    ],
    targets: [
        .binaryTarget(
            name: "SendbirdChatSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.39.6/SendbirdChatSDK.xcframework.zip",
            checksum: "e41db5b2f139393deaa3caab14a4a83c9fd25ba4d246ed887480ed2f22b1220e"
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

