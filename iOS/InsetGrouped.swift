//
//  InsetGroupedList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct InsetGroupedList: View {
    var body: some View {
        List{
            Section(header: Text("Time Zones"), footer: Text("West to East")){
            Text("Pacific")
            Text("Mountain")
            Text("Central")
            Text("Eastern")
            }
            
            Section(header: Text("Cities")){
            Text("San Luis Obispo")
            Text("Denver")
            Text("St. Louis")
            Text("Baltimore")
            }
        }.listStyle(.insetGrouped)
        .navigationBarTitle("Inset Grouped")
    }
}

struct InsetGroupedList_Previews: PreviewProvider {
    static var previews: some View {
        InsetGroupedList()
    }
}
