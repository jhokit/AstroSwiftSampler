//
//  SymbolGrid.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/9/22.
//

import SwiftUI
import AstroSwiftFoundation

struct SymbolGrid: View {
    @State var columnCount = 2
    var body: some View {
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: columnCount)
        ScrollView{
            LazyVGrid(columns:columns){
                Image.astroStatusOff.renderingMode(.original)
                Image.astroStatusSerious.foregroundColor(Color.astroStatusSerious)
                Image("serious").foregroundColor(Color.astroStatusSerious)

            }
        }.background(Color.astroUIBackground)
    }
}

struct SymbolGrid_Previews: PreviewProvider {
    
    static var previews: some View {
        SymbolGrid()
    }
}
