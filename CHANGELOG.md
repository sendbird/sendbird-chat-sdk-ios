# Changelog

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