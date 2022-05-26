//
//  ColorSwatch.swift
//  Astro Swift Sampler WatchKit Extension
//
//  Created by rocketjeff on 5/26/22.
//

import SwiftUI



struct ColorSwatch: View {
    var sample:ColorSample
    var body: some View {
        Text(sample.name)
            .listRowBackground(RoundedRectangle(cornerRadius: 10.0, style:.continuous) // apply Astro color and re-apply shape
                .background(Color.clear)
                .foregroundColor(sample.color))
    }
}



struct SampleCell_Previews: PreviewProvider {
    static var previews: some View {
        ColorSwatch(sample: ColorSample(name:"Test",color: Color.red)).frame(height: 60)
    }
}
