
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.28.0/SendbirdChatSDK.xcframework.zip",
            checksum: "c6b2d4d17c4529bff34d010bbbdabadeaa292604a55f8f64f0e19d7a7e39d52b"
        ),
    ]
)
