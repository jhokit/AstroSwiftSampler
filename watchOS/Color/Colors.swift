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
        List{
            Section("Semantic"){
                if let semanticColors = AstroColorSamples.astroSemantic.colorVariants
                {
                    ForEach(semanticColors, id: \.id) { colorSample in
                        ColorRow(sample: colorSample)
                    }
                }
            }
            
            Section("Status"){
                if let statusColors = AstroColorSamples.astroStatus.colorVariants
                {
                    ForEach(statusColors, id: \.id) { colorSample in
                        ColorRow(sample: colorSample)
                    }
                }
            }
            
            Section("Classification"){
                if let classificationColors = AstroColorSamples.astroClassification.colorVariants
                {
                    ForEach(classificationColors, id: \.id) { colorSample in
                        ColorRow(sample: colorSample)
                    }
                }
            }
            
            Section("Core"){
                if let coreColors = AstroColorSamples.astroCore.colorVariants
                {
                    ForEach(coreColors, id: \.id) { colorSample in
                        if let subVariants = colorSample.colorVariants {
                            NavigationLink() {
                                List{
                                    ForEach(subVariants, id: \.id) { colorSample in
                                        ColorRow(sample: colorSample)
                                    }
                                }
                                    .navigationTitle(colorSample.name)
                            }
                            label: {
                                ColorRow(sample: colorSample)
                            } // for some reason must reapply the styling to ColorRow, as NavigationLink strips it away
                            .listRowBackground(RoundedRectangle(cornerRadius: 10.0, style:.continuous) // apply Astro color and re-apply shape
                            .background(Color.clear)
                            .foregroundColor(colorSample.color))

                        }
                        else {
                            ColorRow(sample: colorSample)
                        }
                    }
                }
            }
        }
        .navigationTitle("Colors")
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
    }
}
