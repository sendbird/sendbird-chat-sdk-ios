
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/v4.12.0/SendbirdChatSDK.xcframework.zip",
            checksum: "f9e90f9eb77f3ab6c593a3fe4d75fa8a655d30f8b82b5162bf3aac240ae7c7f5"
        ),
    ]
)
