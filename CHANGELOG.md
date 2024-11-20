# Changelog

## 4.23.0 (Nov 20, 2024)

### **Features**
SDK now supports `Custom Report Categories` configured through Sendbird Dashboard, which takes effect after restarting the app.
Previous report categories will remain until app restart.

- Added `SendbirdChat.getReportCategoryInfoList(completionHandler:)`
- Added `ReportCategoryInfo`
    - Added new `report()` methods with using `ReportCategoryInfo`

        ```swift
        class SendbirdChat {
            // Fetch list of `ReportCategoryInfo`
            public static func getReportCategoryInfoList(completionHandler: ReportCategoryInfoListHandler? = nil)
        }

        class BaseChannel {
            public func report(
                reportCategoryInfo: ReportCategoryInfo,
                reportDescription: String?,
                completionHandler: SBErrorHandler?
            )
            public func reportUser(
                _ offendingUser: User,
                reportCategoryInfo: ReportCategoryInfo,
                reportDescription: String?,
                completionHandler: SBErrorHandler?
            )
            public func reportMessage(
                _ message: BaseMessage,
                reportCategoryInfo: ReportCategoryInfo,
                reportDescription: String?,
                completionHandler: SBErrorHandler?
            )
        }
        ```
- Deprecated `ReportCategory`
    - Deprecated `BaseChannel.report(category:reportDescription:completionHandler:)`
    - Deprecated `BaseChannel.report(offendingUser:reportCategory:reportDescription:completionHandler)`
    - Deprecated `BaseChannel.report(message:reportCategory:reportDescription:completionHandler)`

### Improvement
- Improved SDK's memory cache management.

## 4.22.1 (Nov 08, 2024)

### Improvements
- Fixed bug where `Reaction.hasCurrentUserReacted` doesn’t give correct value in some cases
- Fixed bug where `GroupChannelCollection.loadMore` gives incorrect channels when created with `GroupChannelListQuery` with `latestLastMessage` order


## <strike>4.22.0 (Nov 07, 2024)</strike> *DEPRECATED*
**Deprecated as this version causes wrong ordering of channels from `GroupChannelCollection.loadMore()` when the collection is created by `GroupChannelListQuery` with `.latestLastMessage` order.**
#### Features
- Added new properties in `Reaction` to support more users
    ```swift
    class Reaction {
        
        /// A list of sampled userIds that have reacted to this Reaction.
        public var sampledUserIds: [String]
        
        /// A count of the number of users who have reacted to this.
        public var count: UInt
        
        /// A flag indicating whether the current user has reacted to this.
        public var hasCurrentUserReacted: Bool
    }
    ```
- Added a property and classes for representing template messages.
    - Introduced `ContainerOptions` class
    - Introduced `SimpleTemplateData` class
    - Introduced `TemplateMessageData` class
    - Added `templateMessageData` property of type `TemplateMessageData` to `BaseMessage` class
- Added `BaseChannel.deleteMessage(messageId:hardDelete:completionHandler:)` to hard delete the message


## 4.21.10 (Oct 28, 2024)

## Improvements 
- Disabled read/unread member count for `AdminMessage`

## 4.21.9 (Oct 21, 2024)


## Improvements
- Improved logic to prevent crashes in `SessionWebSocketEngine`

## 4.21.8 (Oct 08, 2024)


## Improvements
- Fixed a crash in `ChunkRange.contains(_:)` logic

## 4.21.7 (Oct 03, 2024)


## Improvements
- Fixed occasional crash in `SessionWebSocketEngine.listen()` when reconnecting.

## 4.21.6 (Sep 26, 2024)


## Improvements
- Improved `SendbirdChat.initialize()` and `SendbirdChat.connect()` speed when `isLocalCachingEnabled` is true
- Improved handling events related to reactions
- Fixed a bug where a channel gets unexpectedly unhidden upon receiving a new message

## 4.21.5 (Sep 23, 2024)


## Improvements
- Fixed a crash in range check logic

## 4.21.4 (Sep 23, 2024)


## Improvements
- Added timeout in `GroupChannelCollection.loadMore()` to prevent long delay during fetching channels
- Fixed a bug where non-operator's message affects the last message and the unread message count for exclusive channels
- Modified `GroupChannel.markAsRead` behavior when called multiple times so that `GroupChannelDelegate.channelWasChanged(channel)` gets called when the unread count gets cleared

## 4.21.3 (Sep 11, 2024)


## Improvements
- Fixed bug where `requestId` is not being set properly when sending a user message

## 4.21.2 (Sep 10, 2024)


## Improvements
- Fixed internal `messageChangeLog` in `MessageCollection` not updating to correct next token.

## 4.21.0 (Aug 29, 2024)


## New Interfaces
- Supports customTypes filtering on gets unreadItemCount
  - Added `getUnreadItemCount(params:completionHandler:)` method in `SendbirdChat` class
  - Added `GroupChannelUnreadItemCountParams` class
  - Deprecated `getUnreadItemCount(key:completionHandler:)` method in `SendbirdChat` class
- Added `EventDetail` in `ChannelContext` to hold detailed information of channel events
  - i.e. Getting an inviter/invitees information when a channel has been added from receiving an invitation:
       ```swift
       func addedChannels( _ collection: GroupChannelCollection, context: ChannelContext, addedChannels: [GroupChannel]) {
           if let detail = context.eventDetail as? EventDetail.UserReceivedInvitation {
               let inviter = detail.inviter
               let invitees = detail.invitees
           }
       }
       ```
- Added interfaces for `MessageForm` to work with Sendbird dashboard  
(`Form` interfaces have been deprecated)
  - Added `submitMessageForm(completionHandler:)` method in `BaseMessage` class
  - Added `messageForm` property in `BaseMessage` class
  - Added `MessageForm` class
  - Added `MessageFormItem` class
  - Added `MessageFormItem.Style` class
  - Added `MessageFormItem.LayoutType` enum
  - Added `MessageFormItem.ResultCount` enum
  - Deprecated `submitForm(form:completionHandler)` method in `BaseMessage` class
  - Deprecated `forms` property in `BaseMessage` class
  - Deprecated `Form` class and interfaces
  - Deprecated `FormField` class and interfaces
  - Deprecated `FormFieldAnswer` class and interfaces

## Improvements
- Fix invalid query parameter value in `getTotalScheduledMessageCount` request

## 4.20.0 (Aug 07, 2024)

