//
//  Symbols.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
//

import SwiftUI


struct Symbols: View {
    var body: some View {
            ScrollView{
                SymbolGrid()
            }.tabItem {
                Image(systemName: "star")
                Text("Symbols")
        }
    }
}

struct Symbols_Previews: PreviewProvider {
    static var previews: some View {
        Symbols()
    }
}
