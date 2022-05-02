//
//  GroupedList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct GroupedList: View {
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
       Group{
            List{
                Section(header: Text("Time Zones"), footer: Text("West to East")){
                Text("Pacific")
                Text("Mountain")
                Text("Central")
                Text("Eastern")
                }.listRowBackground(Color.astroUISecondaryGroupedBackground(colorScheme)) // applying this to the Group doesn't work
                
                Section(header: Text("Cities")){
                Text("San Luis Obispo")
                Text("Denver")
                Text("St. Louis")
                Text("Baltimore")
                }.listRowBackground(Color.astroUISecondaryGroupedBackground(colorScheme)) // applying this to the Group doesn't work
        }
        .background(Color.astroUIGroupedBackground(colorScheme)) // set the background color for both Lists
        .listStyle(.grouped)  // set the style for both Lists
        .navigationBarTitle("Grouped")
        }
        
    }
}

struct GroupedList_Previews: PreviewProvider {
    static var previews: some View {
        GroupedList()
            .preferredColorScheme(.light)
        GroupedList()
            .preferredColorScheme(.dark)

    }
}
