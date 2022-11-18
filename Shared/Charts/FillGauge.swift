//
//  FillGauge.swift
//  AstroSwiftSampler macOS
//
//  Created by Jeff Hokit on 11/15/22.
//

import Foundation



import SwiftUI
import Charts
import AstroSwiftFoundation

class GaugeItem: Identifiable {
    var name:String = ""
    var value:Double = 0.0
    var id:String {name}
    
    init(name:String, value:Double){
        self.name = name
        self.value = value
    }
}

private let items:[GaugeItem] = [
    .init(name: "Apps", value: 26),
    .init(name: "Music", value: 13),
    .init(name: "Photos", value: 40),
    .init(name: "Other", value: 6),
    .init(name: "Free", value: 15)
]

struct FillGauge: View {
    
    var body: some View {
        Chart(items){ item in
            Plot {
                BarMark(
                    x: .value("Value",item.value))
            }.foregroundStyle(by: .value("Name", item.name))
        }
        .chartPlotStyle { plotArea in
            plotArea
                .cornerRadius(8)
        }
        .chartYAxis {
            AxisMarks(position: .leading) // move the axis to the left
            AxisMarks(values: .automatic) { _ in
                AxisGridLine()
                    .foregroundStyle(Color.astroUIDarkBlue700)
            }
        }
        .chartXAxis(.hidden)
        .frame(height:50)
        .chartForegroundStyleScale([
            "Apps":  Color.astroDataVis1,
            "Music": Color.astroDataVis4,
            "Photos": Color.astroDataVis8,
            "Other": Color.astroDataVis2,
            "Free": Color.gray]
        )
    }
}




struct SummaryChart_Previews: PreviewProvider {
    static var previews: some View {
        FillGauge()
    }
}
