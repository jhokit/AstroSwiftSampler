//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI


struct Tag2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .tag(2)
        }
}

extension View {
    func tag2() -> some View {
        modifier(Tag2())
    }
}


//struct astroBackground: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .listRowBackground(1 == 1 ? Color.astroUISecondaryBackground : Color.astroUIBackground)
//        }
//}

struct ContentView: View {
    @State private var selected: Int? = nil
    var body: some View {
        TabView {
            
            /* LISTS */
            NavigationView{
                List{
                    NavigationLink("Plain", tag: 2, selection: $selected) {
                        PlainList()
                    }.listRowBackground(selected == 2 ? Color.astroUISecondaryBackground : Color.astroUIBackground)

                    NavigationLink("Grouped", tag: 3, selection: $selected) {
                        GroupedList()
                    }.listRowBackground(selected == 3 ? Color.astroUISecondaryBackground : Color.astroUIBackground)

                    NavigationLink("Inset", tag: 4, selection: $selected) {
                        InsetList()
                    }.listRowBackground(selected == 4 ? Color.astroUISecondaryBackground : Color.astroUIBackground)

                    NavigationLink("Inset Grouped", tag: 5, selection: $selected) {
                        InsetGroupedList()
                    }.listRowBackground(selected == 5 ? Color.astroUISecondaryBackground : Color.astroUIBackground)

                    NavigationLink("Form with Controls", tag: 6, selection: $selected) {
                        FormView()
                    }.listRowBackground(selected == 6 ? Color.astroUISecondaryBackground : Color.astroUIBackground)
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
                    NavigationLink("Semantic Colors", tag: 1, selection: $selected) {
                        ColorSampleList(sample: AstroColorSamples.astroSemantic)
                    }.listRowBackground(selected == 1 ? Color.astroUISecondaryBackground : Color.astroUIBackground)

                    NavigationLink("Core Colors", tag: 2, selection: $selected) {
                        ColorSampleList(sample: AstroColorSamples.astroCore)
                    }.listRowBackground(selected == 2 ? Color.astroUISecondaryBackground : Color.astroUIBackground)
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
