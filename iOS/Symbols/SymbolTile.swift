//
//  SymbolTile.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/10/22.
//

import SwiftUI

struct SymbolTile: View {
    var sample:SymbolSample
    @Binding var weight:Font.Weight
    @Binding var font:Font

    var body: some View {
        ZStack{
            Rectangle().fill(Color.astroUISecondaryBackground).cornerRadius(6)
            VStack{
                if let status = sample.status
                {
                    Text(Image.imageForAstroStatus(status)).foregroundColor(Color.colorForAstroStatus(status)).fontWeight(weight).font(font).padding(2)
                }
                else
                {
                    Text(Image.astroImage(sample.name)).fontWeight(weight).font(font).padding(2)
                }
                Text(sample.name).font(.caption).padding(2)
            }
        }.frame(minHeight:90)
    }
}
//
//struct SymbolTile_Previews: PreviewProvider {
//    static var previews: some View {
//        SymbolTile(sample: SymbolSample(name: "astro.caution"),weight: .regular)
//    }
//}

