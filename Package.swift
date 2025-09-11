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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/0.0.100/SendbirdChatSDK.xcframework.zip",
            checksum: "310450a6fec5f4af70572b6b0c62da6873766df79e7471324036a9a9d2bd5181"
        ),
        .binaryTarget(
            name: "SendbirdAuthInternal",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/0.0.100/SendbirdAuth.xcframework.zip",
            checksum: "47216509cd3ff36c44f1ce89a991464d58b28041150c531d41172b1f71012dab"
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
