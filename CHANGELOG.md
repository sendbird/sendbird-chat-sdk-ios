# Changelog

## v4.2.4 (Jan 20, 2023)


### **Features**
You can now set longer timeout value (Previously 10s) for session token expiry. (Default: 60s, Maximum: 1800s). This means that Sendbird SDK will wait longer for your new session token, making it easier for you to reconnect to our service. 

- `@objc class func setSessionTokenRefreshTimeout(_ timeout: Int)`


### **Improvements**
* Fixed bug where `BaseChannelHandler.onChannelChanged` and `GroupChannelHandler.onPinnedMessageUpdated` are not being called when the pinned message is updated
* Fixed channelURL filter not working when fetching pendingMessage
* Fixed wrong channels being returned in copyMessage completionHandler

### **Improvements**
* Improved database synchronization stability

## v4.2.2 (Jan 04, 2023)

### **Improvements**
* Fixed a bug where unread count of channels is not updated in time
* Changed to ensure reachability notification is called on the main thread

## v4.2.1 (Dec 15, 2022)

### **Improvements**
* Fixed a bug where channel filters (ex: `channelURLFilter`) were not applied properly in `GroupChannelCollection`

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
------
### **Improvements**
* Added `use_local_cache` to the request header
* Removed internal logs

## v4.1.8 (Dec 02, 2022)

### Improvements
* Added `urlSession(_:task:didCompleteWithError:)` method implementation to the native web socket engine

## v4.1.7 (Nov 29, 2022)

### Improvements
* Fixed a memory leak in the web socket engine
* Added error log when using uninitialized Sendbird instance
* Fixed to upsert channel change into database when receiving events
* Fixed to use cached open channel when receiving system event

## v4.1.6 (Nov 16, 2022)

### Improvements
* Fixed a bug where `GroupChannelCollection::loadMore`'s `completionHandler` is not called under iOS 13

## v4.1.5 (Nov 09, 2022)

### Improvements
* Fixed a crash issue when logging in RequestQueue

## v4.1.4 (Nov 09, 2022)

### Improvements
* Fixed filtering logic (`joinedOnly`) in `GroupChannelListQuery.myMemberStateFilter`
* Fixed an issue where deleted channels remain in the local cache
* Applied atomicity to `cacheChannels`, `hasNext` in `GroupChannelCollection`
* Fixed concurrency issue in `SafeDictionary`

## v4.1.3 (Nov 02, 2022)

### Improvements
* Fixed concurrency issue in `CachedDataMap`


## v4.1.2 (Oct 27, 2022)

* Fixed `MarkAsDelivered(remoteNotificationPayload: completionHandler:)` to work without being connected
* Fixed a deserialized fileMessage's eKey not updating
* Added reachability log
* Fixed concurrency issue on user connection

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

--------
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
--------
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
* Added public `make(_ json:)` interface
* Added synchronous initialize for SendbirdChat
* Removed unused keys from body of MarkAsDelivered request

## 4.0.14 (Sep 28, 2022)
* Added nicknameStartsWithFilter, nicknameExactMatchFilter feature in GroupChannelListQuery and its params
* Implemented history of channel membership where clients can now track whether users have joined or left the channel (`MemberState.left` for left members of a `GroupChannel`)
* Resolved priority inversion warning
* Fixed a crash when a large file is sent in the FILE message

## 4.0.13 (Sep 16, 2022)
* Fixed crash issue when using `SendbirdChat.add(_:identifier)`

## 4.0.12 (Sep 14, 2022)
* Added metaData related logic for filtering in GroupChannelListQuery.belongsTo
* Renamed methods in `SendbirdChat`
    * `add(_ delegate: ConnectionDelegate, identifier: String)` -> `addConnectionDelegate(_ delegate: ConnectionDelegate, identifier: String)`
    * `add(_ delegate: BaseChannelDelegate, identifier: String)` -> `addChannelDelegate(_ delegate: BaseChannelDelegate, identifier: String)`
    * `add(_ delegate: UserEventDelegate, identifier: String)` -> `addUserEventDelegate(_ delegate: UserEventDelegate, identifier: String)`

## 4.0.11 (Sep 2, 2022)
* Fixed a bug where a dirty flag of a group channel is handled improperly

