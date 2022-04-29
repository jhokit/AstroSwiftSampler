//
//  GroupedList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct GroupedList: View {
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

          //  Label("The answer" ,systemImage: "42.circle")
        }.listStyle(.grouped)
        .navigationBarTitle("Grouped")
    }
}

struct GroupedList_Previews: PreviewProvider {
    static var previews: some View {
        GroupedList()
    }
}
