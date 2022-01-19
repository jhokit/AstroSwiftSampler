//
//  SampleList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct SampleList: View {
    var sample:ColorSample
    var body: some View {
        ScrollView{
            VStack(spacing:0) {
                if let colorVariants = sample.colorVariants
                {
                    ForEach(colorVariants, id: \.id) { colorSample in
                        let subVariants = colorSample.colorVariants
                        if (subVariants == nil){
                            SampleCell(sample: colorSample).frame(height:60)
                        }
                        else {
                            NavigationLink(
                                destination: SampleList(sample: colorSample),
                                label: {
                                    SampleCell(sample: colorSample).frame(height:60)
                                })
                        }
                    }
                }
            }.navigationTitle(sample.name)
        }
    }
}


struct SampleList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SampleList(sample: AstroColorSamples.astroUI)
                .preferredColorScheme(.light)
            SampleList(sample: AstroColorSamples.astroUI)
                .preferredColorScheme(.dark)

        }
    }
}
