//
//  ColorTile.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ColorTile: View {
    var sample:ColorSample
    @ScaledMetric(relativeTo:.body) var radius = Sizes.cornerRadius
    
    var body: some View {
        HStack{
            Text(sample.name)
                .padding(6)
            #if os(iOS) || os(tvOS)
                .foregroundColor(Color(.label))
            #endif
            #if os(macOS)
                .foregroundColor(Color(.labelColor))
            #endif

                .font(.body)
                .background(.thinMaterial).cornerRadius(radius)
            Spacer()
            if sample.colorVariants != nil {
                Image(systemName: "chevron.right")
                #if os(iOS) || os(tvOS)
                    .foregroundColor(Color(.secondaryLabel))
                #endif
                #if os(macOS)
                    .foregroundColor(Color(.secondaryLabelColor))
                #endif
                    .font(.caption)
                    .padding(.trailing)
            }
        }.padding(.leading,10)
            .padding([.top,.bottom],8)
            .background(sample.color)
            .cornerRadius(radius)
    }
}


struct SampleCell_Previews: PreviewProvider {
    static var previews: some View {
        ColorTile(sample: ColorSample(name:"Test",color: Color.red))
    }
}

