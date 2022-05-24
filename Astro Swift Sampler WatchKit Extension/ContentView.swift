//
//  ContentView.swift
//  Astro Swift Sampler WatchKit Extension
//
//  Created by rocketjeff on 5/24/22.
//

import SwiftUI
import AstroSwiftFoundation

struct ContentView: View {
    var body: some View {
        List{
            NavigationLink() {
               Text("hello")// UIElements()
            } label: {
                Label("UIElements", systemImage: "slider.horizontal.below.rectangle")
            }

            NavigationLink() {
                Text("hello")//ColorGrid()
            } label: {
                Label("Colors", systemImage: "paintpalette")
            }
            
            NavigationLink() {
                Text("hello")//SymbolGrid()
            } label: {
                Label("Symbols", systemImage: "star")
            }
        }.background(Color.astroUIBackground).listRowBackground(Color.astroUISecondaryBackground)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
