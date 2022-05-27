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
            Group{
                NavigationLink() {
                   UIElements()
                } label: {
                    Label("UI Elements", systemImage: "switch.2")
                    }
                
                NavigationLink() {
                    Colors()
                } label: {
                    Label("Colors", systemImage: "paintpalette")
                }
                
                NavigationLink() {
                    Text("hello")//SymbolGrid()
                } label: {
                    Label("Symbols", systemImage: "star")
                }
            }
            .listRowBackground(RoundedRectangle(cornerRadius: 10.0, style:.continuous) // apply Astro color and re-apply shape
                .background(Color.clear)
                .foregroundColor(.astroUIBackground))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
