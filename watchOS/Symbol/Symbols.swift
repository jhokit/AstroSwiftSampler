//
//  Symbols.swift
//  Astro Swift Sampler WatchKit Extension
//
//  Created by rocketjeff on 5/27/22.
//

import SwiftUI

struct Symbols: View {
    var body: some View {
        List{
            Group{
                Section("Status"){
                    if let symbols = AstroSymbolSamples.statusSymbols
                    {
                        ForEach(symbols, id: \.id) { symbolSample in
                            SymbolRow(sample: symbolSample)
                        }
                    }
                }
                
                Section("Icons"){
                    if let symbols = AstroSymbolSamples.standardSymbols
                    {
                        ForEach(symbols, id: \.id) { symbolSample in
                            SymbolRow(sample: symbolSample)
                        }
                    }
                }
                
            }.listRowBackground(RoundedRectangle(cornerRadius: 10.0, style:.continuous) // apply Astro color and re-apply shape, this works on Group but not List
            .background(Color.clear)
            .foregroundColor(.astroUIBackground))
        }.navigationTitle("Symbols")
    }
}
