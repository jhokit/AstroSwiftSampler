//
//  ColorSchemeAutomatic.swift
//  AstroSwiftSampler
//
//  Created by rocketjeff on 1/22/22.
//

import Foundation
import SwiftUI


enum ColorSchemeAutomatic:Int{
    case automatic
    case light
    case dark
}

let colorSchemeAutomaticName = "ColorSchemeAutomatic"


struct automaticColorScheme: ViewModifier {
    @AppStorage(colorSchemeAutomaticName) var colorSchemeAutomatic:ColorSchemeAutomatic = .automatic

    func body(content: Content) -> some View {
        if (colorSchemeAutomatic == .light) {
            content.preferredColorScheme(.light)
        }
        else if (colorSchemeAutomatic == .dark) {
            content.preferredColorScheme(.dark)
        }
        else {
            content
        }
    }
}


struct AutomaticColorToolbarContent: ToolbarContent  {
    var placement:ToolbarItemPlacement = .automatic
    @AppStorage(colorSchemeAutomaticName) var colorSchemeAutomatic:ColorSchemeAutomatic = .automatic

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing)  {

            Menu(content: {
                
                Button(action : {
                    colorSchemeAutomatic = .automatic
                }) {
                    if colorSchemeAutomatic == .automatic {
                       Label("Automatic", systemImage: "checkmark")
                    } else {
                       Text("Automatic")
                    }
                }
                
                Button(action : {
                    colorSchemeAutomatic = .light
                }) {
                    if colorSchemeAutomatic == .light {
                       Label("Light", systemImage: "checkmark")
                    } else {
                       Text("Light")
                    }
                }

                Button(action : {
                    colorSchemeAutomatic = .dark
                }) {
                    if colorSchemeAutomatic == .dark {
                       Label("Dark", systemImage: "checkmark")
                    } else {
                       Text("Dark")
                    }
                }
            })
            {
                Image(systemName: "circle.righthalf.filled")
            }
        }
    }
}
