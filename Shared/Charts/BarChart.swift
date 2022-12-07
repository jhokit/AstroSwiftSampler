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
                // example of how to add a divider line at the top of a bar
                .annotation(position: .top, alignment: .leading, spacing: -1) { context in // starting an one pixel below the bar
                    if context.targetSize.height > 1 // only if the bar is more than 1 pt high
                    {
                        if series.name == "Morning"{    // only for the first series in the stack. How to generalize this for Astro?
                            Rectangle() // A one pt black line
                                .fill(Color.black)
                                .frame(width: context.targetSize.width, height: 1)
                        }
                    }
                }
// some test code to add a text annoatation within the bar, truncating to nothing if it does not work reliably,
// because truncation always leaves a ..., which still has a small size
//                .annotation(position: .overlay, alignment: .top, spacing: 0) { context in
//                    Text(String(item.value))
//                        .foregroundColor(.black)
//                        .font(.caption)
//                        .padding(4)
//                        .scaledToFit()
//                        .clipped()
//                }
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


