//
//  InsetList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct InsetList: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Group{
            List{
                Text("Pacific")
                Text("Mountain")
                Text("Central")
                Text("Eastern")
            }.listRowBackground(Color.astroUIBackground(colorScheme))
        }
        .background(Color.astroUIBackground(colorScheme))
        .listStyle(.inset)
        .navigationBarTitle("Inset")
    }
}

struct InsetList_Previews: PreviewProvider {
    static var previews: some View {
        InsetList()
    }
}
