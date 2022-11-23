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
        NavigationView{
            
            ScrollView{
                VStack{
                    Text("Bar")
                    BarChart()
                }
                .padding()
                .background(Color.astroUISecondaryGroupedBackground)
                .cornerRadius(Sizes.cornerRadius)

                VStack{
                    Text("Line")
                    LineChart()
                }
                .padding()
                .background(Color.astroUISecondaryGroupedBackground)
                .cornerRadius(Sizes.cornerRadius)
                
                VStack{
                    Text("Point")
                    PointChart()
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
            .padding()
            .background(Color.astroUIGroupedBackground)
            .navigationTitle("Charts")
            .toolbar{
                AccessibilyToolbarContent()
            }
        }
        .tabItem {
            Image(systemName: "chart.pie")
            Text("Charts")
        }
        .badge("beta")
    }
}

struct DataVis_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}
