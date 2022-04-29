//
//  InsetList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct InsetList: View {
    var body: some View {
        List{
            Text("Pacific")
            Text("Mountain")
            Text("Central")
            Text("Eastern")
          //  Label("The answer" ,systemImage: "42.circle")
        }.listStyle(.inset)
        .navigationBarTitle("Inset")
    }
}

struct InsetList_Previews: PreviewProvider {
    static var previews: some View {
        InsetList()
    }
}
