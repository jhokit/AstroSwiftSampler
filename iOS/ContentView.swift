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
            Components()
            Colors()
            Symbols()
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




// experiments with generalizing row selection, not working yet

//struct Tag2: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .tag(2)
//    }
//}

//extension View {
//    func tag2() -> some View {
//        modifier(Tag2())
//    }
//}


//struct astroBackground: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .listRowBackground(1 == 1 ? Color.astroUISecondaryBackground : Color.astroUIBackground)
//        }
//}
