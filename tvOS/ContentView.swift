//
//  ContentView.swift
//  AstroSwiftSampler
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            Components()
            
            Colors()
            
            Symbols()
            
#warning("Astro Data Vis colors and designs are in development and subject to change")
            Charts()

        }.background(Color.astroUIBackground)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
