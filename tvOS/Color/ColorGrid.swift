//
//  ColorGrid.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
//

import SwiftUI

struct ColorGrid: View {

//    @State private var weight:Font.Weight = .regular
//    @State private var font:Font = .title
    
    var body: some View {
        
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
        LazyVGrid(columns:columns, spacing: 18){
            Section("Semantic"){
                if let colorVariants = AstroColorSamples.astroSemantic.colorVariants
                {
                    ForEach(colorVariants, id: \.id) { colorSample in
                        Button(action: {}) {
                            
                           // ColorTile(sample: colorSample, weight: $weight, font:$font)
                            ColorTile(sample: colorSample)
                        }
                        .buttonStyle(PlainTileStyle())
                    }
                }
            }
            
            Section("Core"){
                if let colorVariants = AstroColorSamples.astroCore.colorVariants
                {
                    ForEach(colorVariants, id: \.id) { colorSample in
                        Button(action: {}) {
                            //ColorTile(sample: colorSample, weight: $weight, font:$font)
                            ColorTile(sample: colorSample)
                        }
                        .buttonStyle(PlainTileStyle())
                    }
                }
            }
        }
        .padding()
        .background(Color.astroUIBackground)
    }
}

