//
//  SymbolGrid.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/9/22.
//

import SwiftUI
import AstroSwiftFoundation

struct SymbolGrid: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: (horizontalSizeClass == .compact) ? 2 : 3)
            LazyVGrid(columns:columns){
                Section("Status"){
                    ForEach(AstroSymbolSamples.statusSymbols, id: \.id) { symbolSample in
                        SymbolTile(sample: symbolSample)
                    }
                }
                
                Section("Icons"){
                    ForEach(AstroSymbolSamples.standardSymbols, id: \.id) { symbolSample in
                        SymbolTile(sample: symbolSample)
                    }
                }

            }.padding().background(Color.astroUIBackground)
        }
    
}

struct SymbolGrid_Previews: PreviewProvider {
    
    static var previews: some View {
        SymbolGrid()
    }
}


