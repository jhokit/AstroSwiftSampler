//
//  DataVis.swift
//  AstroSwiftSampler macOS
//
//  Created by Jeff Hokit on 11/14/22.
//

import SwiftUI
import Charts

struct DataVis: View {
    var body: some View {
        ScrollView{
            VStack{
                Section("Series Chart"){
                    SeriesChart()
                }
            }
        }
        .padding()
        .background(Color.astroUIBackground)
        .navigationTitle("DataVis")
    }
}

struct DataVis_Previews: PreviewProvider {
    static var previews: some View {
        DataVis()
    }
}
