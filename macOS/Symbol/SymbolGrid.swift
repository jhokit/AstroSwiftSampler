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
        
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
        
        ScrollView{
            
            LazyVGrid(columns:columns){
                Section("Status"){
                    if let symbols = AstroSymbolSamples.statusSymbols
                    {
                        ForEach(symbols, id: \.id) { symbolSample in
                            SymbolTile(sample: symbolSample, weight: $weight, font:$font)
                        }
                    }
                }
                
                Section("Icons"){
                    if let symbols = AstroSymbolSamples.standardSymbols
                    {
                        ForEach(symbols, id: \.id) { symbolSample in
                            SymbolTile(sample: symbolSample, weight: $weight, font:$font)
                        }
                    }
                }
                
            }
            .padding()
        }
        .background(Color.astroUIBackground)
    }
}
struct SymbolGrid_Previews: PreviewProvider {
    static var previews: some View {
        SymbolGrid()
    }
}