## New Interfaces
- Support pinned message in `OpenChannel`
    - Added `pinnedMessageIds` property in `BaseChannel`
    - Added `lastPinnedMessage` property in `BaseChannel`
    - Added `pinMessage` method in `BaseChannel`
    - Added `unpinMessage` method in `BaseChannel`
    - Added `channelDidUpdatePinnedMessages` in `OpenChannelDelegate`
    - Improved `SendbirdChat.createPinnedMessageListQuery` to use in `OpenChannel`

## Improvements
- Added `hasBot` and `hasAIBot` properties in `GroupChannel`

## 4.19.9 (Jul 26, 2024)

## Improvements
- Fixed an issue with apiResult of the handler of `MessageCollection` receiving messages from a point in time before `resetMyHistory()` call
- Fixed to remove messages before resetMyHistory time from database when calling resetMyHistory
- Fixed for freeze status not updating
- Fixed timing for updating the count of participants

## 4.19.8 (Jul 09, 2024)

## Improvements
- Deprecated `SendbirdChat.authenticateFeed`; Please use `SendbirdChat.authenticate` instead. 
- Added `SendbirdChat.getTotalUnreadNotificationsCount` to get the total unread notification count of the user.
- Renamed `markAsViewed(messages:)` to `logViewed(messages:)`.
- Added push notification handling methods to accept the API host as a parameter for sending delivered and clicked requests.
    - `SendbirdChat.markPushNotificationAsDelivered(apiHost:remoteNotificationPayload:completionHandler:)`
    - `SendbirdChat.markPushNotificationAsClicked(apiHost:remoteNotificationPayload:completionHandler:)`
- Fixed an issue where `RequestHeadersContext` crashes due to `_swift_release_dealloc`. 

## 4.19.7 (Jun 13, 2024)

## Improvements
- Add macOS support.
- Add static library SDK.
- Fixed `Reaction` `hash` and `isEqual` to reflect same properties.

## 4.19.6 (May 30, 2024)

## Improvements
- Fixed an arithmetic overflow issue when entering a GroupChannel.  

## 4.19.5 (May 21, 2024)

## Improvements
- Fixed `reportUsers` request failure issue
- Fixed integer overflow when trying to access `Reaction.hash`
- Improved stability

## 4.19.4 (May 17, 2024)

## Improvements
- Fixed `reportUsers` request failure issue
- Fixed an issue with submitform request not working correctly
- Reduced the network traffic for the stats
- Improved stability

## 4.19.3 (May 02, 2024)

## Improvements
- Improved huge gap checking and message fill logic
- Fixed a bug where the API host setting is not applied to `authenticateFeed()`

## 4.19.2 (Apr 12, 2024)

## Improvements
- Fixed feedback status changing when feedback payload is encoded
- Removed `v` from Sendbird ChatSDK tags
- SwiftLint integration and warning fixes
- Improved stability 

## v4.19.1 (Apr 05, 2024)

- Improved stability.
- Fixed feedback status changing when feedback payload is encoded.

## v4.19.0 (Apr 04, 2024)

