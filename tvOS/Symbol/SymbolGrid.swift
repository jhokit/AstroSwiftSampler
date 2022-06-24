//
//  SymbolGrid.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
//

import SwiftUI

struct SymbolGrid: View {

    @State private var weight:Font.Weight = .regular
    @State private var font:Font = .body
    
    var body: some View {
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
        LazyVGrid(columns:columns, spacing: 18){
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


struct SymbolGrid_Previews: PreviewProvider {
    static var previews: some View {
        SymbolGrid()
    }
}
