//
//  PlainList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct PlainList: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        List{
            Group{
                Text("Pacific")
                Text("Mountain")
                Text("Central")
                Text("Eastern")
            }.listRowBackground(Color.astroUIBackground(colorScheme))
        }
        .background(Color.astroUIBackground(colorScheme))
        .listStyle(.plain)
        .navigationBarTitle("Plain")
    }
}

struct PlainList_Previews: PreviewProvider {
    static var previews: some View {
        PlainList()
    }
}
