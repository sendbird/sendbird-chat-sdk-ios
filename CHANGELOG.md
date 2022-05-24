# Change Log

### v4.0.0-beta.6 (May 24, 2022)
- Check & solve internal interface being exposed to Objective-C headers
- When parsing metaData from json, its key whose value is null is ignored.

### v4.0.0-beta.5 (May 17, 2022)
- Added mentioned message template.
- Fixed wrong ACK timeout error for markAsRead.
- Added annotations for renamed methods and properties.
- Added id to User, BaseChannel and BaseMessage to conform to Identifiable.
- Fixed SBDPushTemplate.default and SBDPushTemplate.alternative as public.
- Changed User's userID type from optional String to non-optional String.
- Fixed to guarantee BaseMessage serialize compatibility when updating from v3 to v4.
- Added a function to send scheduled messages immediately

### v4.0.0-beta.4 (May 10, 2022)
- Make SBDPushTemplate.default and SBDPushTemplate.alternative public.
- Added missing objcMembers attribute for PushTemplate.
- Changed internal logic of log levels. Now, only logs with equal or higher log level than the specified LogLevel are printed.

### v4.0.0-beta.3 (May 3, 2022)
- Updated all naming to match the capitalization convention.

### v4.0.0-beta.2 (Apr 29, 2022)
- Added new feature, Scheduled Messages
- Added new parameter, channel_type, to Polls interfaces
- Fixed 401 error when handling image File URL

### v4.0.0-beta (Apr 12, 2022)
- Codebase has been re-written from Objective-C to Swift.
- Naming of the Product has been changed from `SendBirdSDK` to `SendbirdChatSDK`.
- Naming of the main class has been changed from `SBDMain` to `SendbirdChat`.
- Naming of public interfaces has been renamed to better match Swift's language style guide.
- Deprecated interfaces from v3 has been removed.
- Support for SyncManager has been removed. 

## v4.0.0
### General
* Removed the SBD prefix across names for all constants, protocols, classes, enums, and type definitions.
* Removed `with` or `by` phrase from parameter names.
* Renamed `SBDMain` to `SendbirdChat`.
* Renamed `SBDOptions` to `SendbirdChatOptions`.
* `SBDChannelDelegate` is separated into `BaseChannelDelegate`, `OpenChannelDelegate`, and `GroupChannelDelegate` protocols
Conform to either `OpenChannelDelegate` or `GroupChannelDelegate` to receive events about the channels
* Renamed `SBDError` to `SBError`
* Deprecating support for `Mappable` protocol; Please use Swift’s Codable instead to serialize/deserialize objects. For objective-c, it stays the same.
* Renamed property name such as coverUrl, channelUrl to coverURL and channelURL (capitalize short name) to follow swift convention

### Removed
* `SBDConnectionManager`
* `SBDUserListQuery`; Please use specific queries for querying users instead, i.e. `ApplicationUserListQuery` and `BlockedUserListQuery`
* `SBDAuthenticateDelegate`

### SendbirdChat
#### Changed
* `clearCachedData(completionHandler:)` completion type `Void` to `SBErrorHandler`

#### Renamed
* `initWithApplicationId` to `initialize(params:)`
* `getChannelCount` to `getGroupChannelCount` 
* `getChannelCountWithMemberStateFilter:` to `getGroupChannelCountWithMemberStateFilter:`.

#### Removed 
* `createAllUserListQuery`
* `createUserListQueryWithUserIds`
* `getPendingPushKitToken`
* `registerDevicePushKitToken`
* `unregisterPushKitToken`
* `markAsDeliveredWithChannelUrl`
* `getMyGroupChannelChangeLogs(byToken:customType:includeEmptyChannel:)`, Use `getMyGroupChannelChangeLogs(token:params:completionHandler:)`
* `getMyGroupChannelChangeLogs(byTimestamp:customType:includeEmptyChannel)`, Use `getMyGroupChannelChangeLogs(timestamp:params:completionHandler:)`
*  all of `updateCurrentUserInfo` related methods, Use `updateCurrentUserInfo(params:progressHandler:completionHandler:)`

### BaseChannel
#### Renamed
* `coverUrl` to `coverURL`
* `channelUrl` to `channelURL`

#### Removed
* `sendUserMessage(_:data:customType:targetLanguages:completionHandler:)`, Use `sendUserMessage(params:completionHandler:)`
* `updateUserMessage(_:messageText:data:customType:completionHandler:)`, Use `updateUserMessage(params:completionHandler:)`
* `getPreviousAndNextMessages`, `getNextMessages`, `getPreviousMessages`, Use `getMessages(messageId:params:completionHandler:)`
* `getMessageChangeLogs(token:completionHandler:)`, `getMessageChangeLogs(byTimestamp:completionHandler:)`, Use `getMessageChangeLogs(params:completionHandlers:)`

