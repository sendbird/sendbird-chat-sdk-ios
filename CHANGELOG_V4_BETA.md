# Change Log

## v4.0.0-beta.9 (Jun 10, 2022)
*Contains all changes since v4.0.0-beta*

### Bugs
* Fixed a bug that `useMemberInfoInMessage` didn't work
* Fixed a bug that the channel collection can't load channels
* Fixed a bug that the sendingStatus in the scheduled message while decoding
* Fixed the error that requestID of scheduled message is empty
* Added thumbnails to a copied fileMessage
* Public interfaces are exposed to Objective-C headers
* When parsing metaData from json, its key whose value is null is ignored
* Fixed wrong ACK timeout error for markAsRead
* Fixed to guarantee BaseMessage serialize compatibility when updating from v3 to v4
* Added missing objcMembers attribute for PushTemplate
* Fixed 401 error when handling image File URL

### Improvement
* Added `ScheduledBaseMessageCreateParams` and `ScheduledBaseMessageUpdateParams`
* Changed `channelURL` of `SendbirdChat.createScheduledMessageListQuery` to optional
* Added mentioned users to pending, failed, and scheduled messages
* When operatorUserIDs = nil, exclude operator_ids field from json request
* Added mentioned message template
* Added id to User, BaseChannel and BaseMessage to conform to Identifiable
* Add MyMemberStateFilter for group channel count and channel query
* Fixed SBDPushTemplate.default and SBDPushTemplate.alternative as public
* Changed User's userID type from optional String to non-optional String
* Added a function to send scheduled messages immediately
* Changed internal logic of log levels. Now, only logs with equal or higher log level than the specified LogLevel are printed
* Added new feature, Scheduled Messages
* Added new parameter, channel_type, to Polls interfaces
* Codebase has been re-written from Objective-C to Swift
* Added annotations for renamed methods and properties

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
* `getChannelCountWithMemberStateFilter:` to `getGroupChannelCountWithMemberStateFilter:`

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
* `didUpdatePoll(_:)` is moved to `BaseChannelDelegate`
* `didVotePoll(_:)` is moved to `BaseChannelDelegate`
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

#### BaseMessage
##### Changed
* `parent` to `parentMessage`
* `String` to `ChannelType` for `channelType` property

##### Removed 
* `parentMessageText`; Use `parentMessage`
* `metaArray`; Use `metaArrays`

#### FileMessage
##### Removed
* `requestState`; Use `sendingStatus`

#### UserMessage
##### Removed 
* `requestState`; Use `sendingStatus`

#### PreviousMessageListQuery
##### Changed
* `loadWithCompletionHandler:` to `loadNext(completionHandler:)`

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

## v4.0.0-beta.8 (Jun 8, 2022)
* `useMemberAsMessageSender` to `useMemberInfoInMessage`
* Fixed a bug that `useMemberInfoInMessage` didn't work
* Added `ScheduledBaseMessageCreateParams` and `ScheduledBaseMessageUpdateParams`
* Fixed a bug that the channel collection can't load channels

## v4.0.0-beta.7 (May 24, 2022)
* Added mentioned users to pending, failed, and scheduled messages
* When operatorUserIDs = nil, exclude operator_ids field from json request
* Fixed a bug that the sendingStatus in the scheduled message while decoding
* Fixed the error that requestID of scheduled message is empty
* Added thumbnails to a copied fileMessage

## v4.0.0-beta.6 (May 24, 2022)
* Check & solve internal interface being exposed to Objective-C headers
* When parsing metaData from json, its key whose value is null is ignored

## v4.0.0-beta.5 (May 17, 2022)
* Added mentioned message template
* Fixed wrong ACK timeout error for markAsRead.
* Added annotations for renamed methods and properties
* Added id to User, BaseChannel and BaseMessage to conform to Identifiable
* Fixed SBDPushTemplate.default and SBDPushTemplate.alternative as public
* Changed User's userID type from optional String to non-optional String
* Fixed to guarantee BaseMessage serialize compatibility when updating from v3 to v4
* Added a function to send scheduled messages immediately

## v4.0.0-beta.4 (May 10, 2022)
* Make SBDPushTemplate.default and SBDPushTemplate.alternative public
* Added missing objcMembers attribute for PushTemplate
* Changed internal logic of log levels. Now, only logs with equal or higher log level than the specified LogLevel are printed

## v4.0.0-beta.3 (May 3, 2022)
* Updated all naming to match the capitalization convention

## v4.0.0-beta.2 (Apr 29, 2022)
* Added new feature, Scheduled Messages
* Added new parameter, channel_type, to Polls interfaces
* Fixed 401 error when handling image File URL

## v4.0.0-beta (Apr 12, 2022)
* Codebase has been re-written from Objective-C to Swift
* Naming of the Product has been changed from `SendBirdSDK` to `SendbirdChatSDK`
* Naming of the main class has been changed from `SBDMain` to `SendbirdChat`
* Naming of public interfaces has been renamed to better match Swift's language style guide
* Deprecated interfaces from v3 has been removed
* Support for SyncManager has been removed