//
//  GroupedList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct GroupedList: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var zones = Zones()
    @ObservedObject private var cities = Cities()
    
    var body: some View {
        List{
            Section(header: Text("Time Zones"), footer: Text("West to East")){
                ForEach(zones.zones){ zone in
                    Text(zone.name).listRowBackground(Color.astroUISecondaryGroupedBackground(colorScheme))
                }
            }
            
            Section(header: Text("Cities")){
                ForEach(cities.cities){ city in
                    Text(city.name).listRowBackground(Color.astroUISecondaryGroupedBackground(colorScheme))
                }
            }
        }
        .listStyle(.grouped)  // set the style for both Sections
        .background(Color.astroUIGroupedBackground(colorScheme)) // set the background color for both Sections
        .navigationBarTitle("Grouped")
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
