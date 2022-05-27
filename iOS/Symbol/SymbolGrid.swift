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
    @State private var weight:Font.Weight = .regular
    @State private var font:Font = .body

    var body: some View {
        
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: (horizontalSizeClass == .compact) ? 1 : 2)
        LazyVGrid(columns:columns){
            Section("Status"){
                ForEach(AstroSymbolSamples.statusSymbols, id: \.id) { symbolSample in
                    SymbolTile(sample: symbolSample, weight: $weight, font:$font)
                }
            }
            
            Section("Icons"){
                ForEach(AstroSymbolSamples.standardSymbols, id: \.id) { symbolSample in
                    SymbolTile(sample: symbolSample, weight: $weight, font:$font)
                }
            }
            
        }
        .padding()
            .background(Color.astroUIBackground)
            .toolbar{
                ToolbarItem(id: "weight", placement: .navigationBarTrailing) {
                    Menu(content: {
                        WeightButton(currentWeight: $weight, myWeight: .ultraLight, myFontWeightName:"Ultra Light")
                        WeightButton(currentWeight: $weight, myWeight: .thin, myFontWeightName:"Thin")
                        WeightButton(currentWeight: $weight, myWeight: .light, myFontWeightName:"Light")
                        WeightButton(currentWeight: $weight, myWeight: .regular, myFontWeightName:"Regular")
                        WeightButton(currentWeight: $weight, myWeight: .medium, myFontWeightName:"Medium")
                        WeightButton(currentWeight: $weight, myWeight: .semibold, myFontWeightName:"Semibold")
                        WeightButton(currentWeight: $weight, myWeight: .bold, myFontWeightName:"Bold")
                        WeightButton(currentWeight: $weight, myWeight: .heavy, myFontWeightName:"Heavy")
                        WeightButton(currentWeight: $weight, myWeight: .black, myFontWeightName:"Black")
                    }){Image(systemName: "lineweight")}
                }

                ToolbarItem(id: "size", placement: .navigationBarTrailing) {
                    Menu(content: {
                        Group{
                            FontButton(currentFont:$font, myFont: .largeTitle, myFontName:"Large Title")
                            FontButton(currentFont:$font, myFont: .title, myFontName:"Title")
                            FontButton(currentFont:$font, myFont: .title2, myFontName:"Title 2")
                            FontButton(currentFont:$font, myFont: .title3, myFontName:"Title 3")
                            FontButton(currentFont:$font, myFont: .headline, myFontName:"Headline")
                            FontButton(currentFont:$font, myFont: .subheadline, myFontName:"Subheadline")
                            FontButton(currentFont:$font, myFont: .body, myFontName:"Body")
                        }
                        Group // group to get around the swift UI limit of 10 static items
                        {
                            FontButton(currentFont:$font, myFont: .callout, myFontName:"Callout")
                            FontButton(currentFont:$font, myFont: .footnote, myFontName:"Footnote")
                            FontButton(currentFont:$font, myFont: .caption, myFontName:"Caption")
                            FontButton(currentFont:$font, myFont: .caption2, myFontName:"Caption 2")
                        }
                    }){Image(systemName: "textformat.size")}
                }
            }
    }
    
}

struct FontButton: View {
    @Binding var currentFont:Font
    var myFont:Font
    var myFontName:String
    
    var body: some View{
        Button(action: {currentFont = myFont}) {
            if currentFont == myFont {Label(myFontName, systemImage: "checkmark")} else {Text(myFontName)}
        }
    }
}

struct WeightButton: View {
    @Binding var currentWeight:Font.Weight
    var myWeight:Font.Weight
    var myFontWeightName:String
    
    var body: some View{
        Button(action: {currentWeight = myWeight}) {
            if currentWeight == myWeight {Label(myFontWeightName, systemImage: "checkmark")} else {Text(myFontWeightName)}
        }
    }
}

struct SymbolGrid_Previews: PreviewProvider {
    
    static var previews: some View {
        SymbolGrid()
    }
}



