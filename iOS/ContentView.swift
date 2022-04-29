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
            NavigationView{
                List{
                    NavigationLink(destination: PlainList()){ Text("Plain")
                    }
                    NavigationLink(destination: GroupedList()){ Text("Grouped")
                    }
                    NavigationLink(destination: InsetList()){ Text("Inset")
                    }
                    NavigationLink(destination: InsetGroupedList()){ Text("Inset Grouped")
                    }
                    
                    NavigationLink(destination: FormView()){ Text("Form")
                    }

                    Text("VStack")
                      //  Label("The answer" ,systemImage: "42.circle")
                }.listStyle(.plain)
                .navigationBarTitle("Lists")
                    .toolbar {
                        ColorSchemeAutomaticToolbarContent()
                    }
            } .tabItem {
                Image(systemName: "list.bullet.rectangle.fill")
                Text("Lists")
            }
            
            NavigationView{
                ScrollView{
                    ColorSampleList(sample: AstroColorSamples.astroUI)
                }.navigationBarTitle("Colors")
                    .toolbar {
                        ColorSchemeAutomaticToolbarContent()
                    }
            } .tabItem {
                Image(systemName: "paintpalette.fill")
                Text("Colors")
            }
            
            NavigationView{
                ScrollView{
                    Text("Symbols")
                }.navigationBarTitle("Symbols")
                    .toolbar {
                        ColorSchemeAutomaticToolbarContent()
                    }

            }
            .tabItem {
                Image(systemName: "star")
                Text("Symbols")
            }
        }.modifier(colorSchemeAutomatic())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
