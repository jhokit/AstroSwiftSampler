//
//  SymbolTile.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
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
                    Text(Image.imageForAstroStatus(status)).foregroundColor(Color.colorForAstroStatus(status)).fontWeight(weight).font(font).padding(.top,8)
                }
                else
                {
                    Text(Image.astroImage(sample.name)).fontWeight(weight).font(font).padding(.top,8)
                }
                Text(sample.name).fontWeight(weight).font(.caption).padding(.bottom,8)
            }
        }.frame(minHeight:90)
    }
}
