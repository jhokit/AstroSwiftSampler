//
//  PlainList.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct PlainList: View {
    @ObservedObject private var zones = Zones()
    
    var body: some View {
        List(zones.zones){ zone in
            Text(zone.name).listRowBackground(Color.astroUIBackground)
        }
        .background(Color.astroUIBackground)
        .listStyle(.plain)
        .navigationBarTitle("Plain")
    }
}

struct PlainList_Previews: PreviewProvider {
    static var previews: some View {
        PlainList()
    }
}
