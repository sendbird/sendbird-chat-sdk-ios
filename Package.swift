// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SendbirdChatSDK",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "SendbirdChatSDK",
            targets: ["SendbirdChatSDK"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SendbirdChatSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/v4.0.0-beta.3/SendbirdChatSDK.xcframework.zip",
            checksum: "0ac8bdaa20ecc39bb1a5cb9bb8ee511a5594bbdaf5d156dd08200cd554b8c668"
        ),
    ]
)
