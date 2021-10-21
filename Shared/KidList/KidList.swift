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

struct KidList: View {
    var kids: [Kid] = []
    var body: some View {
        List(kids) { kid in
            //            NavigationLink(destination: KidProfile(kid: kid)) {
            KidRow(kid: kid)
            //            }
        }
    }
}

struct KidRow: View {
    var kid: Kid

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                kid.image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(maxWidth: 100, maxHeight: 100)
                
                VStack(alignment: .leading) {
                    Text(kid.name)
                        .fontWeight(.medium)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 4)
                    HStack {
                        Label {
                            Text("\(kid.starCount)")
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
            ActionButtons()
        }
    }
}

struct KidList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KidList(kids: [
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
            ])
            KidList(kids: [
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
            ])
                .preferredColorScheme(.dark)
        }
    }
}

struct ActionButtons: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Label("share", systemImage: "person.crop.circle.fill")
                    .padding(8)
            }
            .foregroundColor(.purple)
            Divider()
                .padding(.vertical, 4)
            Button(action: {}) {
                Label("add", systemImage: "minus.circle")
                    .padding(8)
            }
            .foregroundColor(.yellow)
            Divider()
                .padding(.vertical, 4)
            Button(action: {}) {
                Label("remove", systemImage: "minus.circle")
                    .padding(8)
            }
            .foregroundColor(.red)
        }
        .fixedSize(horizontal: true, vertical: true)
    }
}
