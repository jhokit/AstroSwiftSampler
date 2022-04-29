//
//  PlainList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct PlainList: View {
    var body: some View {
        List{
           // Label("Pacific" ,systemImage: "42.circle")

            Text("Pacific")
            Text("Mountain")
            Text("Central")
            Text("Eastern")
          //  Label("The answer" ,systemImage: "42.circle")
        }.listStyle(.plain)
        .navigationBarTitle("Plain")
    }
}

struct PlainList_Previews: PreviewProvider {
    static var previews: some View {
        PlainList()
    }
}
