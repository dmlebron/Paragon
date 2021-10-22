//
//  ActionButtons.swift
//  Paragon
//
//  Created by David Martinez on 10/20/21.
//

import SwiftUI

struct ActionButtonsViewModel {
    let shareAction: () -> ()
    let removeAction: () -> ()
    let addAction: () -> ()
}

struct ActionButtons: View {
    let viewModel: ActionButtonsViewModel
    var body: some View {
        HStack(alignment: .center) {
            Button(action: viewModel.shareAction) {
                Label("share", systemImage: "person.crop.circle.fill")
                    .padding(8)
            }
            .foregroundColor(.purple)
            Divider()
                .padding(.vertical, 4)
            Button(action: viewModel.removeAction) {
                Label("remove", systemImage: "minus.circle")
                    .padding(8)
            }
            .foregroundColor(.red)
            Divider()
                .padding(.vertical, 4)
            Button(action: viewModel.addAction) {
                Label("add", systemImage: "minus.circle")
                    .padding(8)
            }
            .foregroundColor(.yellow)
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity)
    }
}
