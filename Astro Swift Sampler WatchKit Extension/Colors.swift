//
//  Colors.swift
//  Astro Swift Sampler WatchKit Extension
//
//  Created by rocketjeff on 5/25/22.
//

import SwiftUI
import AstroSwiftFoundation

struct Colors: View {
    var body: some View {
        if let semanticColors = AstroColorSamples.astroSemantic.colorVariants
        {
            ForEach(semanticColors, id: \.id) { colorSample in
                Button(colorSample.name){}
            }
        }

    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
    }
}
