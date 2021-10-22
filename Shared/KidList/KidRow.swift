//
//  KidRow.swift
//  Paragon
//
//  Created by David Martinez on 10/21/21.
//

import SwiftUI
final class KidRowViewModel: ObservableObject {
    @Published
    private(set) var kid: Kid
    let actionButtonsViewModel: ActionButtonsViewModel

    init(kid: Kid, actionButtonsViewModel: ActionButtonsViewModel) {
        self.kid = kid
        self.actionButtonsViewModel = actionButtonsViewModel
    }
}

struct KidRow: View {
    @State
    var viewModel: KidRowViewModel

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: KidProfile(kid: viewModel.kid)) {
                HStack(alignment: .center) {
                    viewModel.kid.image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)

                    VStack(alignment: .leading) {
                        Text(viewModel.kid.name)
                            .font(.title3)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 2)
                        HStack {
                            Label {
                                Text("\(viewModel.kid.starCount)")
                                    .foregroundColor(.secondary)
                            } icon: {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            .font(.title3)
                        }
                        .padding(.bottom, 4)
                        Text("last synced 5 minutes ago")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            ActionButtons(viewModel: viewModel.actionButtonsViewModel)
        }
        .padding(.horizontal)
    }
}

struct KidRow_Previews: PreviewProvider {
    static var previews: some View {
        KidRow(
            viewModel: KidRowViewModel(
                kid: Kid(
                    name: "Brandon David Martinez Noblecilla",
                    age: 6,
                    image: Image("brandon"),
                    starCount: 14
                ),
                actionButtonsViewModel: ActionButtonsViewModel {
print("ferferf")
                } removeAction: {
                    print("ferferf")
                } addAction: {
                    print("ferferf")
                }
            )
        )
    }
}
