//
//  AstroSwiftSamplerApp.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

@main

struct AstroSwiftSamplerApp: App {
    
    init(){
        // allow background colors set by List's .background modifier to work in grouped configurations in light mode
        UITableView.appearance().backgroundColor = .clear
        AccessiblyOverrides.registerUserDefaults()
    }

    var body: some Scene {
        WindowGroup {
            ContentView().tint(.astroUIAccent).accentColor(.astroUIAccent)
        }
    }
}
