//
//  ColorTile.swift
//  AstroSwiftSampler (macOS)
//
//  Created by rocketjeff on 5/17/22.
//

import SwiftUI

struct ColorTile: View {
    var sample:ColorSample
    @Binding var weight:Font.Weight
    @Binding var font:Font

    var body: some View {
        
        ZStack{
            Rectangle().fill(sample.color).cornerRadius(6)
            Text(sample.name).font(.body).padding(4).background(.thinMaterial).cornerRadius(6)
        }.frame(minHeight:150)
    }
}

