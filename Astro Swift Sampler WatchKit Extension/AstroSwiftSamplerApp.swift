//
//  AstroSwiftSamplerApp.swift
//  Astro Swift Sampler WatchKit Extension
//
//  Created by rocketjeff on 5/24/22.
//

import SwiftUI

@main
struct AstroSwiftSamplerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().tint(.astroUIAccent).accentColor(.astroUIAccent)//  must also set tint color in Assets
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
