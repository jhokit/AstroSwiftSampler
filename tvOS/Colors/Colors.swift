//
//  Colors.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
//

import SwiftUI

struct Colors: View {
    var body: some View {
            ScrollView{
                ColorGrid()
            }.tabItem {
                Image(systemName: "paintpalette.fill")
                Text("Colors")
        }
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
    }
}
