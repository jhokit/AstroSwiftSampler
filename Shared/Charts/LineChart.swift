//
//  LineChart.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 11/23/22.
//

import SwiftUI
import Charts

struct LineChart: View {
    @AppStorage("seriesDisplayCountKey") var seriesDisplayCount = 4

    var body: some View {
        Chart(sampleSeries[0..<seriesDisplayCount]){ series in
            ForEach(series.items) { item in
                LineMark(
                    x: .value("Name",item.name),
                    y: .value("Value",item.value)
                )
                .foregroundStyle(by: .value("Name",series.name))
                .symbol(by: .value("Name",series.name))
                .interpolationMethod(.catmullRom)
                RuleMark(
                    y: .value("Threshold", 65)
                )
                .astroStyle()
            }
        }
        .astroStyle()
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart()
    }
}
