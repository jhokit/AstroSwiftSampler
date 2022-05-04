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
                    Group{
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
                    }.listRowBackground(Color.astroUIBackground)
                }
                //
                .background(Color.astroUIBackground)
                .listStyle(.plain)
                .navigationBarTitle("Lists")
            }
            
            .tabItem {
                Image(systemName: "list.bullet.rectangle.fill")
                Text("Lists")
            }
            
            NavigationView{
                ScrollView{
                    ColorSampleList(sample: AstroColorSamples.astroUI)
                }.navigationBarTitle("Colors")
            } .tabItem {
                Image(systemName: "paintpalette.fill")
                Text("Colors")
            }
            
            NavigationView{
                ScrollView{
                    Text("Symbols")
                }.navigationBarTitle("Symbols")
            }
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