- Updated iOS deployment target to 12.0
- Updated Xcode version to 15.0 for building SendbirdChatSDK framework
- Added `PrivacyInfo.xcprivacy` for [Apple Privacy Manifest](https://developer.apple.com/documentation/bundleresources/privacy_manifest_files)

## v4.18.0 (Mar 28, 2024)

### New Interfaces
- Added `keys` filter to `MessageTemplateListParams`
- Added `markPushNotificationAsClicked(remoteNotificationPayload:completionHandler:)` to `SendbirdChat`
- Added `markAsViewed(messages:)` to `FeedChannel`
  - Deprecated `logImpression(messages:)` in `FeedChannel`
- Added `logClicked(message:)` to `FeedChannel`

### Improvements
- Fixed a bug where the `myLastRead` was updated with the improper timestamp
- Improved stability

## v4.17.0 (Feb 28, 2024)

### New Interfaces
- Added message template interfaces
    - Added classes
        - `MessageTemplateListParams` class
        - `MessageTemplate` class
        - `MessageTemplateInfo` class
        - `MessageTemplateList` class
    - Added functions
        - `getMessageTemplateList(token:params:completionHandler:)` function in `SendbirdChat` class
        - `getMessageTemplate(key:completionHandler:)` function in `SendbirdChat` class
    - Added handlers 
        - `MessageTemplateHandler` in `Handlers` class
        - `MessageTemplateListHandler` in `Handlers` class
    - Added `messageTemplateInfo` property in `AppInfo` class

### Improvements
- Fixed negative value setting case when backsync progress
- Improved stability

## v4.16.1 (Feb 21, 2024)

### Improvements
- Fix an issue where the `completionHandler` of `sendFileMessage` would be called multiple times. 

## v4.16.0 (Feb 16, 2024)

### New Interfaces 
- Added the `notificationPriority` property to `BaseMessage` class

### Improvements
- Fixed `.data` of `MultipleFilesMessage`
- Fixed `UploadedFileInfo.thumbnail.url` returning a `plainURL` without `eKey` when file encryption attribute is ON 

## v4.15.4 (Feb 14, 2024)

- Fixed a bug where the stat collector is not enabled when the `authenticateFeed()` is used
- Fixed a bug where the unread message count of feed channel becomes zero when the SDK receives a message from the chat notification channel
## v4.15.3 (Feb 02, 2024)

- Improved unread message count logic

## v4.15.2 (Jan 31, 2024)

- Improved stability

## v4.15.1 (Jan 12, 2024)

- Initialization improving
  - Added `needsSynchronous` property in `InitParams` class
  - Added `init(applicationId:isLocalCachingEnabled:localCacheConfig:logLevel:appVersion:needsSynchronous:)` method in `InitParams` class
  - Added `InitializationState` enum
  - Added `executeOrWaitForInitialization(executeHandler:)` method in SendbirdChat
  - Deprecated `initializeSynchronously(params: InitParams)` method in `SendbirdChat`.
    - Set `needsSynchronous` in `InitParams` to `true` and use `initialize(params:migrationStartHandler:completionHandler:)` instead.
  - Modified qos priority of local caching migration queue
- Added `inMemoryUserInfo` property in `BaseMessage`
- Fixed feedback not working correctly
- Added localizedFailureReason for `ChatError.connectionCanceled` error when the app moved to background while connecting
- Improved stability

## v4.15.0 (Jan 12, 2024)

### **Improvements**

- Improved stability

## v4.14.2 (Dec 28, 2023)

### **Improvements**

- Improved stability

## v4.14.1 (Dec 21, 2023)

### **Improvements**

- Added `Form`, `FormField` and `FormFieldAnswer` model classes.
- Added `submitForm(form:completionHandler:)` public interface.
- Added `forms` and `suggestedReplies` properties in `BaseMessage`.

## v4.14.0 (Dec 19, 2023)

### **Improvements**

- Added `Feedback` and `Feedback.Status` model classes
- Added public interfaces methods in `BaseMessage` 
   - Added `submitFeedback(rating:comment:completionHandler:)`
   - Added `updateFeedback(rating:comment:completionHandler:)`
   - Added `deleteFeedback(completionHandler:)`
- Fixed a bug where the `messageCollection(_:context:channel:addedMessages:)` is not invoked after reconnecting if the `MessageCollection` object was created for an empty group channel

## v4.13.2 (Dec 14, 2023)

### **Improvements**

- Fixed group channel's metadata being overwritten by group channel changelog when using local caching without turning on the app attribute `enable_changelog_metadata`
- Updated SendbirdChatSDK licenses
- improve Stability

## v4.13.1 (Dec 01, 2023)

### **Improvements**
- Fixed a bug where the order of the messages from the `messageCollection(_:context:channel:addedMessages:)` delegate was not sequential

## v4.13.0 (Nov 24, 2023)

### **Improvements**
- Added `logCustom()` in `FeedChannel` to log custom stat
- Added `NotificationMessageStatus` to represent whether the message was read or not
- Changed to not change channel's `isDirty` property when app switches from background to foreground
- Removed rate limit from markAsRead
- Improved logic to call the API in unnecessary situations in the `getChannel` while using local caching
- Improved stability

## v4.12.3 (Oct 31, 2023)

- Improved stability

## v4.12.2 (Oct 27, 2023)

- Added methods on `GroupChannel`
  - `getDeliveryStatus(includeAllMembers:)`
  - `getDeliveryStatusAsObjects(includeAllMembers:)`
  - `getReadStatusAsObjects(includeAllMembers:)`
- Added `DeliveryStatus`, `ReadStatus`
- Fixed Syntax error in SQL statement
- Added `extendedMessagePayload` property to `BaseMessage`
- Improved stability

## v4.12.1 (Oct 12, 2023)

### **Improvements**
- Fixed a bug where the callback of `__getUIKitConfiguration()` can be called twice.
- Stability improvements.

## v4.12.0 (Sep 25, 2023)

### **Improvements**
- Fixed an issue where `MessageCollection` doesn't update messages when reconnected.
- Stability improvements.

## v4.11.1 (Sep 15, 2023)

### **Improvements**
- Fixed an issue where `MessageCollection` doesn't update messages when reconnected.
- Stability improvements.

## v4.11.0 (Sep 01, 2023)

### **Improvements**

- Added `createdBefore` and `createdAfter` filters in GroupChannelListQueryParams and PublicGroupChannelListQueryParams.
- Added `enableAutoResend` in `InitParams.LocalCacheConfig` to control auto-resending feature when local cache is enabled.
- Added `NotificationData` class.
- Added `isCategoryFilterEnabled` property in `FeedChannel`.
- Added `isTemplateLabelEnabled` property in `FeedChannel`.
- Added `categories` property in `FeedChannel`.

## v4.10.0 (Aug 18, 2023)

### **Features**

- You can mark push notifications as delivered within the SDK, tracking delivery status.
  - Added `SendbirdChat.markPushNotificationAsDelivered`.

```swift
SendbirdChat.markPushNotificationAsDelivered(remoteNotificationPayload: payload)
```

- Added 'SendbirdChat.authenticateFeed' for Sendbird Notifications
- Added 'SendbirdChat.refreshNotificationCollections' for Sendbird Notifications

### **Improvements**

- Fixed a bug where the group channel changelogs did not update the group channel metadata
- Added `copyMultipleFilesMessage(_:toTargetChannel:completionHandler:)`
- Added `resendMultipleFilesMessage(_:fileUploadHandler:completionHandler:)`
- Stability improvements.

## v4.9.6 (Jul 21, 2023)

### **Improvements**

- Fixed a bug where the group channel changelogs did not update the group channel metadata

## v4.9.5 (Jul 13, 2023)

### **Improvements**

- Resolved the inconsistency between WebSocket connection state and network reachability
- Fixed a crash that can happen when SessionExpiredEvent is received
- Improved stability

## v4.9.4 (Jul 11, 2023)

### **Improvements**

- Added `isBot` property in `User` model to identify whether the sender is a Bot

## v4.9.3 (Jun 27, 2023)

### **Improvements**

- Fixed a bug where GroupChannelDelegate method func `channelDidUpdateTypingStatus(_ channel: GroupChannel)` was not being called when a typer becomes idle

## v4.9.2 (Jun 22, 2023)

### **Improvements**

- Fixed a security flaw related to the connection
- Fixed a bug where a group channel can be filtered out when a message in the channel is removed
- Improved stability

## v4.9.1 (Jun 14, 2023)

### **IMPORTANT NOTICE**

```diff
iOS Chat SDK version `4.9.0` has a bug where FileMessage is not received. Please skip version `4.9.0`, and update to version **`4.9.1`** or above instead.
```

### **Improvements**

- Fixed FileMessage being parsed as MultipleFilesMessage

## v4.9.0 (Jun 09, 2023)

### **Features**

### MultipleFilesMessage

You can send a `MultipleFilesMessage` that contains multiple files in a single message via `GroupChannel.sendMultipleFilesMessage(params:fileUploadHandler:completionHandler:)`

- Added `MultipleFilesMessage`.
- Added `GroupChannel.sendMultipleFilesMessage`, `MultipleFilesMessageCreateParams`, `UploadableFileInfo` and `UploadedFileInfo`.
- Added `MultipleFilesMessageHandler` and `FileUploadHandler`.
- Added `SendbirdChat.getMultipleFilesMessageFileCountLimit()` that indicates the maximum count of files that can be included in a single message.

```swift
let params = MultipleFilesMessageCreateParams(
    uploadableFileInfoList: [UploadableFileInfo(file: file), UploadableFileInfo(fileURL: fileUrl)]
)

channel.sendMultipleFilesMessage(
    params: params,
    fileUploadHandler = { requestId, index, uploadableFileInfo, error ->
        // handle the upload result of each UploadableFileInfo.
    },
    completionHandler = { message, error ->
        // handle the result of sending MultipleFilesMessage.
    }
)
```

## v4.8.6 (Jun 07, 2023)

### Improvements

- Fixed not to hang main thread when requesting huge gap API
- Fixed issues in `MessageCollection.startCollection` and `NotificationCollection.startCollection`
  - Fixed an error that returned duplicate cache messages
  - Fixed an issue that did not fetch cache messages based on starting point
- Resolved DB migration issue

## v4.8.5 (May 24, 2023)

### Improvements

- Fixed `MessageCollectionDelegate.messageCollection(_:context:channel:updatedMessages:)` to be invoked after sending a message via API fallback
- Fixed `GroupChannelCollectionDelegate.channelCollection(_:context:addedChannels:)` to not be invoked for added messages until `loadMore` is called in `GroupChannelCollection`

## v4.8.4 (May 17, 2023)

### Improvements

- Improved stability

## v4.8.3 (May 16, 2023)

### Improvements

- Improved stability

## v4.8.2 (May 12, 2023)

- Added `includeParentMessageInfo` to `PinnedMessageListQueryParams`

## v4.8.1 (May 10, 2023)

### **Improvements**

- Fixed a crash issue that occurred when encoding `User`

## v4.8.0 (May 03, 2023)

### **Features**

### PinnedMessageListQuery

You can now retrieve all pinned messages within a GroupChannel by the `PinnedMessageListQuery`.

- Added `PinnedMessage`
- Added `PinnedMessageListQuery`, `PinnedMessageListQueryParams`
- Added `createPinnedMessageListQuery(params:)` for `GroupChannel` object

```swift
let queryParams = PinnedMessageListQueryParams { params in
    params.limit = 20
    // Set other properties in `params`
}
self.query = channel.createPinnedMessageListQuery(queryParams)
self.query.loadNextPage { messages, error in
    // Handle result
}
```

### **Improvements**

- Added URL encoding for `userId` with non-ascii characters

## v4.7.0 (Apr 26, 2023)

### **Features**

### (Moderation) Automatically detect when user is unmuted

You can now automatically detect when a muted user is unmuted by leveraging `MessageCollection`.
Clients will now receive `MessageCollectionDelegate.messageCollection(_:context:updatedChannel:)` with `CollectionEventSource.eventUserUnmuted` when an user is unmuted after their muted duration has expired, on top of explict unmute calls. This now means that you can easily transition user’s experience and allow them to chat even more seamlessly.
Note that this is a MessageCollections only feature! We recommend all of our clients to give it a try if you haven’t : )

