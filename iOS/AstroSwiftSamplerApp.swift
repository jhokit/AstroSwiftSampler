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
        #if os(iOS)
        // allow background colors set by List's .background modifier to work in grouped configurations in light mode
        UITableView.appearance().backgroundColor = .clear
        #endif
    }

    var body: some Scene {
        WindowGroup {
            ContentView().tint(.astroUITint).accentColor(.astroUITint)
        }
    }
}