## 4.0.10 (Aug 31, 2022)
* Added MessageSearchQuery's totalCount and made it public
* Fixed memory problem when continuously sending large files
* Changed the keywords of the classes and functions below from public to open (subclassing)

User, BaseChannel, GroupChannel, OpenChannel, BaseCollection, GroupChannelCollection, BaseMessage, UserMessage, FileMessage, AdminMessage

Note: However, subclassing is not recommended, and please be aware that any issue that arises from subclassing will take substantially longer time to react

## 4.0.9 (Aug 17, 2022)
* Added shouldRemoveOperatorStatus function
* Updated copyMessage function to only duplicate successfully sent message. Copying any non-successful message will now return an invalidParameter error
* Fixed concurrency issues
* Fixed WS connection being lost after switching from wifi to LTE
* Fixed OpenChannel not updating channel’s changed information
* Fixed a copied fileMessage’s image not being shown

## 4.0.8 (Jul 19, 2022)
* Fixed auto-resend issue in offline write

## 4.0.7 (Jul 14, 2022)
* Fixed a bug that serializing pending messages causes a crash on iOS 12 or lower

## 4.0.6 (Jul 13, 2022)
* Fixed a bug that sending a file message doesn’t work on the app extension

## v4.0.5 (Jul 11, 2022)
* Fixed a bug that sending a file message doesn’t work on the app extension
* Fixed a bug that the file URL of the file message is not accessible
* Fixed a bug that the message collection can’t load the previous messages when the network is not connected
* Fixed a bug that the reaction event is not applied to the cached messages
* Fixed a bug in the message search query

## v4.0.4 (Jul 6, 2022)
* Fixed a bug that the message collection can't call the message update event when the reconnection is completed
* Improved stability

## v4.0.3 (Jun 30, 2022)
* Improved stability

## v4.0.2 (Jun 28, 2022)
* Fixed a bug that the message collection returned failed messages across all channels
* Changed the default value of `memberInfoInMessage` to `true`
* Fixed a message search bug
* Improved stability

## v4.0.1 (Jun 23, 2022)
* Fixed a bug that the failed message isn’t removed from the memory cache of the message collection
* Fixed `createBannedUserListQuery` to use the params builder
* Fixed unstable reconnection on the simulator

## v4.0.0 (Jun 14, 2022)

