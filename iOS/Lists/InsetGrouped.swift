//
//  InsetGroupedList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct InsetGroupedList: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var zones = Zones()
    @ObservedObject private var cities = Cities()

    var body: some View {
        List{
            Section(header: Text("Time Zones"), footer: Text("West to East")){
                ForEach(zones.zones){ zone in
                    Text(zone.name).listRowBackground(Color.astroUISecondaryGroupedBackground)
                }
            }
            
            Section(header: Text("Cities")){
                ForEach(cities.cities){ city in
                    Text(city.name).listRowBackground(Color.astroUISecondaryGroupedBackground)
                }
            }
        }
        .listStyle(.insetGrouped)  // set the style for both Sections
        .background(Color.astroUIGroupedBackground) // set the background color for both Sections
        .navigationBarTitle("Inset Grouped")
    }
}

struct InsetGroupedList_Previews: PreviewProvider {
    static var previews: some View {
        InsetGroupedList()
    }
}
