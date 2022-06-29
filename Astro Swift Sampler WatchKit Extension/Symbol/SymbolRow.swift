//
//  SymbolRow.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/27/22.
//

import SwiftUI

struct SymbolRow: View {
    var sample:SymbolSample

    var body: some View {
            
            HStack{
                if let status = sample.status
                {
                    Text(status.image).foregroundColor(status.color)
                }
                else
                {
                    Text(Image.astroImage(sample.name))
                }
                Text(sample.name)
                Spacer()
            }.font(.body)
    }
}

