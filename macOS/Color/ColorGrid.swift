//
//  ColorGrid.swift
//  AstroSwiftSampler (macOS)
//
//  Created by rocketjeff on 5/17/22.
//

import SwiftUI

struct ColorGrid: View {
    @State private var weight:Font.Weight = .regular
    @State private var font:Font = .title
    @State private var selected: Int? = nil
    
    var body: some View {
        
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 4)
        
        ScrollView{
            
            LazyVGrid(columns:columns, spacing: 18){
                Section("Semantic"){
                    if let colorVariants = AstroColorSamples.astroSemantic.colorVariants
                    {
                        ForEach(colorVariants, id: \.id) { colorSample in
                            ColorTile(sample: colorSample, weight: $weight, font:$font)
                        }
                    }
                }
                
                Section("Status"){
                    if let colorVariants = AstroColorSamples.astroStatus.colorVariants
                    {
                        ForEach(colorVariants, id: \.id) { colorSample in
                            ColorTile(sample: colorSample, weight: $weight, font:$font)
                        }
                    }
                }
                
                Section("Status"){
                    if let colorVariants = AstroColorSamples.astroClassification.colorVariants
                    {
                        ForEach(colorVariants, id: \.id) { colorSample in
                            ColorTile(sample: colorSample, weight: $weight, font:$font)
                        }
                    }
                }

                Section("Core"){
                    if let colorVariants = AstroColorSamples.astroCore.colorVariants
                    {
                        ForEach(colorVariants, id: \.id) { colorSample in
                            ColorTile(sample: colorSample, weight: $weight, font:$font)
                        }
                    }
                }
            }
            .padding()
            .background(Color.astroUIBackground)
        }
    }
}

struct ColorGrid_Previews: PreviewProvider {
    static var previews: some View {
        ColorGrid()
    }
}
