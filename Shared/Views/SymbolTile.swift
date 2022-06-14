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

    var body: some View {
        HStack{
            if let status = sample.status
            {
                Text(Image.imageForAstroStatus(status)).foregroundColor(Color.colorForAstroStatus(status)).fontWeight(weight).font(font).padding(.leading,4)
            }
            else
            {
                Text(Image.astroImage(sample.name)).fontWeight(weight).font(font).padding(.leading,8)
            }
            Text(sample.name).fontWeight(weight).font(font)
            Spacer()
        }.padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
    }
}

struct SymbolTile_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            SymbolTile(sample: AstroSymbolSamples.standardSymbols.first!, weight: .constant(.regular), font: .constant(.body))
            SymbolTile(sample: AstroSymbolSamples.statusSymbols.first!, weight: .constant(.regular), font: .constant(.body))
        }
    }
}

