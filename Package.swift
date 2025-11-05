
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
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.33.0/SendbirdChatSDK.xcframework.zip",
            checksum: "270b85a8c17ba1537f05d8c5b6221dc63647c7383eff4a3c4809a44ab0fbee4b"
        ),
        .binaryTarget(
            name: "SendbirdAuthInternal",
            url: "https://github.com/sendbird/sendbird-chat-sdk-ios/releases/download/4.33.0/SendbirdAuth.xcframework.zip",
            checksum: "508f0544a66f981ac82d2162333a5a23486a832f4760c750514775dabcb0cb54"
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

