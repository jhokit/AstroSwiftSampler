//
//  SampleList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct SampleList: View {
    var samples:[ColorSample]
    var body: some View {
        List(samples) { colorSample in
            SampleCell(sample: colorSample).frame(minHeight:80
            )
        }
    }
}

//struct SampleList_Previews: PreviewProvider {
//    static var previews: some View {
//        SampleList()
//    }
//}
