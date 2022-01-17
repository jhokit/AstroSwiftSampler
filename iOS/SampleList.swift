//
//  SampleList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct SampleList: View {
    var samples:[ColorSample]
    var listName:String
    var body: some View {
        ScrollView{
            VStack(spacing:0) {
                ForEach(samples, id: \.id) { colorSample in
                    if colorSample.colorVariants == nil
                    {
                        SampleCell(sample: colorSample).frame(height:60)
                    }
                    else
                    {
                        NavigationLink(
                            destination: SampleList(samples: colorSample.colorVariants!),
                            label: {
                                SampleCell(sample: colorSample).frame(height:60)
                            })
                    }
                }
            }
        }.navigationTitle(listName)
    }
}

struct SampleList_Previews: PreviewProvider {
    static var previews: some View {
        SampleList(samples: AstroColorSamples.core)
    }
}
