//
//  SampleCell.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ColorSwatch: View {
    var sample:ColorSample
    var body: some View {
        VStack(alignment: .leading){
            Text(sample.name)
            Rectangle().fill(sample.color)
        }
    }
}

struct SampleCell_Previews: PreviewProvider {
    static var previews: some View {
        ColorSwatch(sample: ColorSample(name:"Test",color: Color.red))
    }
}
