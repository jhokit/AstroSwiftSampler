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
        VStack{
            BarChart()
        }
        .background(Color.astroUIBackground)
        .navigationTitle("DataVis")
    }
}

struct DataVis_Previews: PreviewProvider {
    static var previews: some View {
        DataVis()
    }
}
