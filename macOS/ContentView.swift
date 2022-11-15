//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    enum Categories{
        case components,colors,symbols,dataVis
    }
    @State private var selection: Categories = .components
    
    var body: some View {
        
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
                    Label("DataVis", systemImage: "chart.pie")
                }

            }
            .frame(minWidth:100) // left column min width
        } detail: {
            switch selection{
            case .components:
                Components()
            case  .colors :
                ColorGrid()
            case  .symbols:
                SymbolGrid()
            case  .dataVis:
                DataVis()

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
