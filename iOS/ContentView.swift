//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            SampleList(sample: AstroColorSamples.astroUI).navigationTitle("Astro Colors")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