### Improvements

- Updated iOS deployment target to 11.0 for Xcode 14.1+
- Fixed crash issue that occurred when encoding GroupChannel

## v4.6.7 (Apr 19, 2023)

### Improvements

- Improved stability

## v4.6.6 (Apr 12, 2023)

### Improvements

- Changed default value of nextResultSize and prevResultSize in MessageCollection to 40
- Stability improvements

## v4.6.5 (Apr 10, 2023)

- Fixed a bug where a group channel collection returns channels for other user who used the device

## v4.6.4 (Apr 04, 2023)

- Fixed an error where the previous user's channels remained in the database

## v4.6.3 (Mar 30, 2023)

- Fixed a bug where a group channel collection could return duplicated channels
- Improved local caching hit ratio

## v4.6.2 (Mar 24, 2023)

### Improvements

- Fixed group channel collection's channelList not being updated properly after hiding a channel
- Added ephemeral support for open channels
- Fixed a bug where the 'Allowed domains' denies the connection from the SDK

## v4.6.1 (Mar 20, 2023)

### Improvements

- Fixed an issue where network wouldn't properly reconnect when connect() is called again with a different user id

## v4.6.0 (Mar 14, 2023)

### **Features**

### **Set your own Local Caching DB size**

You can now control the size of your local cache. Starting from 64mb, decide how much you want to store (Default: 256mb).
Once the size limit is reached, the SDK will automatically remove messages and channels with pre-specified logic (`clearOrder`) so that you don't have to actively manage it.

- Added DB size related properties in `LocalCacheConfig`

```swift
let localCacheConfig = LocalCacheConfig()
localCacheConfig.maxSize = 256
localCacheConfig.clearOrder = .messageCollectionAccessedAt
```

- Added SendbirdChat.getTotalUnreadMessageCountWithFeed(params:completionHandler:)
  - Deprecated SendbirdChat.getTotalUnreadMessageCount(params:completionHandler:)
- Added UserEventDelegate.didUpdateTotalUnreadMessageCount(unreadMessageCount:)
  - Deprecated UserEventDelegate.didUpdateTotalUnreadMessageCount(\_:totalCountByCustomType:)

## v4.5.3 (Mar 10, 2023)

- Fixed an issue where push notification doesn't get delivered to some users

## v4.5.2 (Mar 08, 2023)

## Features

### Encrypting Local Caching

Locally saved chats in your user's device can now be encrypted with `FileProtectionType.completeUnlessOpen` protection level.
To enable this protection, please refer to below guide and API Reference.

### Brief guide

When creating `InitParams`, set `LocalCacheConfig.isEncryptionEnabled` to `true`. This option is turned off by default, so you don't have to set anything up if you don't intend to use it.

```Swift
let localCacheConfig = LocalCacheConfig(isEncryptionEnabled: true)
let initParams = InitParams(
    applicationId: appId,
    isLocalCachingEnabled: true,
    localCacheConfig: localCacheConfig
)
```

## v4.5.1 (Mar 07, 2023)

### **Improvements**

- Fixed not to delete pendingPushToken after applying cache configuration

## v4.5.0 (Mar 03, 2023)

> :warning: **DO NOT USE THIS VERSION**: There is a bug where the pending push token is removed after connecting a user.

### **Features**

### **Polls in Open Channel**

Polls is now supported in both Open Channels and Group Channels!

#### **Specification**

Moved following methods from `GroupChannel` to `BaseChannel`:

- func updatePoll(pollId: Int64, params: PollUpdateParams, completionHandler: PollHandler?)
- func deletePoll(pollId: Int64, completionHandler: SBErrorHandler?)
- func closePoll(pollId: Int64, completionHandler: PollHandler?)
- func addPollOption(pollId: Int64, optionText: String, completionHandler: PollHandler?)
- func updatePollOption(pollId: Int64, pollOptionId: Int64, optionText: String, completionHandler: PollHandler?)
- func deletePollOption(pollId: Int64, pollOptionId: Int64, completionHandler: SBErrorHandler?)
- func votePoll(pollId: Int64, pollOptionIds: [Int64], completionHandler: PollVoteEventHandler)
- func getPollChangeLogs(token: String?, completionHandler: PollChangeLogsHandler?)
- func getPollChangeLogs(timestamp: Int64, completionHandler: PollChangeLogsHandler?)
- func createPollListQuery(limit: UInt = 20) -> PollListQuery?
- func createPollVoterListQuery(pollId: Int64, pollOptionId: Int64, limit: UInt = 20) -> PollVoterListQuery

