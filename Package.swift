
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
    name: "SendbirdChatSDK",
    platforms: [.iOS(.v9)],
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/v4.2.0/SendbirdChatSDK.xcframework.zip",
            checksum: "6e2006e2b1008bc276e3b7a9dfdb8ef614c98cb66e4074afe0b3f9b1f3e2631c"
        ),
    ]
)
