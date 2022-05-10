//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        TabView {
            
            /* LISTS */
            NavigationView{
                List{
                    Group{
                        NavigationLink(destination: PlainList()){ Text("Plain") }
                        NavigationLink(destination: GroupedList()){ Text("Grouped")}
                        NavigationLink(destination: InsetList()){ Text("Inset")}
                        NavigationLink(destination: InsetGroupedList()){ Text("Inset Grouped")}
                        NavigationLink(destination: FormView()){ Text("Form")}
                    }.listRowBackground(Color.astroUIBackground) // apply to a Group because it doesn't work to apply to a List
                }
                .background(Color.astroUIBackground)
                .listStyle(.plain)
                .navigationBarTitle("Lists")
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle.fill")
                Text("Lists")
            }
            
            /* COLORS */
            NavigationView{
                List{
                    Group{
                        NavigationLink(destination: ColorSampleList(sample: AstroColorSamples.astroSemantic)) { Text("Semantic Colors")}
                        NavigationLink(destination: ColorSampleList(sample: AstroColorSamples.astroCore)) { Text("Core Colors")}
                    }.listRowBackground(Color.astroUIBackground)
                }
                .background(Color.astroUIBackground)
                .listStyle(.plain)
                .navigationBarTitle("Colors")
            }.tabItem {
                Image(systemName: "paintpalette.fill")
                Text("Colors")
            }
            
            /* SYMBOLS */
            NavigationView{
                ScrollView{
                    SymbolGrid()
                }
                .background(Color.astroUIBackground)
                .navigationBarTitle("Symbols")
               
            }.navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "star")
                Text("Symbols")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
