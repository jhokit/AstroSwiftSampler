//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selected: Int? = 1

    var body: some View {
        
        NavigationView {
            List{
                NavigationLink(tag: 1, selection: self.$selected) {
                    UIElements()
                } label: {
                    Label("UI Elements", systemImage: "switch.2")
                }

                NavigationLink(tag: 2, selection: self.$selected) {
                    ColorGrid()
                } label: {
                    Label("Colors", systemImage: "paintpalette")
                }
                
                NavigationLink(tag: 3, selection: self.$selected) {
                    SymbolGrid()
                } label: {
                    Label("Symbols", systemImage: "star")
                }

            }.listStyle(.sidebar).frame(minWidth:100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
