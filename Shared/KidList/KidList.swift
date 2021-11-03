//
//  KidList.swift
//  Paragon
//
//  Created by David Martinez on 10/19/21.
//

import SwiftUI

struct Kid: Identifiable {
    var id: String { name }
    let name: String
    let age: Int
    let image: Image
    let starCount: Int
}

@MainActor
final class KidListViewModel: ObservableObject {
    let actionButtonsViewModel: ActionButtonsViewModel
    @Published
    private(set) var kids: [Kid]

    init(kids: [Kid]) {
        self.kids = kids
        self.actionButtonsViewModel = ActionButtonsViewModel {
            print("Share tapped")
        } removeAction: {
            print("Remove tapped")
        } addAction: {
            print("Add tapped")
        }
    }

    func loadKids() async {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.kids = [
                Kid(
                    name: "Brandon David Martinez Noblecilla",
                    age: 6,
                    image: Image("brandon"),
                    starCount: 4
                ),
                Kid(
                    name: "Eren Rhaegar Martinez Noblecilla",
                    age: 4,
                    image: Image("eren"),
                    starCount: 7
                ),
                Kid(
                    name: "Leah Sophia Martinez Noblecilla",
                    age: 1,
                    image: Image("leah"),
                    starCount: 14
                )
            ]
        }
    }
}

struct KidList: View {
    @StateObject
    var viewModel = KidListViewModel(kids: [])

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.kids){ kid in
                        KidRow(
                            viewModel: KidRowViewModel(
                                kid: kid,
                                actionButtonsViewModel: ActionButtonsViewModel {
                                    print("share")
                                } removeAction: {
                                    print("remove")
                                } addAction: {
                                    print("add")
                                }
                            )
                        )
                    }
                }
            }
            .navigationBarTitle("Kids")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("show create kid")
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                    .foregroundColor(.green)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.loadKids()
            }
        }
    }
}

struct KidList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabView {
                KidList(viewModel: KidListViewModel(
                    kids: [
                        .init(
                            name: "Brandon David Martinez Noblecilla",
                            age: 6,
                            image: Image("brandon"),
                            starCount: 4
                        ),
                        .init(
                            name: "Eren Rhaegar Martinez Noblecilla",
                            age: 4,
                            image: Image("eren"),
                            starCount: 7
                        ),
                        .init(
                            name: "Leah Sophia Martinez Noblecilla",
                            age: 1,
                            image: Image("leah"),
                            starCount: 14
                        )
                    ]))
                    .tabItem {
                        Label("", systemImage: "list.dash")
                            .labelStyle(IconOnlyLabelStyle())
                    }
                Text("Hello, world!")
                    .tabItem {
                        Image(systemName: "gear")
                    }
            }
            .accentColor(.green)
            TabView {
                KidList(viewModel: KidListViewModel(
                    kids: [
                        .init(
                            name: "Brandon David Martinez Noblecilla",
                            age: 6,
                            image: Image("brandon"),
                            starCount: 4
                        ),
                        .init(
                            name: "Eren Rhaegar Martinez Noblecilla",
                            age: 4,
                            image: Image("eren"),
                            starCount: 7
                        ),
                        .init(
                            name: "Leah Sophia Martinez Noblecilla",
                            age: 1,
                            image: Image("leah"),
                            starCount: 14
                        )
                    ]))
                    .tabItem {
                        Label("", systemImage: "list.dash")
                            .labelStyle(IconOnlyLabelStyle())
                    }
                Text("Hello, world!")
                    .tabItem {
                        Image(systemName: "gear")
                    }
            }
            .accentColor(.green)
            .previewDevice("iPhone SE (2nd generation)")
            TabView {
                KidList(viewModel: KidListViewModel(
                    kids: [
                        Kid(
                            name: "Brandon David Martinez Noblecilla",
                            age: 6,
                            image: Image("brandon"),
                            starCount: 4
                        ),
                        Kid(
                            name: "Eren Rhaegar Martinez Noblecilla",
                            age: 4,
                            image: Image("eren"),
                            starCount: 7
                        ),
                        Kid(
                            name: "Leah Sophia Martinez Noblecilla",
                            age: 1,
                            image: Image("leah"),
                            starCount: 14
                        )
                    ]))
                    .tabItem {
                        Label("", systemImage: "list.dash")
                            .labelStyle(IconOnlyLabelStyle())
                    }
                Text("Hello, world!")
                    .tabItem {
                        Image(systemName: "gear")
                    }
            }
            .accentColor(.green)
            .preferredColorScheme(.dark)
        }
    }
}
