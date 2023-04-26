# [Sendbird](https://sendbird.com) Chat SDK for iOS

[![Platform](https://img.shields.io/badge/Platform-iOS-orange.svg)](https://cocoapods.org/pods/SendBirdSDK)
[![Languages](https://img.shields.io/badge/Language-Objective--C%20%7C%20Swift-orange.svg)](https://github.com/sendbird/sendbird-chat-sdk-ios)
[![CocoaPods](https://img.shields.io/badge/CocoaPods-compatible-green.svg)](https://cocoapods.org/pods/SendBirdSDK)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Commercial License](https://img.shields.io/badge/License-Commercial-brightgreen.svg)](https://github.com/sendbird/sendbird-chat-sdk-ios/blob/master/LICENSE.md)

> :warning: **DO NOT USE THESE VERSIONS**: `v4.3.1`, `v4.3.2`, `v4.4.0`, `v4.5.0`. There is a bug where the pending push token is removed after connecting a user.

## Table of contents

1.  [Introduction](#introduction)
1.  [Requirements](#requirements)
1.  [Getting started](#getting-started)
1.  [Sending your first message](#sending-your-first-message)
1.  [Hiring](#we-are-hiring)

<br />

## Introduction

The Sendbird Chat SDK for iOS allows you to add real-time chat into your client app with minimal effort. Sendbird offers a feature rich, scalable, and proven chat solution depended on by companies like Reddit, Hinge, PubG and Paytm.
<br />

### How it works

The Chat SDK provides the full functionality to provide a rich chat experience, implementing it begins by adding a user login, listing the available channels, selecting or creating an [open channel](https://sendbird.com/docs/chat/v4/ios/channel/overview-channel#2-open-channel) or [group channel](https://sendbird.com/docs/chat/v4/ios/channel/overview-channel#2-group-channel), and receive messages and other events through [channel event delegates](https://sendbird.com/docs/chat/v4/ios/event-delegate/overview-event-delegate#1-event-delegate) and the ability to send a message. Once this basic functionality is in place, congrats, you now have a chat app!

Once this is in place, take a look at [all the other features](https://sendbird.com/features/chat-messaging/features) that Sendbird supports and add what works best for your users.
<br />

### Documentation

Find out more about Sendbird Chat for iOS in [the documentation](https://sendbird.com/docs/chat/v4/ios/quickstart/send-first-message). If you have any comments, questions or feature requests, let us know in the [Sendbird community](https://community.sendbird.com).
<br />

## Requirements

The minimum requirements for Chat SDK for iOS are:

- `macOS`
- `Xcode`
- `At least one device running iOS 11.0 and later`
- `Swift 5.0 or later` or `Objective-C`

> **Note**: Sendbird server supports Transport Layer Security (TLS) from version 1.0 up to 1.3. For example, in the server regions where TLS 1.3 isn’t available, lower versions, sequentially from 1.2 to 1.0, will be supported for secure data transmission.

<br />

## Getting started

The quickest way to get started is by using one of the sample apps from the [samples repo](https://github.com/sendbird/sendbird-chat-sample-ios), create an application in the [Sendbird dashboard](https://dashboard.sendbird.com) and copy the `App ID` to the sample app and you’re ready to go.

<br />

## Step by step

### Step 1: Create a Sendbird application from your dashboard

Before installing Sendbird Chat SDK, you need to create a Sendbird application on the [Sendbird Dashboard](https://dashboard.sendbird.com). You will need the `App ID` of your Sendbird application when initializing the Chat SDK.

> **Note**: Each Sendbird application can be integrated with a single client app. Within the same application, users can communicate with each other across all platforms, whether they are on mobile devices or on the web.

<br />

### Step 2: Install the Chat SDK

Installing the Chat SDK is simple if you’re familiar with using external libraries or SDK’s in your projects. Sendbird Chat SDK can be installed through either [**Swift Packages**](#2-get-started-3-swift-packages), [**CocoaPods**](#2-get-started-3-cocoapods), or [**Carthage**](#2-get-started-3-carthage).

> **Note**: If you don't want to use package managers, check out the [manual installation guide](https://community.sendbird.com/t/ios-how-can-i-install-sendbird-framework-without-using-cocoapods/2885).

### Swift Packages

You can use an Xcode native package manager **Swift Packages** for installation.

1. Open **Xcode**, go to your project's **General** settings tab, and select your project under **Project** in the left column.

2. Go to the **Swift packages** tab and click the **+** button.

<!-- ![Image|Adding a package to your project using Swift Packages](https://static.sendbird.com/docs/chat-ios-getting-started-swift-packages.png) -->

3. When a pop-up shows, enter our github repository address in the search bar. The address is `https://github.com/sendbird/sendbird-chat-sdk-ios`.

<!-- ![Image|Typing in the repository address of the Chat SDK package](https://static.sendbird.com/docs/chat-ios-getting-started-repository-adress.png) -->

4. Set **Rules** and click **Next**.

<!-- ![Image|Setting rules and options for the Chat SDK package](https://static.sendbird.com/docs/chat-ios-getting-started-rules-setup.png) -->

5. Check `SendbirdChatSDK` in the **Package product** column and click **Finish**. This will establish a **Swift Package Dependency** menu in Xcode.

<!-- ![Image|Creating a dependency between your project and the SendbirdChat package](https://static.sendbird.com/docs/chat-ios-getting-started-package-product-checked.png) -->

### CocoaPods

1. Open a terminal window, move to your project directory, and then create a **Podfile** by running the following command.

```bash
$ pod init
```

2. A **Podfile** will be created in your project folder. Open the **Podfile** and modify the file like the following.

```bash
# platform :ios, '11.0'

target 'YOUR_PROJECT_NAME' do
   # Comment the next line if you don't want to use dynamic frameworks
   use_frameworks!

   # Pods for `YOUR_PROJECT_NAME`
   pod SendbirdChatSDK
end
```

3. Then install the `SendbirdChatSDK` framework by running the following command in the same terminal window.

```bash
$ pod install
```

4. In the folder, you will see a new project file in the `.xcworkspace` format. Now you can build your project with the `SendbirdChatSDK` framework in the file.

### Carthage

1. Open a terminal window and add the following line to create a **Cartfile** in your project folder.

```bash
$ touch Cartfile
```

2. Move to your project directory, open the **Cartfile**, and add the following line to your **Cartfile**.

```bash
github "sendbird/sendbird-chat-sdk-ios"
```

3. Run the carthage update command to download Sendbird Chat SDK for iOS.

```bash
$ carthage update --use-xcframeworks
```

4. Once the update is complete, go to your Xcode project's **General** settings tab. Then, open the **<YOUR_XCODE_PROJECT_DIRECTORY>/Carthage/Build/iOS** in the **Finder** window and drag and drop the **SendbirdChatSDK.xcframework** folder to the **Frameworks, Libraries, and Embedded** section in Xcode.

<!-- ![Image|Adding SendbirdChatSDK.xcframework to your Xcode project](https://static.sendbird.com/docs/chat-ios-getting-started-xcode-general-tab.png) -->

### Step 3: Import the Chat SDK

With one simple import statement, you can use all classes and methods in both Swift and Objective-C.

```swift
import SendbirdChatSDK
```

<br />

## Sending your first message

Now that the Chat SDK has been imported, we're ready to start sending a message.

**Note**: The methods in the following steps are all **asynchronous**, excluding the `SendbirdChat.initialize(:)`. This means that when using **asynchronous** methods, client apps must receive success callbacks from Sendbird server through completion delegates in order to proceed to the next step. A good way to do this is the nesting of methods.

### Authentication

In order to use the features of the Chat SDK, you should initiate the `SendbirdChatSDK` instance through user authentication with Sendbird server. This instance communicates and interacts with the server based on an authenticated user account, and then the user’s client app can use the Chat SDK's features.

Here are the steps to sending your first message using Chat SDK:

<br />

### Step 4: Initialize the Chat SDK

Now, initialize the Chat SDK in the app to allow the Chat SDK to respond to changes in the connection status in iOS client apps. Initialization requires the `App ID`, which can be found in the [Sendbird Dashboard](https://dashboard.sendbird.com).

Before calling the `initialize(params:migrationStartHandler:completionHandler:)` method, create a `InitParams` object with your Sendbird application ID. In the params, you can also determine whether to enable local caching or not.

```swift
let initParams = InitParams(
   applicationId: APP_ID,
   isLocalCachingEnabled: true,
   logLevel: .info
)

SendbirdChat.initialize(params: initParams) {
   // Migration starts.
}, completionHandler: { error in
   // Migration is completed.
}

```

The `completionHandler` gets the initialization status through different event handlers. The `migrationStartHandler` is called when there's an upgrade in the local database. Meanwhile, the `completionHandler` informs the client app whether the initialization is completed.

If the initialization fails when you set the `isLocalCachingEnabled` to **true**, the SDK will operate normally and change the value of the `isLocalCachingEnabled` to **false**. If you still wish to use the local caching, clear the database using the `clearCachedData(completionHandler:)` and try the initialization again with the `isLocalCachingEnabled` set to **true**.

> **Note**: The `initialize(params:migrationStartHandler:completionHandler:)` method of a `SendbirdChatSDK` instance must be called across a client app at least once. We recommend that you initialize Sendbird Chat SDK through the `application:didFinishLaunchingWithOptions:` method of the `AppDelegate` instance.

<br />

### Step 5: Connect to Sendbird server

After initialization by use of the `init()` method, your client app must always be connected to Sendbird server before calling any methods. If you attempt to call a method without connecting, an `ERR_CONNECTION_REQUIRED (800101)` error would return.

Connect a user to Sendbird server either through a unique user ID or in combination with an access or session token. Sendbird prefers the latter method, as it ensures privacy with the user. The former is useful during the developmental phase or if your service doesn't require additional security.

#### A. Using a unique user ID

Connect a user to Sendbird server using their unique **user ID**. By default, Sendbird server can authenticate a user by a unique user ID. Upon request for a connection, the server queries the database to check for a match. Any untaken user ID is automatically registered as a new user to the Sendbird system, while an existing ID is allowed to log indirectly. The ID must be unique within a Sendbird application, such as a hashed email address or phone number in your service.

This allows you to get up and running without having to go deep into the details of the token registration process, however make sure to enable enforcing tokens before launching as it is a security risk to launch without.

```swift
SendbirdChat.connect(userId: USER_ID) { user, error in
   guard let user = user, error == nil else {
       return // Handle error.
   }

   // The user is connected to the Sendbird server.
}
```

#### B. Using a combination of unique user ID and token

Sendbird prefers that you pass the APP ID through the use of a token, as it ensures privacy and security for the users. [Create a user](https://sendbird.com/docs/chat/v3/platform-api/guides/user#2-create-a-user) along with their access token, or [issue an session token](https://sendbird.com/docs/chat/v3/platform-api/user/managing-session-tokens/issue-a-session-token) to pass during connection. A comparison between an access token and session token can be found [here](https://sendbird.com/docs/chat/v3/platform-api/user/managing-session-tokens/issue-a-session-token). Once a token is issued, a user is required to provide the issued token in the `SendbirdChat.connect()` method which is used for logging in.

1. Using the Chat Platform API, create a Sendbird user account with the information submitted when a user signs up your service.
2. Save the user ID along with the issued token to your persistent storage which is securely managed.
3. When the user attempts to log in to the Sendbird application, load the user ID and token from the storage, and then pass them to the `SendbirdChat.connect()` method.
4. Periodically replacing the user's token is recommended to protect the account.

```swift
SendbirdChat.connect(userId: USER_ID, authToken: AUTH_TOKEN) { user, error in
   guard let user = user, error == nil else {
       return // Handle error.
   }

   // The user is connected to the Sendbird server.
}
```

<br />

### Step 6: Create a new open channel

Create an open channel using the following codes. [Open channels](https://sendbird.com/docs/chat/v4/ios/channel/overview-channel#2-open-channel) are where all users in your Sendbird application can easily participate without an invitation.

```swift
let params = OpenChannelCreateParams()
params.name = CHANNEL_NAME

OpenChannel.createChannel(params: params) { openChannel, error in
   guard let openChannel = openChannel, error == nil else {
       return // Handle error.
   }

   // An open channel is successfully created.
   // Through the openChannel parameter of the callback method,
   // you can get the open channel's data from the Sendbird server.
}
```

**Note**: You can also create a group channel to send a message. To learn more, see [Create a channel](https://sendbird.com/docs/chat/v4/ios/channel/creating-a-channel/create-a-channel#2-group-channel) in the Group channel page.
<br />

### Step 7: Enter the channel

Enter the open channel to send and receive messages.

```swift
openChannel.enter { error in
   guard error == nil else {
      return
   }
   // The current user successfully enters the open channel,
   // and can chat with other users in the channel by using APIs.
}
```

<br />

### Step 8: Send a message to the channel

Finally, send a message to the channel you entered. To learn more about the message type you can send, see [Messages](https://sendbird.com/docs/chat/v3/platform-api/message/message-overview).

```swift
openChannel.sendUserMessage(MESSAGE) { userMessage, error in
   guard let userMessage = userMessage, error == nil else {
       return // Handle error.
   }

   // The message is successfully sent to the channel.
   // The current user can receive messages from other users through
   // the channel(_:didReceiveMessage:) method of an event delegate.
}
```

<br />

### Step 9: Receive a message

Add the `OpenChannelDelegate.channel(_:didReceive:)` [event delegate](https://sendbird.com/docs/chat/v4/ios/event-delegate/managing-channel-delegates/add-or-remove-a-channel-delegate) using the `SendbirdChat.addChannelDelegate(_:identifier:)` method so that you can receive the message you just sent to the channel. You can also see the message on our dashboard.

```swift
class ViewController: UIViewController, OpenChannelDelegate {
   override func viewDidLoad() {
       super.viewDidLoad()
       SendbirdChat.addChannelDelegate(self, identifier: CLASS_IDENTIFIER) // Replace  CLASS_IDENTIFIER with a unique identifier for this delegate.
   }

   func channel(_ channel: BaseChannel, didReceive message: BaseMessage) {
       // A message is received in the channel.
   }
}
```

<br />

## We are hiring

At Sendbird, we are a diverse group of humble, friendly, and hardworking individuals united by a shared purpose to build the next generation of mobile & social technologies, across chat, voice, and video, that are changing the way we work and live. We're always looking for great people to join our team. [Check out our careers page](https://sendbird.com/careers) for more information.
