//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI


struct ContentView: View {
    @StateObject var accessiblyOverrides = AccessiblyOverrides()
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        TabView {
            Components()
            Colors()
            Symbols()
        }
        // inject accessiblyOverrides in the environment
        .environmentObject(accessiblyOverrides)
        // override the dynamicTypeSize for all views
        .dynamicTypeSize(accessiblyOverrides.dynamicTypeSize)
        .onAppear(){
            accessiblyOverrides.readUserDefaults()
        }
        // use scenePhase to detect app going in background, onDissapear is not reliable
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                accessiblyOverrides.writeUserDefaults()
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}


