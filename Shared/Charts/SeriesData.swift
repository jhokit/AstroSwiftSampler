//
//  SeriesData.swift
//  AstroSwiftSampler macOS
//
//  Created by Jeff Hokit on 11/15/22.
//

import Charts

let seriesDisplayCountKey = "SeriesDisplayCount"

class SeriesChartItem: Identifiable, Equatable {
    var name:String = ""
    var value:Int = 0
    var id:String {name}
    
    init(name:String, value:Int){
        self.name = name
        self.value = value
    }
    
    static func ==(lhs: SeriesChartItem, rhs: SeriesChartItem) -> Bool {
        return lhs.name == rhs.name
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

let seriesChartItems3:[SeriesChartItem] = [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

let seriesChartItems4:[SeriesChartItem] =  [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

let seriesChartItems5:[SeriesChartItem] = [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

let seriesChartItems6:[SeriesChartItem] =  [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

let seriesChartItems7:[SeriesChartItem] =  [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

let seriesChartItems8:[SeriesChartItem] =  [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

let sampleSeries:[Series] =  [
    .init(name: "Lorem", items: seriesChartItems1),
    .init(name: "Ipsum", items: seriesChartItems2),
    .init(name: "Dolor", items: seriesChartItems3),
    .init(name: "Amet", items: seriesChartItems4),
    .init(name: "Cillum", items: seriesChartItems5),
    .init(name: "Occaecat", items: seriesChartItems6),
    .init(name: "Consectetur", items: seriesChartItems7),
    .init(name: "Adipiscing", items: seriesChartItems8)
]
