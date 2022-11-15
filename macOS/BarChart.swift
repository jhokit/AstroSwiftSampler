//
//  BarChart.swift
//  AstroSwiftSampler macOS
//
//  Created by Jeff Hokit on 11/15/22.
//

import SwiftUI
import Charts
import AstroSwiftFoundation

struct BarChartItem: Identifiable {
    let name:String
    let value:Int
    var id:String {name}
}

struct Series: Identifiable {
    let name:String
    let items:[BarChartItem]
    var id:String {name}
}

let barChartItems:[BarChartItem] = [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

let barChartItems2:[BarChartItem] = [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

let stackedItems:[Series] =  [
    .init(name: "Morning", items: barChartItems),
    .init(name: "Evening", items: barChartItems2)
]
    
struct BarChart: View {
    var body: some View {
        Chart(stackedItems){ series in
            ForEach(series.items) { item in
                PointMark(
                    x: .value("Name",item.name),
                    y: .value("Amount",item.value)
                )
                .foregroundStyle(by: .value("Name",series.name))
                .symbol(by: .value("Name",series.name))
            }
        }
        .padding()
        .chartForegroundStyleScale([
            "Morning":  Color.astroDataVis1, "Evening": Color.astroDataVis4
        ])
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}
