//
//  ColorGrid.swift
//  AstroSwiftSampler (macOS)
//
//  Created by rocketjeff on 5/17/22.
//

import SwiftUI

struct ColorGrid: View {
    //@State private var selected: Int? = nil
    @State private var sheetColorSample:ColorSample? = nil

    var body: some View {
        
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
        NavigationStack{
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
                    
                    Section("Classification"){
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
                                NavigationLink {
                                    ColorVariantGrid(item: colorSample).navigationTitle(colorSample.name)
                                } label: {
                                    ColorTile(sample: colorSample)
                                }.buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding()
                .sheet(item: $sheetColorSample,
                       content: {theSample in ColorVariantGrid(item: theSample)})
                
            }.background(Color.astroUIBackground)
        }.navigationTitle("Colors")
    }
}



private struct ColorVariantGrid: View {
    @Environment(\.presentationMode) var presentationMode

    let item: ColorSample
    var body: some View {
                
        
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 1)
        ScrollView{
            LazyVGrid(columns:columns){
                if let colorVariants = item.colorVariants
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



struct ColorGrid_Previews: PreviewProvider {
    static var previews: some View {
        ColorGrid()
    }
}
