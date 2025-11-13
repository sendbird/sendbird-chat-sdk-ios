
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.34.0/SendbirdChatSDK.xcframework.zip",
            checksum: "5251c83605329e31ad6a6335e88a700654f3b9080058a229485ad7b2349aee0f"
        ),
        .binaryTarget(
            name: "SendbirdAuthInternal",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.34.0/SendbirdAuth.xcframework.zip",
            checksum: "c7de11ba08ec3dcfb8074e4e022df2368ce7a9a8e7e404e17599509e84158fdc"
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

