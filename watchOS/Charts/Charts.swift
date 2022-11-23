//
//  Charts.swift
//  Astro Swift Sampler watchOS
//
//  Created by Jeff Hokit on 11/23/22.
//

import SwiftUI

struct Charts: View {
    var body: some View {
        ScrollView{
            VStack{
                Group{
                    
                    VStack{
                        Text("Bar").font(.caption)
                        BarChart().frame(height:120)
                    }
                    
                    VStack{
                        Text("Line").font(.caption)
                        LineChart().frame(height:120)
                    }
                    VStack{
                        Text("Point").font(.caption)
                        PointChart().frame(height:120)
                    }
                    VStack{
                        Text("Fill Gauge").font(.caption)
                        FillGauge().frame(height:70)
                    }


                }
                .padding()
                .background(Color.astroUISecondaryGroupedBackground)
                .cornerRadius(Sizes.cornerRadius)
            }.navigationTitle("Symbols")
        }
    }
}

struct Charts_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}
