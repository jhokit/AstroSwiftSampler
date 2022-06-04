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
                    Text(Image.imageForAstroStatus(status)).foregroundColor(Color.colorForAstroStatus(status))//.padding(.leading,8)
                }
                else
                {
                    Text(Image.astroImage(sample.name))//.padding(.leading,8)
                }
                Text(sample.name)
                Spacer()
            }.font(.body)
    }
}

