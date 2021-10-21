//
//  SettingsView.swift
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
                return Image(systemName: "")
            case .regular:
                return Image(systemName: "")
            }
        }
    }

    @Published
    private(set) var cloudStatus: CloudStatus = .synced
    @Published
    private(set) var subscriberStatus: SubscriberStatus = .regular
}

struct SettingsView: View {
    private enum Sections: Int, CaseIterable, Identifiable {
        case premium
        case configuration
        case dangerZone

        var id: Int {
            rawValue
        }

        var title: String {
            switch self {
            case .premium:
                return "PREMIUM"
            case .configuration:
                return "CONFIGURATION"
            case .dangerZone:
                return "DANGER ZONE"
            }
        }

        var rowCount: Int {
            switch self {
            case .premium:
                return 2
            case .configuration:
                return 1
            case .dangerZone:
                return 2
            }
        }
    }

    var body: some View {
        NavigationView {
            List(Sections.allCases) { section in
                Section {
                    ForEach(0..<section.rowCount) { index in
                        row(section: section, row: index)
                    }
                } header: {
                    Text(section.title)
                }

            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Settings")
        }
    }

    @ViewBuilder
    private func row(section: Sections, row: Int) -> some View {
        switch section {
        case .premium:
            if row == 0 {
                VStack(alignment: .leading) {
                    Label {
                        Text("Subscribe")
                    } icon: {
                        Image(systemName: "heart")
                            .foregroundColor(Color.pink)
                    }
                    .padding(.top, 2)
                    Text("Your support it's really important to keep adding more features.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(2)
                        .fixedSize(horizontal: false, vertical: true)
                }
            } else {
                VStack(alignment: .leading) {
                    Label {
                        Text("Synced")
                    } icon: {
                        Image(systemName: "cloud")
                            .foregroundColor(Color.blue)
                    }
                    .padding(.top, 2)
                    Text("All your data is securely stored in iCloud and its accessible from all your devices")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(2)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

        case .configuration:
            VStack(alignment: .leading) {
                HStack {
                    Label {
                        Text("Star value")
                    } icon: {
                        Image(systemName: "star")
                            .foregroundColor(Color.yellow)
                    }
                    Spacer()
                    Group {
                        Text("1")
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "arrow.right")
                            .foregroundColor(.secondary)
                        Image(systemName: "dollarsign.circle")
                            .foregroundColor(.green)
                        Text("1")
                    }
                    .font(.caption)
                }
                Text("Configure the real money value of each star.\nYou can always change this later.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(2)
                    .fixedSize(horizontal: false, vertical: true)
            }
        case .dangerZone:
            if row == 0 {
                Label {
                    Text("Logs")
                } icon: {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(Color.purple)
                }
            } else {
                Label {
                    Text("Delete all data store on this phone")
                } icon: {
                    Image(systemName: "trash")
                        .foregroundColor(Color.red)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
            SettingsView()
                .previewDevice("iPhone SE (2nd generation)")
                .preferredColorScheme(.light)
            SettingsView()
                .preferredColorScheme(.dark)
        }
    }
}
