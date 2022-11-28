//
//  LineChart.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 11/23/22.
//

import SwiftUI
import Charts

struct LineChart: View {
    var body: some View {
        Chart(sampleSeries){ series in
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
                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [8]))
                    .foregroundStyle(Color.astroUIGrey300)
            }
        }
        //.chartLegend(position: .trailing)
        .chartYAxis {
            AxisMarks(position: .leading) // move the axis to the left
            AxisMarks(values: .automatic) { _ in
              AxisGridLine()
                    .foregroundStyle(Color.astroUIDarkBlue700)
            }
        }
        .chartXAxis {
            AxisMarks(values: .automatic) { _ in
                AxisGridLine(stroke: StrokeStyle())
                    .foregroundStyle(Color.astroUIDarkBlue700)
                AxisValueLabel()
            }
        }
        .chartForegroundStyleScale([
            "Morning":  Color.astroDataVis1, "Evening": Color.astroDataVis4])
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart()
    }
}
