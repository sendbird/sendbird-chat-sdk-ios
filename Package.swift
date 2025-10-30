
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.32.0/SendbirdChatSDK.xcframework.zip",
            checksum: "973c7171374cd0a38044b89a7fa3f447bdac2d4c42711313e1db4f3295c1e32f"
        ),
        .binaryTarget(
            name: "SendbirdAuthInternal",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.32.0/SendbirdAuth.xcframework.zip",
            checksum: "58660310286ba5e1ad472dd18d30997ff53f2ccbb374566cd68d8b30b6f332a6"
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

