//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI


struct ContentView: View {
    @AppStorage(colorSchemeAutomaticName) var colorSchemeAutomatic:ColorSchemeAutomatic = .automatic
    
    var body: some View {
        TabView {
            NavigationView{
                ScrollView{
                    ColorSampleList(sample: AstroColorSamples.astroUI)
                }.navigationBarTitle("Colors")
                    .toolbar {
                        AutomaticColorToolbarContent()
                    }
            } .tabItem {
                Image(systemName: "paintpalette.fill")
                Text("Colors")
            }
            
            NavigationView{
                ScrollView{
                    Text("Symbols")
                }.navigationBarTitle("Symbols")
            }
            .tabItem {
                Image(systemName: "star")
                Text("Symbols")
            }
        }.modifier(automaticColorScheme())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
