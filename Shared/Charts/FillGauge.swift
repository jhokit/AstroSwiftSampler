//
//  FillGauge.swift
//  AstroSwiftSampler macOS
//
//  Created by Jeff Hokit on 11/15/22.
//

import SwiftUI
import Charts
//import AstroSwiftFoundation

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
    .init(name: "Apps", value: Double.random(in: 5.0 ..< 25.0)),
    .init(name: "Music", value: Double.random(in: 5.0 ..< 25.0)),
    .init(name: "Photos", value: Double.random(in: 5.0 ..< 25.0)),
    .init(name: "Other", value: Double.random(in: 5.0 ..< 25.0)),
    .init(name: "Free", value: Double.random(in: 5.0 ..< 25.0))
]

struct FillGauge: View {
    
    var body: some View {
        Chart(items){ item in
            Plot {
                BarMark(
                    x: .value("Value",item.value))
            }.foregroundStyle(by: .value("Name", item.name))
        }
        .astroStyle()
        .frame(height:50)
        .padding(.bottom,12)
        .chartPlotStyle { plotArea in
            plotArea
                .cornerRadius(8)
        }
        .chartYAxis(.hidden)
        .chartXAxis(.hidden)
    }
}




struct SummaryChart_Previews: PreviewProvider {
    static var previews: some View {
        FillGauge()
    }
}
