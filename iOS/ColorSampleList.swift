//
//  SampleList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ColorSampleList: View {
    var sample:ColorSample
    var body: some View {
        ScrollView{
        VStack(spacing:0) {
            if let colorVariants = sample.colorVariants
            {
                ForEach(colorVariants, id: \.id) { colorSample in
                    let subVariants = colorSample.colorVariants
                    if (subVariants == nil){
                        ColorSwatch(sample: colorSample).frame(height:60)
                    }
                    else {
                        NavigationLink(
                            destination: ColorSampleList(sample: colorSample),
                            label: {
                                ColorSwatch(sample: colorSample).frame(height:60)
                            })
                    }
                }
            }
            Spacer()
        }
        }.background(Color.astroUIBackground)
        .navigationTitle(sample.name)
    }
}


struct SampleList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ColorSampleList(sample: AstroColorSamples.astroCore)
                .preferredColorScheme(.light)
            ColorSampleList(sample: AstroColorSamples.astroCore)
                .preferredColorScheme(.dark)

        }
    }
}
