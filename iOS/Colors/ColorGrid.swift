//
//  ColorGrid.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ColorGrid: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var sample:ColorSample
    var body: some View {
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: (horizontalSizeClass == .compact) ? 1 : 3)
        
            LazyVGrid(columns:columns) {
                ForEach(sample.colorVariants!, id: \.id) { colorSample in
                    let subVariants = colorSample.colorVariants
                    if (subVariants == nil){
                        ColorTile(sample: colorSample)
                    }
                    else {
                        NavigationLink(
                            destination: ColorGrid(sample: colorSample),
                            label: {
                                ColorTile(sample: colorSample)
                            })
                    }
                }
        }
    }
}


struct SampleList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ColorGrid(sample: AstroColorSamples.astroCore)
                .preferredColorScheme(.light)
            ColorGrid(sample: AstroColorSamples.astroCore)
                .preferredColorScheme(.dark)

        }
    }
}
