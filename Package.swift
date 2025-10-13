
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
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SendbirdChatSDK",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.31.0/SendbirdChatSDK.xcframework.zip",
            checksum: "6e47cde86de3d0672b7749a645c7edeee698cde54badc587a67e420332d7aa49"
        ),
        .binaryTarget(
            name: "SendbirdAuthInternal",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.31.0/SendbirdAuth.xcframework.zip",
            checksum: "36e800153a89e4dfe579cc1860ea6e63f2b5a3d3402de63fadba88b22df88266"
        ),
        .target(
            name: "SendbirdChatSDKWrapper",
            dependencies: [
                .target(name: "SendbirdChatSDK"),
                .target(name: "SendbirdAuthInternal")
            ]
        )
    ]
)

