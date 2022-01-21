//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            NavigationView{
                ScrollView{
                    ColorSampleList(sample: AstroColorSamples.astroUI)
                    Spacer()
                    ColorSampleList(sample: AstroColorSamples.astroUI)
                }.navigationBarTitle("Colors")
            }
            .tabItem {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
