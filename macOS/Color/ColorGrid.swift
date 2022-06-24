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
            .sheet(item: $sheetColorSample,
                     content: {theSample in ColorVariantGrid(item: theSample)})

        }
    }
}



private struct ColorVariantGrid: View {
    @Environment(\.presentationMode) var presentationMode

    let item: ColorSample
    var body: some View {
        
        HStack(){
            Spacer()
            Button("Done") {
                presentationMode.wrappedValue.dismiss()
            }.padding(.top,10).padding(.trailing,18)
        }.frame(height:30)
        
        
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
        .frame(minWidth: 500, maxHeight: 500)
        .padding()
        .background(Color.astroUIBackground)
    }
}


struct PlainTileStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    PlainTile(configuration: configuration)
  }
}


struct PlainTile: View {
  @Environment(\.isFocused) var focused: Bool
  let configuration: ButtonStyle.Configuration

  var body: some View {
    configuration.label
      .scaleEffect(focused ? 1.1 : 1)
      .focusable(true)
      .animation(.default, value: focused)
  }
}

struct ColorGrid_Previews: PreviewProvider {
    static var previews: some View {
        ColorGrid()
    }
}
