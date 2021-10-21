//
//  KidRow.swift
//  Paragon
//
//  Created by David Martinez on 10/21/21.
//

import SwiftUI

struct KidRow: View {
    var kid: Kid

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: KidProfile(kid: kid)) {
                HStack(alignment: .center) {
                    kid.image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)

                    VStack(alignment: .leading) {
                        Text(kid.name)
                            .font(.title3)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 2)
                        HStack {
                            Label {
                                Text("\(kid.starCount)")
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
            ActionButtons()
        }
        .padding(.horizontal)
    }
}

struct KidRow_Previews: PreviewProvider {
    static var previews: some View {
        KidRow(
            kid: Kid(
                name: "Brandon David Martinez Noblecilla",
                age: 6,
                image: Image("brandon"),
                starCount: 4)
        )
    }
}
