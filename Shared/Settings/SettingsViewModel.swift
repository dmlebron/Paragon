//
//  SettingsViewModel.swift
//  Paragon
//
//  Created by David Martinez on 10/21/21.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    enum CloudStatus: String, Identifiable {
        case synced
        case notSynced
        case syncing

        var id: String {
            rawValue
        }

        var icon: Image {
            switch self {
            case .synced:
                return Image(systemName: "checkmark.icloud")
            case .notSynced:
                return Image(systemName: "icloud.slash")
            case .syncing:
                return Image(systemName: "arrow.clockwise.icloud")
            }
        }

        var title: String {
            switch self {
            case .synced:
                return "Synced"
            case .notSynced:
                return "Not synced"
            case .syncing:
                return "Syncing"
            }
        }

        var subtitle: String {
            switch self {
            case .synced:
                return "All your data is securely stored in iCloud and its accessible from all your devices"
            case .notSynced:
                return "Your data it's only available on this device.\nDeleting the app will result in loosing all your data. Subscribe to securely automatically back-up all your data"
            case .syncing:
                return "Your data its currently being synced..."
            }
        }
    }
    enum SubscriberStatus: String, Identifiable {
        case premium
        case regular
        var id: String {
            rawValue
        }

        var icon: Image {
            switch self {
            case .premium:
                return Image(systemName: "heart")
            case .regular:
                return Image(systemName: "lock")
            }
        }

        var title: String {
            switch self {
            case .premium:
                return "You are subscribed"
            case .regular:
                return "Become a subscriber"
            }
        }

        var subtitle: String {
            switch self {
            case .premium:
                return "Thank you for your support!"
            case .regular:
                return "Your support it's really important to keep adding more features."
            }
        }
    }

    @Published
    private(set) var cloudStatus: CloudStatus
    @Published
    private(set) var subscriberStatus: SubscriberStatus

    init(cloudStatus: CloudStatus = .synced,
         subscriberStatus: SubscriberStatus = .regular) {
        self.cloudStatus = cloudStatus
        self.subscriberStatus = subscriberStatus
    }
}
