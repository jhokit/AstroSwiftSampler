//
//  ColorGrid.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
//

import SwiftUI

struct ColorGrid: View {
    @State private var sheetColorSample:ColorSample? = nil
    
    var body: some View {
        
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
        LazyVGrid(columns:columns, spacing: 18){
            Section("Semantic"){
                if let colorVariants = AstroColorSamples.astroSemantic.colorVariants
                {
                    ForEach(colorVariants, id: \.id) { colorSample in
                        ColorTile(sample: colorSample)
                    }
                }
            }
            
            Section("Core"){
                if let colorVariants = AstroColorSamples.astroCore.colorVariants
                {
                    ForEach(colorVariants, id: \.id) { colorSample in
                        Button(action: {
                            sheetColorSample = colorSample}) {
                            ColorTile(sample: colorSample)
                        }
                        .buttonStyle(PlainTileStyle())
                    }
                }
            }
        }
        .padding()
        .background(Color.astroUIBackground)
        .fullScreenCover(item: $sheetColorSample, content: {theSample in ColorVariantGrid(item: theSample)})
    }
}


struct ColorVariantGrid: View {

    let item: ColorSample
    var body: some View {
        
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
        LazyVGrid(columns:columns, spacing: 18){
            
            Section(item.name){
                if let colorVariants = item.colorVariants
                {
                    ForEach(colorVariants, id: \.id) { colorSample in
                        ColorTile(sample: colorSample)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // fill the screen, as simply using fullScreenCover does not
        .padding()
        .background(Color.astroUIBackground)
        
    }
}

