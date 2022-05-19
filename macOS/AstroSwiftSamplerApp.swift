//
//  AstroSwiftSamplerApp.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

@main
struct AstroSwiftSamplerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 600, idealWidth: 600, minHeight: 450, idealHeight: 800)//.tint(.astroUIAccent).accentColor(.astroUIAccent) setting tint and accent color programatically does not seem to work on macOS, even when the user's Accent color is set to multicolor
        }
    }
}
