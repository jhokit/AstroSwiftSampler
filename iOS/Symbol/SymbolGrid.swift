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
                AccessibilyToolbarContent()
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



