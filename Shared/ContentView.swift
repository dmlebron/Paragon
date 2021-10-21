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
            KidList()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("List")
                }
            Text("Hello, world!")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
