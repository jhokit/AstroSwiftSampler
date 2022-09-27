//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ContentView: View {
  //  @State private var selection: String = "components"
    let category = ["components","colors","symbols"]
    
    var body: some View {
        
        NavigationSplitView{
            List(){
                NavigationLink(value: category[0] ) {
                    Label("Components", systemImage: "switch.2")
                }
                NavigationLink(value: category[1] ) {
                    Label("Colors", systemImage: "paintpalette")
                }
                NavigationLink(value: category[2] ) {
                    Label("Symbols", systemImage: "star")
                }
                
            }
            .listStyle(.sidebar)
            .frame(minWidth:100)
            .navigationDestination(for: String.self) { theCategory in
                switch theCategory{
                case category[0]:
                    Components()
                case category[1]:
                    ColorGrid()
                case category[2]:
                    SymbolGrid()
                default:
                    EmptyView()
                }
            }
        } detail: {
            // no default view here
        }
        .frame(minWidth:500, idealWidth: 800)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
