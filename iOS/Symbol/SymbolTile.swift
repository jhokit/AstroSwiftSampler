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
            HStack{
                if let status = sample.status
                {
                    Text(Image.imageForAstroStatus(status)).foregroundColor(Color.colorForAstroStatus(status)).fontWeight(weight).font(font).padding(.leading,8)
                }
                else
                {
                    Text(Image.astroImage(sample.name)).fontWeight(weight).font(font).padding(.leading,8)
                }
                Text(sample.name).fontWeight(weight).font(font)
                Spacer()
            }
        }.frame(minHeight:70)
    }
}
//
//struct SymbolTile_Previews: PreviewProvider {
//    static var previews: some View {
//        SymbolTile(sample: SymbolSample(name: "astro.caution"),weight: .regular)
//    }
//}

