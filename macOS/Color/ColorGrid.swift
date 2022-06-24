//
//  ColorGrid.swift
//  AstroSwiftSampler (macOS)
//
//  Created by rocketjeff on 5/17/22.
//

import SwiftUI

struct ColorGrid: View {
    @State private var selected: Int? = nil
    
    var body: some View {
        
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
        
        ScrollView{
            
            LazyVGrid(columns:columns){
                Section("Semantic"){
                    if let colorVariants = AstroColorSamples.astroSemantic.colorVariants
                    {
                        ForEach(colorVariants, id: \.id) { colorSample in
                            ColorTile(sample: colorSample)
                        }
                    }
                }
                
                Section("Status"){
                    if let colorVariants = AstroColorSamples.astroStatus.colorVariants
                    {
                        ForEach(colorVariants, id: \.id) { colorSample in
                            ColorTile(sample: colorSample)
                        }
                    }
                }
                
                Section("Status"){
                    if let colorVariants = AstroColorSamples.astroClassification.colorVariants
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
                            ColorTile(sample: colorSample)
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
