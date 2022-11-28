//
//  Charts.swift
//  AstroSwiftSampler tvOS
//
//  Created by Jeff Hokit on 11/28/22.
//

import SwiftUI

struct Charts: View {
    var body: some View {
        HStack{
            VStack{
                Text("Bar")
                BarChart().frame(height:335)
                
                Spacer()
                
                Text("Line")
                LineChart().frame(height:335)
            }
            VStack{
                Text("Point")
                PointChart().frame(height:335)
                
                Spacer()

                Text("Fill Gauge")
                FillGauge().frame(height:335)
            }
        }
        .tabItem {
            Image(systemName: "chart.xyaxis.line")
            Text("Charts")
        }
    }
}

struct Charts_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}
