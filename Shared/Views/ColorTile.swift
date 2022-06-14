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
                .foregroundColor(Color(.label))
                .font(.body)
                .background(.ultraThinMaterial).cornerRadius(radius)
            Spacer()
            #if os(iOS) // only show the navigation arrow on iOS until fall 2022 OS's offer navigaiton on all platforms
            if sample.colorVariants != nil {
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(.secondaryLabel))
                    .font(.caption)
                    .padding(.trailing)
            }
            #endif
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

