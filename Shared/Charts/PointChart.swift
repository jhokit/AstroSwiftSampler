//
//  PointChart.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 11/23/22.
//

import SwiftUI
import Charts

struct PointChart: View {
    @AppStorage("seriesDisplayCountKey") var seriesDisplayCount = 4

    var body: some View {
        Chart(sampleSeries[0..<seriesDisplayCount]){ series in
            ForEach(series.items) { item in

                    PointMark(
                        x: .value("Name",item.name),
                        y: .value("Value",item.value)
                    )
                    .foregroundStyle(by: .value("Name",series.name))
                    .symbol(by: .value("Name",series.name))
                }
        }
        .astroStyle()
    }
}

struct PointChart_Previews: PreviewProvider {
    static var previews: some View {
        PointChart()
    }
}
