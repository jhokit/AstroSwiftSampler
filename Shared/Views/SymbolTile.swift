//
//  SymbolTile.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/10/22.
//

import SwiftUI
import AstroSwiftFoundation

struct SymbolTile: View {
    var sample:SymbolSample
    @Binding var weight:Font.Weight
    @Binding var font:Font
    @ScaledMetric(relativeTo:.body) var radius = Sizes.cornerRadius
    @ScaledMetric var spacing = 8 // spacing is necessary on tvOS where HStack spacing default is incorrect

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: spacing)
        {
            if let status = sample.status {
                status.image.font(font.weight(weight)).foregroundColor(status.color)
            }
            else {
                Image.astroImage(sample.name).font(font.weight(weight))
            }
           Text(sample.name).fontWeight(weight).font(font)
            
            Spacer()
        }.padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
    }
}

struct SymbolTile_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            SymbolTile(sample: AstroSymbolSamples.standardSymbols.first!, weight: .constant(.regular), font: .constant(.title))
            SymbolTile(sample: AstroSymbolSamples.statusSymbols.first!, weight: .constant(.regular), font: .constant(.body))
        }
    }
}