Added the following interfaces in OpenChannelDelegate:

- func channel(\_ channel: OpenChannel, didUpdatePoll event: PollUpdateEvent)
- func channel(\_ channel: OpenChannel, didVotePoll event: PollVoteEvent)
- func channel(\_ channel: OpenChannel, pollWasDeleted pollId: Int64)

Added the following interfaces in Polls:

- `Poll.serialize()`
- `Poll.build(fromSerializedData:)`

### **Improvements**

- Fixed a bug where the size of the DB file was not being updated after disconnection

## v4.4.0 (Feb 22, 2023)

> :warning: **DO NOT USE THIS VERSION**: There is a bug where the pending push token is removed after connecting a user.

### **Features**

### Disconnect Websocket only

When you call `SendbirdChat.disconnect`, it disconnects the WebSocket and clears local cache. You can think of it as logging out.

In some cases, you need to only disconnect the WebSocket. You can now do it by calling `SendbirdChat.disconnectWebSocket`.
It only disconnects the WebSocket and preserves the local cache.

```swift
SendbirdChat.disconnectWebSocket {
    // onDisconnected
}
```

To connect again after disconnecting with `disconnectWebSocket()`,
use [SendbirdChat.connect()](https://sendbird.com/docs/chat/v4/ios/application/authenticating-a-user/authentication#2-connect-to-the-sendbird-server-with-a-user-id).

```swift
SendbirdChat.connect(userId: userId) { user, error in
    if let user = user {
        // onConnected
    } else {
        // Handle error.
    }
}
```

### **Improvements**

- Fixed to prevent initializing SendbirdChat multiple times with same `applicationId` and `isLocalCachingEnabled`

## v4.3.2 (Feb 16, 2023)

> :warning: **DO NOT USE THIS VERSION**: There is a bug where the pending push token is removed after connecting a user.

- Fixed group channel querying with nickname filters (`nicknameContainsFilter`, `nicknameExactMatchFilter`, `nicknameExactMatchFilter`) to behave the same whether or not local caching is enabled

## v4.3.1 (Feb 15, 2023)

> :warning: **DO NOT USE THIS VERSION**: There is a bug where the pending push token is removed after connecting a user.

- Added default value for `params` argument in each interface:
  - `BaseChannel.getMessageChangeLogs(token:params:completionHandler)`
  - `BaseChannel.getMessageChangeLogs(timestamp:params:completionHandler)`
  - `SendbirdChat.getMyGroupChannelChangeLogs(token:params:completionHandler)`
  - `SendbirdChat.getMyGroupChannelChangeLogs(timestamp:params:completionHandler)`
- `registerDevicePushToken(_:unique:completionHandler:)` passes error to completionHandler when called before SendbirdChat is initialized
- Fix a bug that the collection's callback is not called

## v4.3.0 (Feb 01, 2023)

### **Features**

Participant class in Open Channel

Participant is a new interface for User who joined Open Channel. It's optimized for scalability and contains much lighter information about the User than a Member in Group Channel.
Now clients can implement Open Channels easier in SDK with more built-in capabilities. You can compare how Member, Participant, and User are different [here]("https://sendbird.com/docs/chat/v4/ios/user/overview-user#2-user-types").

- `Participant` holds essential information about the participant like below. They contain their muted status (`is_muted`) on top of basic User information.

```
@objc(SBDParticipant)
public class Participant: User {

    @objc
    public internal(set) var isMuted: Bool

    @objc
    public func serialize() -> Data?

    @objc
    public class func build(fromSerializedData data: Data?) -> Self?
}
```

- `ParticipantListQuery.loadNextPage(completionHandler: @escaping UserListHandler)` now returns `[Participant]`
  - For backward compatibility, the `UsersHandler` returns `User` list, but it can be casted into `Participant`

## v4.2.4 (Jan 20, 2023)

### **Features**

You can now set longer timeout value (Previously 10s) for session token expiry. (Default: 60s, Maximum: 1800s). This means that Sendbird SDK will wait longer for your new session token, making it easier for you to reconnect to our service.

- `@objc class func setSessionTokenRefreshTimeout(_ timeout: Int)`

### **Improvements**

- Fixed bug where `BaseChannelHandler.onChannelChanged` and `GroupChannelHandler.onPinnedMessageUpdated` are not being called when the pinned message is updated
- Fixed channelURL filter not working when fetching pendingMessage
- Fixed wrong channels being returned in copyMessage completionHandler

### **Improvements**

- Improved database synchronization stability

## v4.2.2 (Jan 04, 2023)

### **Improvements**

- Fixed a bug where unread count of channels is not updated in time
- Changed to ensure reachability notification is called on the main thread

## v4.2.1 (Dec 15, 2022)

### **Improvements**

- Fixed a bug where channel filters (ex: `channelURLFilter`) were not applied properly in `GroupChannelCollection`

## v4.2.0 (Dec 9, 2022)

### **Features**

### **Pinned Message :pushpin:**

Pinned Message is released. You can now maintain a special set of messages (up to 10 per channel) that you want everyone in the channel to share. It can be anything from announcements, surveys, upcoming events, and any many more. Pin your messages and never miss them!
Stay tuned for updates as we are rolling out more exciting features and see below for exact specifications:point_down:

#### **Specification**

- Pin when sending a message
  - `UserMessageCreateParams.isPinnedMessage: Bool = false`
  - `FileMessageCreateParams.isPinnedMessage: Bool = false`
- Pin existing message
  - `GroupChannel.pinMessage(messageId:completionHandler:)`
- Unpin a message
  - `GroupChannel.unpinMessage(messageId:completionHandler:)`
- Pinned messages
  - `GroupChannel.lastPinnedMessage: BaseMessage? = nil`
  - `GroupChannel.pinnedMessageIds: [Int64]? = nil`

#### **We strongly recommend using Collections (Message, Channel) to implement Pinned Messages as it would automatically take care of numerous events out of the box when messages are created, updated, and deleted.**

---

### **Improvements**

- Added `use_local_cache` to the request header
- Removed internal logs

## v4.1.8 (Dec 02, 2022)

### Improvements

- Added `urlSession(_:task:didCompleteWithError:)` method implementation to the native web socket engine

## v4.1.7 (Nov 29, 2022)

### Improvements

- Fixed a memory leak in the web socket engine
- Added error log when using uninitialized Sendbird instance
- Fixed to upsert channel change into database when receiving events
- Fixed to use cached open channel when receiving system event

## v4.1.6 (Nov 16, 2022)

### Improvements

- Fixed a bug where `GroupChannelCollection::loadMore`'s `completionHandler` is not called under iOS 13

## v4.1.5 (Nov 09, 2022)

### Improvements

- Fixed a crash issue when logging in RequestQueue

## v4.1.4 (Nov 09, 2022)

### Improvements

- Fixed filtering logic (`joinedOnly`) in `GroupChannelListQuery.myMemberStateFilter`
- Fixed an issue where deleted channels remain in the local cache
- Applied atomicity to `cacheChannels`, `hasNext` in `GroupChannelCollection`
- Fixed concurrency issue in `SafeDictionary`

## v4.1.3 (Nov 02, 2022)

### Improvements

- Fixed concurrency issue in `CachedDataMap`

## v4.1.2 (Oct 27, 2022)

- Fixed `MarkAsDelivered(remoteNotificationPayload: completionHandler:)` to work without being connected
- Fixed a deserialized fileMessage's eKey not updating
- Added reachability log
- Fixed concurrency issue on user connection

## v4.1.1 (Oct 21, 2022)

- Fixed a bug where the request ID of the user message response sent through the API is empty
- Fixed a bug when parsing other user's VOTE event
- Fixed a bug where poll changeLog not being delivered in message collection
- Changed PollListQueryParams.limit's defalut value 20 to 10
- Fixed default value of user.isActive

## v4.1.0 (Oct 14, 2022)

# Features

## Polls

Polls is released :tada: Here’s where we think it will be really powerful.

- Collect feedback and customer satisfaction
- Drive engagement by receiving participants in preferences
- Run surveys and quiz shows
- And many more!

## Scheduled messages

Scheduled messages is released Here’s where we think it will be really useful.

- Let your users queue their messages for the future
- Set helpful reminders and notifications to nudge certain actions
- And many more!

## Improvements

Please note that both Polls and Scheduled Messages are released as beta features. Thus specific parameters and properties may change to improve client’s overall experience.

Stay tuned for updates as we are rolling out more exciting features and see below for exact specifications

---

## Specification

### Polls

- Create
  - `Poll.create(params: PollCreateParams, completionHandler: @escaping PollHandler)`
  - `UserMessageCreateParams.pollId`
- Read
  - `Poll.get(params: PollRetrievalParams, completionHandler: @escaping PollHandler)`
  - `SendbirdChat.createPollListQuery(params: PollListQueryParams)`
  - `SendbirdChat.createPollListQuery(paramsBuilder: (PollListQueryParams) -> Void)`
  - `GroupChannel.createPollListQuery(limit: UInt)`
  - `UserMessage.poll`
- Update
  - `GroupChannel.updatePoll(pollId: Int64, params: PollUpdateParams, completionHandler: PollHandler?)`
  - `GroupChannel.closePoll(pollId: Int64, completionHandler: PollHandler?)`
- Delete
  - `GroupChannel.deletePoll(pollId: Int64, completionHandler: SBErrorHandler?)`
- Others:
  - `Poll`
  - `GroupChannel.getPollChangeLogs(token: String?, completionHandler: PollChangeLogsHandler?)()`
  - `GroupChannel.getPollChangeLogs(timestamp: Int64, completionHandler: PollChangeLogsHandler?)()`
  - `PollData`
  - `GroupChannelDelegate.channel(_ channel: GroupChannel, didUpdatePoll event: PollUpdateEvent)`
  - `GroupChannelDelegate.channel(_ channel: GroupChannel, didVotePoll event: PollVoteEvent)`
  - `GroupChannelDelegate.channel(_ channel: GroupChannel, pollWasDeleted pollId: Int64)`

### Options

- Create
  - `PollCreateParams.optionTexts`
  - `GroupChannel.addPollOption(pollId: Int64, optionText: String, completionHandler: PollHandler?)`
- Read
  - `PollOption.getPollOption(params: PollOptionRetrievalParams, completionHandler: @escaping PollOptionHandler)`
  - `SendbirdChat.createPollVoterListQuery(params: PollVoterListQueryParams)`
  - `SendbirdChat.createPollVoterListQuery(paramsBuilder: (PollVoterListQueryParams) -> Void)`
  - `GroupChannel.createPollVoterListQuery(pollId: Int64, pollOptionId: Int64, limit: UInt)`
- Update
  - `GroupChannel.updatePollOption(pollId: Int64, pollOptionId: Int64, optionText: String, completionHandler: PollHandler?)`
  - `GroupChannel.votePoll(pollId: Int64, pollOptionIds: [Int64], completionHandler: PollVoteEventHandler)`
- Delete
  - `GroupChannel.deletePollOption(pollId: Int64, pollOptionId: Int64, completionHandler: SBErrorHandler?)`
- Others:
  - `PollOption`
  - `PollStatus`
  - `PollVoteEvent`
  - `PollUpdateEvent`
  - `CollectionEventSource.eventPollUpdated`
  - `CollectionEventSource.eventPollVoted`
  - `CollectionEventSource.eventPollChangeLog`

---

### Scheduled Messages

- Create
  - `GroupChannel.createScheduledUserMessage()`
  - `GroupChannel.createScheduledFileMessage()`
- Read
  - `ScheduledMessageListQuery`
  - `BaseMessage.getScheduledMessage()`
    - `ScheduledMessageRetrievalParams`
- Update
  - `GroupChannel.updateScheduledUserMessage()`
  - `GroupChannel.updateScheduledFileMessage()`
- Delete
  - `GroupChannel.cancelScheduledMessage()`
- Others
  - `ScheduledInfo`
  - `MessageSendingStatus.scheduled`
  - `BaseMessage.scheduledInfo`
  - `SendbirdChat.getTotalScheduledMessageCount()`
    - `TotalScheduledMessageCountParams`

## v4.0.15 (Oct 12, 2022)

- Added public `make(_ json:)` interface
- Added synchronous initialize for SendbirdChat
- Removed unused keys from body of MarkAsDelivered request

## 4.0.14 (Sep 28, 2022)

- Added nicknameStartsWithFilter, nicknameExactMatchFilter feature in GroupChannelListQuery and its params
- Implemented history of channel membership where clients can now track whether users have joined or left the channel (`MemberState.left` for left members of a `GroupChannel`)
- Resolved priority inversion warning
- Fixed a crash when a large file is sent in the FILE message

## 4.0.13 (Sep 16, 2022)

- Fixed crash issue when using `SendbirdChat.add(_:identifier)`

## 4.0.12 (Sep 14, 2022)

- Added metaData related logic for filtering in GroupChannelListQuery.belongsTo
- Renamed methods in `SendbirdChat`
  - `add(_ delegate: ConnectionDelegate, identifier: String)` -> `addConnectionDelegate(_ delegate: ConnectionDelegate, identifier: String)`
  - `add(_ delegate: BaseChannelDelegate, identifier: String)` -> `addChannelDelegate(_ delegate: BaseChannelDelegate, identifier: String)`
  - `add(_ delegate: UserEventDelegate, identifier: String)` -> `addUserEventDelegate(_ delegate: UserEventDelegate, identifier: String)`

## 4.0.11 (Sep 2, 2022)

- Fixed a bug where a dirty flag of a group channel is handled improperly

## 4.0.10 (Aug 31, 2022)

- Added MessageSearchQuery's totalCount and made it public
- Fixed memory problem when continuously sending large files
- Changed the keywords of the classes and functions below from public to open (subclassing)

User, BaseChannel, GroupChannel, OpenChannel, BaseCollection, GroupChannelCollection, BaseMessage, UserMessage, FileMessage, AdminMessage

Note: However, subclassing is not recommended, and please be aware that any issue that arises from subclassing will take substantially longer time to react

## 4.0.9 (Aug 17, 2022)

- Added shouldRemoveOperatorStatus function
- Updated copyMessage function to only duplicate successfully sent message. Copying any non-successful message will now return an invalidParameter error
- Fixed concurrency issues
- Fixed WS connection being lost after switching from wifi to LTE
- Fixed OpenChannel not updating channel’s changed information
- Fixed a copied fileMessage’s image not being shown

## 4.0.8 (Jul 19, 2022)

- Fixed auto-resend issue in offline write

## 4.0.7 (Jul 14, 2022)

- Fixed a bug that serializing pending messages causes a crash on iOS 12 or lower

## 4.0.6 (Jul 13, 2022)

- Fixed a bug that sending a file message doesn’t work on the app extension

## v4.0.5 (Jul 11, 2022)

- Fixed a bug that sending a file message doesn’t work on the app extension
- Fixed a bug that the file URL of the file message is not accessible
- Fixed a bug that the message collection can’t load the previous messages when the network is not connected
- Fixed a bug that the reaction event is not applied to the cached messages
- Fixed a bug in the message search query

## v4.0.4 (Jul 6, 2022)

- Fixed a bug that the message collection can't call the message update event when the reconnection is completed
- Improved stability

## v4.0.3 (Jun 30, 2022)

- Improved stability

## v4.0.2 (Jun 28, 2022)

- Fixed a bug that the message collection returned failed messages across all channels
- Changed the default value of `memberInfoInMessage` to `true`
- Fixed a message search bug
- Improved stability

## v4.0.1 (Jun 23, 2022)

- Fixed a bug that the failed message isn’t removed from the memory cache of the message collection
- Fixed `createBannedUserListQuery` to use the params builder
- Fixed unstable reconnection on the simulator

## v4.0.0 (Jun 14, 2022)

> To see detailed changes for below items, please refer to the [migration guide](https://sendbird.com/docs/chat/v4/ios/getting-started/migration-guide)

### Improvement

- Added mentioned users to pending, and failed messages
- When operatorUserIds = nil, exclude operator_ids field from json request
- Added mentioned message template
- Added id to User, BaseChannel and BaseMessage to conform to Identifiable
- Add MyMemberStateFilter for group channel count and channel query
- Fixed SBDPushTemplate.default and SBDPushTemplate.alternative as public
- Changed User's userId type from optional String to non-optional String
- Changed internal logic of log levels. Now, only logs with equal or higher log level than the specified LogLevel are printed
- Codebase has been re-written from Objective-C to Swift
- Added annotations for renamed methods and
- Changed the type of the value that the `loadNextPage()` of the `MutedUserListQuery` and the `BannedUserListQuery` return through the callbacks to the array of the `RestrictedUser`
- Changed the parameter's type of the `channel(_:userWasMuted:)` and `channel(_:userWasBanned:)` of `BaseChannelDelegate` to the `RestrictedUser`

### Breaking changes

#### General

##### Changed

- Naming of the Product has been changed from `SendBirdSDK` to `SendbirdChatSDK`
- Naming of the main class has been changed from `SBDMain` to `SendbirdChat`
- Naming of public interfaces has been renamed to better match Swift's language style guide
- Deprecated interfaces from v3 has been removed
- Support for SyncManager has been removed.
- Removed the SBD prefix across names for all constants, protocols, classes, enums, and type definitions
- Removed `with` or `by` phrase from parameter names
- Renamed `SBDMain` to `SendbirdChat`
- Renamed `SBDOptions` to `SendbirdChatOptions`
- `SBDChannelDelegate` is separated into `BaseChannelDelegate`, `OpenChannelDelegate`, and `GroupChannelDelegate` protocols
- Conform to either `OpenChannelDelegate` or `GroupChannelDelegate` to receive events about the channels
- Renamed `SBDError` to `SBError`
- Deprecating support for `Mappable` protocol; Please use Swift's Codable instead to serialize/deserialize objects. For Objective-C, it stays the same
- Renamed property name such as coverUrl, channelUrl to coverURL and channelURL (capitalize short name) to follow swift convention

##### Removed

- `SBDConnectionManager`
- `SBDUserListQuery`; Please use specific queries for querying users instead, i.e. `ApplicationUserListQuery` and `BlockedUserListQuery`
- `SBDAuthenticateDelegate`

#### SendbirdChat

##### Changed

- `clearCachedData(completionHandler:)` completion type `Void` to `SBErrorHandler`
- `initWithApplicationId` to `initialize(params:)`
- `getChannelCount` to `getGroupChannelCount`
- `getChannelCountWithMemberStateFilter:` to `getGroupChannelCountWithMemberStateFilter:`.

##### Removed

- `createAllUserListQuery`; Use `createApplicationUserListQuery`
- `createUserListQueryWithUserIds`; Use `createApplicationUserListQuery(params:)`
- `getPendingPushKitToken`; PushKit is not supported anymore
- `registerDevicePushKitToken`; PushKit is not supported anymore
- `unregisterPushKitToken`; PushKit is not supported anymore
- `markAsDeliveredWithChannelUrl`; The feature is supported internally
- `getMyGroupChannelChangeLogs(byToken:customType:includeEmptyChannel:)`; Use `getMyGroupChannelChangeLogs(token:params:completionHandler:)`
- `getMyGroupChannelChangeLogs(byTimestamp:customType:includeEmptyChannel)`; Use `getMyGroupChannelChangeLogs(timestamp:params:completionHandler:)`
- All of `updateCurrentUserInfo` related methods; Use `updateCurrentUserInfo(params:progressHandler:completionHandler:)`

#### SendbirdChatOptions

##### Changed

- `useMemberAsMessageSender` to `useMemberInfoInMessage`

#### BaseChannel

##### Changed

- `coverUrl` to `coverURL`
- `channelUrl` to `channelURL`

##### Removed

- `sendUserMessage(_:data:customType:targetLanguages:completionHandler:)`; Use `sendUserMessage(params:completionHandler:)`
- `updateUserMessage(_:messageText:data:customType:completionHandler:)`; Use `updateUserMessage(params:completionHandler:)`
- `getPreviousAndNextMessages`, `getNextMessages`, `getPreviousMessages`; Use `getMessages(messageId:params:completionHandler:)`
- `getMessageChangeLogs(token:completionHandler:)`, `getMessageChangeLogs(byTimestamp:completionHandler:)`; Use `getMessageChangeLogs(params:completionHandlers:)`

#### GroupChannel

##### Removed

- `sendMarkAsReadEnable`; The feature was deprecated in `v3.0.24`
- `isPushEnabled`; Use `myPushTriggerOption`
- `createChannel(isDistinct:users:coverImage:coverImageName:data:customType:progressHandler:completionHandler:)`; Use `createChannel(params:progressHandler:completionHandler:)`
- `updateChannel(isDistinct:coverImage:coverImageName:data:customType:progressHandler:completionHandler:)`; Use `updateChannel(params:progressHandler:completionHandler:)`
- `getChannelWithoutCache`; The feature was deprecated in `v3.0.116`
- `hideChannel(completionHandler:)`; Use `hide(hidePreviousMessages:allowAutoUnhide:completionHandler:)`
- `getChannelFromCacheWithChannelUrl`; The feature was deprecated in `v3.0.116`
- `getReadReceiptOfMessage`; Use `getUnreadMemberCount(_:)`
- `getLastSeenAtByUser`, `getLastSeenAtByUserIdUse`, `getReadMembersWithMessage`, and `getDeliveryReceipt`; Use `getUndeliveredMemberCount`
- `getTypingMembers`; Use `getTypingUsers`
- `setPushPreference`; Use `setMyPushTriggerOption(_:completionHandler:)`
- `getTotalUnreadMessageCount`; Use `SendbirdChat.getTotalUnreadMessageCount`

#### OpenChannel

##### Removed

- `createChannel(channelUrl:coverImage:coverImageName:data:operatorUserIds:customType:progressHandler:completionHandler:)`; Use `createChannel(params:progressHandler:completionHandler:)`
- `updateChannel(coverImage:coverImageName:data:operatorUserIds:customType:progressHandler:completionHandler:)`; Use `updateChannel(params:progressHandler:completionHandler:)`

#### ChannelDelegate

##### Changed

- `channel(_:didReceive:)` is moved to `BaseChannelDelegate`
- `channel(_:didUpdate:)` is moved to `BaseChannelDelegate`
- `channel(_:didReceiveMention:)` is moved to `BaseChannelDelegate`
- `channel(_:userWasMuted:)` is moved to `BaseChannelDelegate`
- `channel(_:userWasUnmuted:)` is moved to `BaseChannelDelegate`
- `channel(_:userWasBanned:)` is moved to `BaseChannelDelegate`
- `channel(_:userWasUnbanned:)` is moved to `BaseChannelDelegate`
- `channelWasFrozen(_:)` is moved to `BaseChannelDelegate`
- `channelWasUnfrozen(_:)` is moved to `BaseChannelDelegate`
- `channelWasChanged(_:)` is moved to `BaseChannelDelegate`
- `channelWasDeleted(_:channelType:)` is moved to `BaseChannelDelegate`
- `channel(_:messageWasDelegate:)` is moved to `BaseChannelDelegate`
- `channel(_:createdMetaData:)` is moved to `BaseChannelDelegate`
- `channel(_:updatedMetaData:)` is moved to `BaseChannelDelegate`
- `channel(_:deletedMetaDataKeys:)` is moved to `BaseChannelDelegate`
- `channel(_:createdMetaCounters:)` is moved to `BaseChannelDelegate`
- `channel(_:updatedMetaCounters:)` is moved to `BaseChannelDelegate`
- `channel(_:deletedMetaCountersKeys:)` is moved to `BaseChannelDelegate`
- `channel(_:updatedReactions:)` is moved to `BaseChannelDelegate`
- `channelDidUpdateOperators(_:)` is moved to `BaseChannelDelegate`
- `channel(_:didUpdateThreadInfo:)` is moved to `BaseChannelDelegate`
- `channelDidUpdateReadStatus(_:)` is moved to `GroupChannelDelegate`
- `channelDidUpdateDeliveryStatus(_:)` is moved to `GroupChannelDelegate`
- `channelDidUpdateTypingStatus(_:)` is moved to `GroupChannelDelegate`
- `channelDidChangeMemberCount(_:)` is moved to `GroupChannelDelegate`
- `channel(_:didReceiveInvitation:inviter:)` is moved to `GroupChannelDelegate`
- `channel(_:didDeclineInvitation:inviter:)` is moved to `GroupChannelDelegate`
- `channel(_:userDidJoin:)` is moved to `GroupChannelDelegate`
- `channel(_:userDidLeave:)` is moved to `GroupChannelDelegate`
- `channelWasHidden(_:)` is moved to `GroupChannelDelegate`
- `channelDidChangeParticipantCount(_:)` is moved to `OpenChannelDelegate`
- `channel(_:userDidEnter:)` is moved to `OpenChannelDelegate`
- `channel(_:userDidExit:)` is moved to `OpenChannelDelegate`

#### Params

##### Added

- Introduced `InitParams` for `SendbirdChat.initialize(params:)`
- Introduced `UserUpdateParams` for `SendbirdChat.updateCurrentUserInfo(params:)`

##### Changed

- `UserMessageParams` to `UserMessageCreateParams` and `UserMessageUpdateParams`
- `FileMessageParams` to `FileMessageCreateParams` and `FileMessageUpdateParams`
- `GroupChannelParams` to `GroupChannelCreateParams` and `GroupChannelUpdateParams`
  - `strict` to `isStrict`
  - `discoverable` to `isDiscoverable`
- `OpenChannelParams` to `OpenChannelCreateParams` and `OpenChannelUpdateParams`

## v4 Beta Changelog

- Please refer to the [Changelog for v4 beta](https://github.com/sendbird/sendbird-chat-sdk-ios/blob/master/CHANGELOG_V4_BETA.md)

## v3 Changelog

- Please refer to the [Changelog for v3](https://github.com/sendbird/sendbird-ios-framework/blob/master/CHANGELOG.md)
