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
            Text("UI Elements Coming Soon")
                .tabItem {
                    Image(systemName: "slider.horizontal.below.rectangle")
                    Text("UI Elements")
                }
                
            Text("Colors Coming Soon")
                .tabItem {
                    Image(systemName: "paintpalette.fill")
                    Text("Colors")
                }
            Text("Symbols Coming Soon")
                .tabItem {
                    Image(systemName: "star")
                    Text("Symbols")
                }
        }.background(Color.astroUIBackground)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
