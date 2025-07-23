
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
    name: "SendbirdChatSDK",
    platforms: [.iOS(.v13)],
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.29.0/SendbirdChatSDK.xcframework.zip",
            checksum: "df226ee574d7cae3bfd157b6ab3a0c798d679c3e6917d6ff25a339da22dfbf1f"
        ),
    ]
)
