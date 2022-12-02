//
//  BarChart.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 11/23/22.
//

import SwiftUI
import Charts

struct BarChart: View {
    var body: some View {
        Chart(sampleSeries){ series in
            ForEach(series.items) { item in
                    BarMark(
                        x: .value("Name",item.name),
                        y: .value("Value",item.value)
                    )
                    .foregroundStyle(by: .value("Name",series.name))
            }
        }
        .astroStyle()
    }
}



struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}
