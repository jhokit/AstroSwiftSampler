//
//  Charts.swift
//  AstroSwiftSampler macOS
//
//  Created by Jeff Hokit on 11/14/22.
//

import SwiftUI
import Charts

struct Charts: View {
    var body: some View {
        ScrollView{
            VStack{
                VStack{
                    Text("Bar")
                    BarChart().frame(height:300)
                }
                .padding()
                .background(Color.astroUISecondaryGroupedBackground)
                .cornerRadius(Sizes.cornerRadius)
                
                VStack{
                    Text("Line")
                    LineChart().frame(height:300)
                }
                .padding()
                .background(Color.astroUISecondaryGroupedBackground)
                .cornerRadius(Sizes.cornerRadius)
                
                VStack{
                    Text("Point")
                    PointChart().frame(height:300)
                }
                .padding()
                .background(Color.astroUISecondaryGroupedBackground)
                .cornerRadius(Sizes.cornerRadius)
                
                VStack{
                    Text("Fill Gauge")
                    FillGauge()
                }
                .padding()
                .background(Color.astroUISecondaryGroupedBackground)
                .cornerRadius(Sizes.cornerRadius)

            }
        }
        .padding()
        .background(Color.astroUIGroupedBackground)
        .navigationTitle("Charts (beta)")
    }
}

struct DataVis_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}
