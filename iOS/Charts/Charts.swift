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
                VStack(spacing: 18) {
                    Group{
                        VStack{
                            Text("Bar")
                            BarChart()
                        }
                        
                        VStack{
                            Text("Line")
                            LineChart()
                        }
                        
                        VStack{
                            Text("Point")
                            PointChart()
                        }
                        
                        VStack{
                            Text("Fill Gauge")
                            FillGauge()
                        }
                    }
                    .padding()
                    .background(Color.astroUISecondaryGroupedBackground)
                    .cornerRadius(Sizes.cornerRadius)
                }.padding()
            }
            .background(Color.astroUIGroupedBackground)
            .navigationBarTitle("Charts")
            .toolbar{
                AccessibilyToolbarContent()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
