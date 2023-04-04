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
                    ForEach(AstroSymbolSamples.statusSymbols, id: \.id) { symbolSample in
                        SymbolRow(sample: symbolSample)
                    }
                }
                
                Section("Icons"){
                    ForEach(AstroSymbolSamples.standardSymbols, id: \.id) { symbolSample in
                        SymbolRow(sample: symbolSample)
                    }
                }
                
            }.listRowBackground(RoundedRectangle(cornerRadius: 10.0, style:.continuous) // apply Astro color and re-apply shape, this works on Group but not List
            .background(Color.clear)
            .foregroundColor(.astroUIBackground))
        }.navigationTitle("Symbols")
    }
}
