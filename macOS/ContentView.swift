//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String = "components"
    let categories = ["components","colors","symbols"] // a way to identify our three view types
    
    var body: some View {
        
        NavigationSplitView{
            List(selection:$selection){
                NavigationLink(value: categories[0] ) {
                    Label("Components", systemImage: "switch.2")
                }
                NavigationLink(value: categories[1] ) {
                    Label("Colors", systemImage: "paintpalette")
                }
                NavigationLink(value: categories[2] ) {
                    Label("Symbols", systemImage: "star")
                }
            }
            .frame(minWidth:100)
        } detail: {
                switch selection{
                case categories[0]:
                    Components()
                case categories[1]:
                    ColorGrid()
                case categories[2]:
                    SymbolGrid()
                default:
                    EmptyView()
                }
            }
        .frame(minWidth:500, idealWidth: 800)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