> To see detailed changes for below items, please refer to the [migration guide](https://sendbird.com/docs/chat/v4/ios/getting-started/migration-guide)

### Improvement
* Added mentioned users to pending, and failed messages
* When operatorUserIds = nil, exclude operator_ids field from json request
* Added mentioned message template
* Added id to User, BaseChannel and BaseMessage to conform to Identifiable
* Add MyMemberStateFilter for group channel count and channel query
* Fixed SBDPushTemplate.default and SBDPushTemplate.alternative as public
* Changed User's userId type from optional String to non-optional String
* Changed internal logic of log levels. Now, only logs with equal or higher log level than the specified LogLevel are printed
* Codebase has been re-written from Objective-C to Swift
* Added annotations for renamed methods and 
* Changed the type of the value that the `loadNextPage()` of the `MutedUserListQuery` and the `BannedUserListQuery` return through the callbacks to the array of the `RestrictedUser`
* Changed the parameter's type of the `channel(_:userWasMuted:)` and `channel(_:userWasBanned:)` of `BaseChannelDelegate` to the `RestrictedUser`

### Breaking changes

#### General

##### Changed
* Naming of the Product has been changed from `SendBirdSDK` to `SendbirdChatSDK`
* Naming of the main class has been changed from `SBDMain` to `SendbirdChat`
* Naming of public interfaces has been renamed to better match Swift's language style guide
* Deprecated interfaces from v3 has been removed
* Support for SyncManager has been removed.
* Removed the SBD prefix across names for all constants, protocols, classes, enums, and type definitions
* Removed `with` or `by` phrase from parameter names
* Renamed `SBDMain` to `SendbirdChat`
* Renamed `SBDOptions` to `SendbirdChatOptions`
* `SBDChannelDelegate` is separated into `BaseChannelDelegate`, `OpenChannelDelegate`, and `GroupChannelDelegate` protocols
* Conform to either `OpenChannelDelegate` or `GroupChannelDelegate` to receive events about the channels
* Renamed `SBDError` to `SBError`
* Deprecating support for `Mappable` protocol; Please use Swift's Codable instead to serialize/deserialize objects. For Objective-C, it stays the same
* Renamed property name such as coverUrl, channelUrl to coverURL and channelURL (capitalize short name) to follow swift convention

##### Removed
* `SBDConnectionManager`
* `SBDUserListQuery`; Please use specific queries for querying users instead, i.e. `ApplicationUserListQuery` and `BlockedUserListQuery`
* `SBDAuthenticateDelegate`

#### SendbirdChat

##### Changed

* `clearCachedData(completionHandler:)` completion type `Void` to `SBErrorHandler`
* `initWithApplicationId` to `initialize(params:)`
* `getChannelCount` to `getGroupChannelCount` 
* `getChannelCountWithMemberStateFilter:` to `getGroupChannelCountWithMemberStateFilter:`.

##### Removed 
* `createAllUserListQuery`; Use `createApplicationUserListQuery`
* `createUserListQueryWithUserIds`; Use `createApplicationUserListQuery(params:)`
* `getPendingPushKitToken`; PushKit is not supported anymore
* `registerDevicePushKitToken`; PushKit is not supported anymore
* `unregisterPushKitToken`; PushKit is not supported anymore
* `markAsDeliveredWithChannelUrl`; The feature is supported internally
* `getMyGroupChannelChangeLogs(byToken:customType:includeEmptyChannel:)`; Use `getMyGroupChannelChangeLogs(token:params:completionHandler:)`
* `getMyGroupChannelChangeLogs(byTimestamp:customType:includeEmptyChannel)`; Use `getMyGroupChannelChangeLogs(timestamp:params:completionHandler:)`
* All of `updateCurrentUserInfo` related methods; Use `updateCurrentUserInfo(params:progressHandler:completionHandler:)`

#### SendbirdChatOptions
##### Changed
* `useMemberAsMessageSender` to `useMemberInfoInMessage`

#### BaseChannel
##### Changed
* `coverUrl` to `coverURL`
* `channelUrl` to `channelURL`

##### Removed
* `sendUserMessage(_:data:customType:targetLanguages:completionHandler:)`; Use `sendUserMessage(params:completionHandler:)`
* `updateUserMessage(_:messageText:data:customType:completionHandler:)`; Use `updateUserMessage(params:completionHandler:)`
* `getPreviousAndNextMessages`, `getNextMessages`, `getPreviousMessages`; Use `getMessages(messageId:params:completionHandler:)`
* `getMessageChangeLogs(token:completionHandler:)`, `getMessageChangeLogs(byTimestamp:completionHandler:)`; Use `getMessageChangeLogs(params:completionHandlers:)`

#### GroupChannel
##### Removed
* `sendMarkAsReadEnable`; The feature was deprecated in `v3.0.24`
* `isPushEnabled`; Use `myPushTriggerOption`
* `createChannel(isDistinct:users:coverImage:coverImageName:data:customType:progressHandler:completionHandler:)`; Use `createChannel(params:progressHandler:completionHandler:)`
* `updateChannel(isDistinct:coverImage:coverImageName:data:customType:progressHandler:completionHandler:)`; Use `updateChannel(params:progressHandler:completionHandler:)`
* `getChannelWithoutCache`; The feature was deprecated in `v3.0.116`
* `hideChannel(completionHandler:)`; Use `hide(hidePreviousMessages:allowAutoUnhide:completionHandler:)`
* `getChannelFromCacheWithChannelUrl`; The feature was deprecated in `v3.0.116`
* `getReadReceiptOfMessage`; Use `getUnreadMemberCount(_:)`
* `getLastSeenAtByUser`, `getLastSeenAtByUserIdUse`, `getReadMembersWithMessage`, and `getDeliveryReceipt`; Use `getUndeliveredMemberCount`
* `getTypingMembers`; Use `getTypingUsers`
* `setPushPreference`; Use `setMyPushTriggerOption(_:completionHandler:)`
* `getTotalUnreadMessageCount`; Use `SendbirdChat.getTotalUnreadMessageCount`

#### OpenChannel
##### Removed
* `createChannel(channelUrl:coverImage:coverImageName:data:operatorUserIds:customType:progressHandler:completionHandler:)`; Use `createChannel(params:progressHandler:completionHandler:)`
* `updateChannel(coverImage:coverImageName:data:operatorUserIds:customType:progressHandler:completionHandler:)`; Use `updateChannel(params:progressHandler:completionHandler:)`

#### ChannelDelegate
##### Changed
* `channel(_:didReceive:)` is moved to `BaseChannelDelegate`
* `channel(_:didUpdate:)` is moved to `BaseChannelDelegate`
* `channel(_:didReceiveMention:)` is moved to `BaseChannelDelegate`
* `channel(_:userWasMuted:)` is moved to `BaseChannelDelegate`
* `channel(_:userWasUnmuted:)` is moved to `BaseChannelDelegate`
* `channel(_:userWasBanned:)` is moved to `BaseChannelDelegate`
* `channel(_:userWasUnbanned:)` is moved to `BaseChannelDelegate`
* `channelWasFrozen(_:)` is moved to `BaseChannelDelegate`
* `channelWasUnfrozen(_:)` is moved to `BaseChannelDelegate`
* `channelWasChanged(_:)` is moved to `BaseChannelDelegate`
* `channelWasDeleted(_:channelType:)` is moved to `BaseChannelDelegate`
* `channel(_:messageWasDelegate:)` is moved to `BaseChannelDelegate`
* `channel(_:createdMetaData:)` is moved to `BaseChannelDelegate`
* `channel(_:updatedMetaData:)` is moved to `BaseChannelDelegate`
* `channel(_:deletedMetaDataKeys:)` is moved to `BaseChannelDelegate`
* `channel(_:createdMetaCounters:)` is moved to `BaseChannelDelegate`
* `channel(_:updatedMetaCounters:)` is moved to `BaseChannelDelegate`
* `channel(_:deletedMetaCountersKeys:)` is moved to `BaseChannelDelegate`
* `channel(_:updatedReactions:)` is moved to `BaseChannelDelegate`
* `channelDidUpdateOperators(_:)` is moved to `BaseChannelDelegate`
* `channel(_:didUpdateThreadInfo:)` is moved to `BaseChannelDelegate`
* `channelDidUpdateReadStatus(_:)` is moved to `GroupChannelDelegate`
* `channelDidUpdateDeliveryStatus(_:)` is moved to `GroupChannelDelegate`
* `channelDidUpdateTypingStatus(_:)` is moved to `GroupChannelDelegate`
* `channelDidChangeMemberCount(_:)` is moved to `GroupChannelDelegate`
* `channel(_:didReceiveInvitation:inviter:)` is moved to `GroupChannelDelegate`
* `channel(_:didDeclineInvitation:inviter:)` is moved to `GroupChannelDelegate`
* `channel(_:userDidJoin:)` is moved to `GroupChannelDelegate`
* `channel(_:userDidLeave:)` is moved to `GroupChannelDelegate`
* `channelWasHidden(_:)` is moved to `GroupChannelDelegate`
* `channelDidChangeParticipantCount(_:)` is moved to `OpenChannelDelegate`
* `channel(_:userDidEnter:)` is moved to `OpenChannelDelegate`
* `channel(_:userDidExit:)` is moved to `OpenChannelDelegate`

#### Params
##### Added
* Introduced `InitParams` for `SendbirdChat.initialize(params:)`
* Introduced `UserUpdateParams` for `SendbirdChat.updateCurrentUserInfo(params:)`

##### Changed
* `UserMessageParams` to `UserMessageCreateParams` and `UserMessageUpdateParams`
* `FileMessageParams` to `FileMessageCreateParams` and `FileMessageUpdateParams`
* `GroupChannelParams` to `GroupChannelCreateParams` and `GroupChannelUpdateParams`
    * `strict` to `isStrict`
    * `discoverable` to `isDiscoverable`
* `OpenChannelParams` to `OpenChannelCreateParams` and `OpenChannelUpdateParams`

## v4 Beta Changelog
* Please refer to the [Changelog for v4 beta](https://github.com/sendbird/sendbird-chat-sdk-ios/blob/master/CHANGELOG_V4_BETA.md)

## v3 Changelog
* Please refer to the [Changelog for v3](https://github.com/sendbird/sendbird-ios-framework/blob/master/CHANGELOG.md)
