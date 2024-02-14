
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
    name: "SendbirdChatSDK",
    platforms: [.iOS(.v11)],
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/v4.15.4/SendbirdChatSDK.xcframework.zip",
            checksum: "e572ccf33926754690a7d027c7f0b9d5e7d3c17d5f042ee9a3fe5076a7abcb65"
        ),
    ]
)
