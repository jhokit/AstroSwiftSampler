//
//  SymbolTile.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/10/22.
//

import SwiftUI

struct SymbolTile: View {
    var sample:SymbolSample

    var body: some View {
        ZStack{
            Rectangle().fill(Color.astroUISecondaryBackground).cornerRadius(6)
            VStack{
                if let status = sample.status
                {
                    Image.imageForAstroStatus(status).foregroundColor(Color.colorForAstroStatus(status)).font(.title).padding(2)
                }
                else
                {
                    Image.astroImage(sample.name).font(.title).padding(2)
                }
                Text(sample.name).font(.caption).padding(2)
            }
        }.frame(minHeight:90)
    }
}

struct SymbolTile_Previews: PreviewProvider {
    static var previews: some View {
        SymbolTile(sample: SymbolSample(name: "astro.caution"))
    }
}

