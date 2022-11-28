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
        VStack{
            Chart(items){ item in
                Plot {
                    BarMark(
                        x: .value("Value",item.value))
                }.foregroundStyle(by: .value("Name", item.name))
            }
            .frame(height:50)
            .padding(.bottom,12)
            
            // an attempt at a vertical fill chart, doesn't look good, legend and items have opposite order
//            Chart(items){ item in
//                Plot {
//                    BarMark(
//                        y: .value("Value",item.value))
//                }.foregroundStyle(by: .value("Name", item.name))
//            }
//            .frame(width:100,height: 100)
//            .chartLegend(position: .trailing)
        }
        
        .chartPlotStyle { plotArea in
            plotArea
                .cornerRadius(8)
        }
        .chartYAxis(.hidden)
        .chartXAxis(.hidden)
        .chartForegroundStyleScale([
            "Apps":  Color.astroDataVis1,
            "Music": Color.astroDataVis4,
            "Photos": Color.astroDataVis8,
            "Other": Color.astroDataVis2,
            "Free": Color.astroDataVis7]
        )
    }
}




struct SummaryChart_Previews: PreviewProvider {
    static var previews: some View {
        FillGauge()
    }
}
