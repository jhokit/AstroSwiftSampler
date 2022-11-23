//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    
    // Use this enum to allow List to track the selection (rather than using the simpler form of NavigationLink referencing the target view directly)
    enum Categories{
        case components,colors,symbols,dataVis
    }
    @State private var selection: Categories = .components
    
    var body: some View {
        
        // left side navigation
        NavigationSplitView{
            List(selection:$selection){
                NavigationLink(value: Categories.components) {
                    Label("Components", systemImage: "switch.2")
                }
                NavigationLink(value: Categories.colors) {
                    Label("Colors", systemImage: "paintpalette")
                }
                NavigationLink(value: Categories.symbols ) {
                    Label("Symbols", systemImage: "star")
                }
                NavigationLink(value: Categories.dataVis ) {
                    Label("Charts (beta)", systemImage: "chart.pie")
                }//.badge("beta") //- a bug makes a badged item unselectable by pointer

            }
            .frame(minWidth:100) // left column min width
        // main content
        } detail: {
            switch selection{
            case .components:
                Components()
            case .colors :
                ColorGrid()
            case .symbols:
                SymbolGrid()
            case .dataVis:
                Charts()
            }
        }
        .frame(minWidth:500, idealWidth: 800) // overall window min and ideal width
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
