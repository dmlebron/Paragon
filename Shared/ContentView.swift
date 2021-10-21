//
//  ContentView.swift
//  Shared
//
//  Created by David Martinez on 10/19/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            KidList(viewModel: KidListViewModel(kids: []))
                .tabItem {
                    Label("", systemImage: "list.dash")
                        .labelStyle(IconOnlyLabelStyle())
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
        }
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPhone SE (2nd generation)")
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
