//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI
import AstroSwiftUtilities

struct ContentView: View {
    @StateObject var accessiblyOverrides = AccessiblyOverrides()
    @Environment(\.scenePhase) private var scenePhase
    @AppStorage(colorSchemeAutomaticName) var colorSchemeAutomatic:ColorSchemeAutomatic = .automatic

    var body: some View {
        TabView {
            Components()
            // override the dynamicTypeSize for this views
                .dynamicTypeSize(accessiblyOverrides.dynamicTypeSize)
                .bold(accessiblyOverrides.accessibilityBoldWeight == .bold)
                //.environment(\.legibilityWeight,accessiblyOverrides.accessibilityBoldWeight == .bold ? .bold : .bold) // should work but doesn't on iOS 16. Use bold modifier instead to simulate legibilityWeight. Does not work for views that have specific weight settings, such as ClassificationBanner
            
            Colors()
            
            Symbols()
            // override the dynamicTypeSize for this view
                .dynamicTypeSize(accessiblyOverrides.dynamicTypeSize)
                .bold(accessiblyOverrides.accessibilityBoldWeight == .bold)
                //.environment(\.legibilityWeight,accessiblyOverrides.accessibilityBoldWeight == .bold ? .bold : .bold) // should work but doesn't on iOS 16. Use bold modifier instead to simulate legibilityWeight. Does not work for views that have specific weight settings, such as ClassificationBanner
            
            Charts()
                .dynamicTypeSize(accessiblyOverrides.dynamicTypeSize)
                .bold(accessiblyOverrides.accessibilityBoldWeight == .bold)
                //.environment(\.legibilityWeight,accessiblyOverrides.accessibilityBoldWeight == .bold ? .bold : .bold) // should work but doesn't on iOS 16. Use bold modifier instead to simulate legibilityWeight. Does not work for views that have specific weight settings, such as ClassificationBanner
        }
        // inject accessiblyOverrides in the environment
        .environmentObject(accessiblyOverrides)
        .onAppear(){
            accessiblyOverrides.readUserDefaults()
        }
        // use scenePhase to detect app going in background, onDissapear is not reliable
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                accessiblyOverrides.writeUserDefaults()
            }
        }
        .preferredColorScheme(colorSchemeAutomatic == .light ? .light : colorSchemeAutomatic == .dark ? .dark : nil)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .environment(\.legibilityWeight, .bold) // doesn't work iOS 16
        ContentView()
            .preferredColorScheme(.dark)
    }
}


