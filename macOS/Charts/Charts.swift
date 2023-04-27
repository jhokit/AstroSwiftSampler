//
//  Charts.swift
//  AstroSwiftSampler macOS
//
//  Created by Jeff Hokit on 11/14/22.
//

import SwiftUI
import Charts

struct Charts: View {
    @AppStorage("seriesDisplayCountKey") var seriesDisplayCount = 4
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 500))]){ // as many 500 width columns as will fit
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
        .navigationTitle("Charts")
        .toolbar{
            Picker(selection: $seriesDisplayCount, label: Text("Count")) {
                Text("1 Series").tag(1)
                Text("2 Series").tag(2)
                Text("3 Series").tag(3)
                Text("4 Series").tag(4)
                Text("5 Series").tag(5)
                Text("6 Series").tag(6)
                Text("7 Series").tag(7)
                Text("8 Series").tag(8)
            }
        }
    }
}

struct DataVis_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}
