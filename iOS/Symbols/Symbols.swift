//
//  Symbols.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/13/22.
//

import SwiftUI

struct Symbols: View {
    var body: some View {
        NavigationView{
            ScrollView{
                SymbolGrid()
            }
            .background(Color.astroUIBackground)
            .navigationBarTitle("Symbols")
            
        }.navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
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
