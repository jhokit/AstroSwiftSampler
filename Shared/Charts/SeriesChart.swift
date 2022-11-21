//
//  SeriesChart.swift
//  AstroSwiftSampler macOS
//
//  Created by Jeff Hokit on 11/15/22.
//

import SwiftUI
import Charts
import AstroSwiftFoundation

class SeriesChartItem: Identifiable {
    var name:String = ""
    var value:Int = 0
    var id:String {name}
    
    init(name:String, value:Int){
        self.name = name
        self.value = value
    }
}

private struct Series: Identifiable {
    let name:String
    let items:[SeriesChartItem]
    var id:String {name}
}

private let barChartItems:[SeriesChartItem] = [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

private let barChartItems2:[SeriesChartItem] =  [
    .init(name: "Alpha", value: Int.random(in: 0...100)),
    .init(name: "Bravo", value: Int.random(in: 0...100)),
    .init(name: "Charlie", value: Int.random(in: 0...100)),
    .init(name: "Delta", value: Int.random(in: 0...100)),
    .init(name: "Echo", value: Int.random(in: 0...100)),
    .init(name: "Foxtrot", value: Int.random(in: 0...100))
]

private let stackedItems:[Series] =  [
    .init(name: "Morning", items: barChartItems),
    .init(name: "Evening", items: barChartItems2)
]

private enum MarkStyle {
    case bar
    case line
    case point
}

struct SeriesChart: View {
    @State fileprivate var markStyle:MarkStyle = .line
    
    var body: some View {
        VStack{
            HStack{
                //                Button("Randomize") { randomize()}
                //Spacer()
                Picker("", selection: $markStyle) {
                    Text("Bar").tag(MarkStyle.bar)
                    Text("Line").tag(MarkStyle.line)
                    Text("Point").tag(MarkStyle.point)
                }.frame(maxWidth:200)
            }.padding()
                .pickerStyle(.segmented)
            
            Chart(stackedItems){ series in
                ForEach(series.items) { item in
                    switch markStyle {
                    case .bar:
                        BarMark(
                            x: .value("Name",item.name),
                            y: .value("Value",item.value)
                        )
                        .foregroundStyle(by: .value("Name",series.name))
                    case .line:
                        LineMark(
                            x: .value("Name",item.name),
                            y: .value("Value",item.value)
                        )
                        .foregroundStyle(by: .value("Name",series.name))
                        .symbol(by: .value("Name",series.name))
                        .interpolationMethod(.catmullRom)
                        RuleMark(
                            y: .value("Threshold", 65)
                        ) .lineStyle(StrokeStyle(lineWidth: 2, dash: [6]))
                        #if os(iOS) || os(tvOS)
                            .foregroundStyle(Color(.secondaryLabel))
                        #endif
                        #if os(macOS)
                            .foregroundStyle(Color(.secondaryLabelColor))
                        #endif

                    case .point:
                        PointMark(
                            x: .value("Name",item.name),
                            y: .value("Value",item.value)
                        )
                        .foregroundStyle(by: .value("Name",series.name))
                        .symbol(by: .value("Name",series.name))
                    }
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
            .frame(minHeight:300)
            .chartForegroundStyleScale([
                "Morning":  Color.astroDataVis1, "Evening": Color.astroDataVis4])
        }
    }

    

}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        SeriesChart()
    }
}
