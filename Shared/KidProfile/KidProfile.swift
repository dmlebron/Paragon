//
//  KidProfile.swift
//  Paragon
//
//  Created by David Martinez on 10/19/21.
//

import SwiftUI

struct KidProfile: View {
    var kid: Kid
    var body: some View {
        Text("\(kid.name)")
    }
}

struct KidProfile_Previews: PreviewProvider {
    static var previews: some View {
        KidProfile(
            kid: .init(
                name: "Brandon",
                age: 6,
                image: Image("brandon"),
                starCount: 14
            )
        )
    }
}
