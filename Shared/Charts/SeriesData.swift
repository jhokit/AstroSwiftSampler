//
//  SeriesData.swift
//  AstroSwiftSampler macOS
//
//  Created by Jeff Hokit on 11/15/22.
//

import Charts

class SeriesChartItem: Identifiable {
    var name:String = ""
    var value:Int = 0
    var id:String {name}
    
    init(name:String, value:Int){
        self.name = name
        self.value = value
    }
}

struct Series: Identifiable {
    let name:String
    let items:[SeriesChartItem]
    var id:String {name}
}

let seriesChartItems1:[SeriesChartItem] = [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

let seriesChartItems2:[SeriesChartItem] =  [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

let sampleSeries:[Series] =  [
    .init(name: "Morning", items: seriesChartItems1),
    .init(name: "Evening", items: seriesChartItems2)
]

private enum MarkStyle {
    case bar
    case line
    case point
}
