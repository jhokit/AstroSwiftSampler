//
//  PointChart.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 11/23/22.
//

import SwiftUI
import Charts

struct PointChart: View {
    var body: some View {
        Chart(sampleSeries){ series in
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
        .chartForegroundStyleScale([
            "Morning":  Color.astroDataVis1, "Evening": Color.astroDataVis4])
    }
}

struct PointChart_Previews: PreviewProvider {
    static var previews: some View {
        PointChart()
    }
}
