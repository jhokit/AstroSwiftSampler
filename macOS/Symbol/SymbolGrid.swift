//
//  SymbolGrid.swift
//  AstroSwiftSampler (macOS)
//
//  Created by rocketjeff on 5/19/22.
//

import SwiftUI

struct SymbolGrid: View {
    @State private var weight:Font.Weight = .regular
    @State private var font:Font = .body
    
    var body: some View {
                
        ScrollView{
            
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 250))]){// as many 250 width columns as will fit
                Section("Status"){
                    ForEach(AstroSymbolSamples.statusSymbols, id: \.id) { symbolSample in
                        SymbolTile(sample: symbolSample, weight: $weight, font:$font)
                    }
                }
                
                Section("Icons"){
                    ForEach(AstroSymbolSamples.standardSymbols, id: \.id) { symbolSample in
                        SymbolTile(sample: symbolSample, weight: $weight, font:$font)
                    }
                }
                
            }
            .padding()
        }
        .background(Color.astroUIBackground)
        .navigationTitle("Symbols")
    }
}
struct SymbolGrid_Previews: PreviewProvider {
    static var previews: some View {
        SymbolGrid()
    }
}
