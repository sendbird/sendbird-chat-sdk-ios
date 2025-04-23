
// swift-tools-version:5.10
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.25.3-beta.3/SendbirdChatSDK.xcframework.zip",
            checksum: "31c3c695579fc9f28f1d0a5ebac3bc0ef8da21e3c56615fd7bb4e549af351fc8"
        ),
    ]
)
