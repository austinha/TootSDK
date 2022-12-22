// Created by konstantin on 02/11/2022
// Copyright (c) 2022. All rights reserved.

import Foundation

/// Represents a notification of an event relevant to the user.
public struct TootNotification: Codable, Hashable {
    public init(id: String, type: TootNotification.NotificationType, account: Account, createdAt: Date, status: Post? = nil) {
        self.id = id
        self.type = type
        self.account = account
        self.createdAt = createdAt
        self.status = status
    }

    /// The id of the notification in the database.
    public var id: String
    /// The type of event that resulted in the notification.
    public var type: NotificationType
    /// The account that performed the action that generated the notification.
    public var account: Account
    /// The timestamp of the notification.
    public var createdAt: Date
    /// Status that was the object of the notification, e.g. in mentions, reposts, favourites, or polls.
    public var status: Post?

    public enum NotificationType: String, Codable {
        /// Someone followed you
        case follow
        /// Someone mentioned you in their post
        case mention
        /// Someone reposted one of your posts
        case repost = "reblog"
        /// Someone favourited one of your posts
        case favourite
        /// A poll you have voted in or created has ended
        case poll
        /// Someone requested to follow you
        case followRequest = "follow_request"
        /// Someone you enabled notifications for has posted a status
        case status
    }
}

extension TootNotification.NotificationType: Identifiable {
    public var id: Self { self }
}