### GroupChannel
#### Removed
* `sendMarkAsReadEnable`
* `isPushEnabled`
* `createChannel(isDistinct:users:coverImage:coverImageName:data:customType:progressHandler:completionHandler:)`, Use `createChannel(params:progressHandler:completionHandler:)`
* `updateChannel(isDistinct:coverImage:coverImageName:data:customType:progressHandler:completionHandler:)`, Use `updateChannel(params:progressHandler:completionHandler:)`
* `getChannelWithoutCache`
* `hideChannel(completionHandler:)`, Use `hide(hidePreviousMessages:allowAutoUnhide:completionHandler:)`
* `getChannelFromCacheWithChannelUrl`
* `getReadReceiptOfMessage`
* `getLastSeenAtByUser`, `getLastSeenAtByUserIdUse`, `getReadMembersWithMessage`, `getDeliveryReceipt`, Use `getUndeliveredMemberCount`
* `getTypingMembers`, Use `getTypingUsers`
* `setPushPreference`
* `getTotalUnreadMessageCount`, Use `SendbirdChat.getTotalUnreadMessageCount`

### OpenChannel
#### Removed
* `createChannel(channelUrl:coverImage:coverImageName:data:operatorUserIds:customType:progressHandler:completionHandler:)`, Use `createChannel(params:progressHandler:completionHandler:)`
*  `updateChannel(coverImage:coverImageName:data:operatorUserIds:customType:progressHandler:completionHandler:)`, Use `updateChannel(params:progressHandler:completionHandler:)`

### ChannelDelegate 
#### Moved to BaseChannelDelegate
* channel(_:didReceive:)
* channel(_:didUpdate:)
* channel(_:didReceiveMention:)
* channel(_:userWasMuted:)
* channel(_:userWasUnmuted:)
* channel(_:userWasBanned:)
* channel(_:userWasUnbanned:)
* channelWasFrozen(_:)
* channelWasUnfrozen(_:)
* channelWasChanged(_:)
* channelWasDeleted(_:channelType:)
* channel(_:messageWasDelegate:)
* channel(_:createdMetaData:)
* channel(_:updatedMetaData:)
* channel(_:deletedMetaDataKeys:)
* channel(_:createdMetaCounters:)
* channel(_:updatedMetaCounters:)
* channel(_:deletedMetaCountersKeys:)
* channel(_:updatedReactions:)
* channelDidUpdateOperators(_:)
* channel(_:didUpdateThreadInfo:)
* didUpdatePoll(_:)
* didVotePoll(_:)

#### Moved to GroupChannelDelegate
* channelDidUpdateReadStatus(_:)
* channelDidUpdateDeliveryStatus(_:)
* channelDidUpdateTypingStatus(_:)
* channelDidChangeMemberCount(_:)
* channel(_:didReceiveInvitation:inviter:)
* channel(_:didDeclineInvitation:inviter:)
* channel(_:userDidJoin:)
* channel(_:userDidLeave:)
* channelWasHidden(_:)

#### Moved to OpenChannelDelegate
* channelDidChangeParticipantCount(_:)
* channel(_:userDidEnter:)
* channel(_:userDidExit:)

### BaseMessage
#### Changed
* `parent` changes to `parentMessage`
* channelType property type `String` to `ChannelType`

#### Removed 
* `parentMessageText`
* `metaArray`, Use `metaArrays`

### FileMessage
#### Removed
* `requestState`

### UserMessage
#### Removed 
* `requestState`

### PreviousMessageListQuery
#### Change
* `loadWithCompletionHandler:` to `loadNext(completionHandler:)`

### Params
#### New
* Introduced `InitParams` for `SendbirdChat.initialize(params:)`
* Introduced `UserUpdateParams` for `SendbirdChat.updateCurrentUserInfo(params:)`

#### Changed
* `UserMessageParams` to `UserMessageCreateParams` and `UserMessageUpdateParams`
* `FileMessageParams` to `FileMessageCreateParams` and `FileMessageUpdateParams`
* `GroupChannelParams` to `GroupChannelCreateParams` and `GroupChannelUpdateParams`
    * `strict` to `isStrict`
    * `discoverable` to `isDiscoverable`
* `OpenChannelParams` to `OpenChannelCreateParams` and `OpenChannelUpdateParams`

### v3.x 
- Please refer to the [Changelog v3](https://github.com/sendbird/sendbird-ios-framework/blob/master/CHANGELOG.md). 
