//
//  SampleCell.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

struct ColorSwatch: View {
    var sample:ColorSample
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle().fill(sample.color)
            VStack{
                Text(sample.name).font(.body).padding(.all,6).background(.ultraThinMaterial)
                    .foregroundColor(Color(.label))
                    .cornerRadius(6)
            Spacer()
            }.padding(.leading,4).padding(.top, 4)

        }
    }
}

struct SampleCell_Previews: PreviewProvider {
    static var previews: some View {
        ColorSwatch(sample: ColorSample(name:"Test",color: Color.red)).frame(height: 60)
    }
}
