//
//  SettingsView.swift
//  Paragon
//
//  Created by David Martinez on 10/21/21.
//

import SwiftUI

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

    var viewModel: SettingsViewModel
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
                        Text(viewModel.subscriberStatus.title)
                    } icon: {
                        viewModel.subscriberStatus.icon
                            .foregroundColor(Color.pink)
                    }
                    .padding(.top, 2)
                    Text(viewModel.subscriberStatus.subtitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(2)
                        .fixedSize(horizontal: false, vertical: true)
                }
            } else {
                VStack(alignment: .leading) {
                    Label {
                        Text(viewModel.cloudStatus.title)
                    } icon: {
                        viewModel.cloudStatus.icon
                            .foregroundColor(Color.blue)
                    }
                    .padding(.top, 2)
                    Text(viewModel.cloudStatus.subtitle)
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
            SettingsView(viewModel: .init(cloudStatus: .notSynced, subscriberStatus: .regular))
            SettingsView(viewModel: .init(cloudStatus: .synced, subscriberStatus: .premium))
                .previewDevice("iPhone SE (2nd generation)")
                .preferredColorScheme(.light)
            SettingsView(viewModel: .init())
                .preferredColorScheme(.dark)
        }
    }
}
