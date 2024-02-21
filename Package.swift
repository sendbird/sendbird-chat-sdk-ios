
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/v4.16.1/SendbirdChatSDK.xcframework.zip",
            checksum: "42144c63a0f9e132df8aebfdb4ccdfaff0c1c796e93f5b0bd6ea226bca37c492"
        ),
    ]
)
