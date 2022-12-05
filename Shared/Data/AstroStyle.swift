//
//  AstroStyle.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 12/2/22.
//

import SwiftUI
import Charts


///---- AxisGridLine ------
extension AxisGridLine {
    public func astroStyle() -> some AxisMark {
        return self
            .foregroundStyle(Color.astroUIDarkBlue700)
    }
}

///----- RuleMark ------
extension RuleMark {
    public func astroStyle() -> some ChartContent {
        return self
            .lineStyle(StrokeStyle(lineWidth: 2, dash: [8]))
            .foregroundStyle(Color.astroUIGrey300)
    }
}

///----- Chart ------
extension Chart {
    public func astroStyle() -> some View {
        modifier(AstroChartStyle())
    }
}

private struct AstroChartStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
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
            .chartForegroundStyleScale(
                range: [Color.astroDataVis1,
                        Color.astroDataVis4,
                        Color.astroDataVis8,
                        Color.astroDataVis2,
                        Color.astroDataVis5,
                        Color.astroDataVis7,
                        Color.astroDataVis3,
                        Color.astroDataVis6]
            )
    }
}
