//
//  Colors.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/13/22.
//

import SwiftUI

struct Colors: View {
    @State private var selected: Int? = nil

    var body: some View {
        NavigationView{
            ScrollView{
            VStack(spacing:0) {
                HStack{Text("SEMANTIC").font(.footnote).padding().frame(height:70) ; Spacer()}
                if let semanticColors = AstroColorSamples.astroSemantic.colorVariants
                {
                    ForEach(semanticColors, id: \.id) { colorSample in
                        let subVariants = colorSample.colorVariants
                        if (subVariants == nil){
                            ColorSwatch(sample: colorSample).frame(height:60)
                        }
                        else {
                            NavigationLink(
                                destination: ColorSampleList(sample: colorSample),
                                label: {
                                    ColorSwatch(sample: colorSample).frame(height:60)
                                })
                        }
                    }
                }
                
                HStack{Text("Status").font(.footnote).padding().frame(height:70) ; Spacer()}
                if let semanticColors = AstroColorSamples.astroStatus.colorVariants
                {
                    ForEach(semanticColors, id: \.id) { colorSample in
                        let subVariants = colorSample.colorVariants
                        if (subVariants == nil){
                            ColorSwatch(sample: colorSample).frame(height:60)
                        }
                        else {
                            NavigationLink(
                                destination: ColorSampleList(sample: colorSample),
                                label: {
                                    ColorSwatch(sample: colorSample).frame(height:60)
                                })
                        }
                    }
                }


                HStack{Text("CORE").font(.footnote).padding() ; Spacer()}
                if let coreColors = AstroColorSamples.astroCore.colorVariants
                {
                    ForEach(coreColors, id: \.id) { colorSample in
                        let subVariants = colorSample.colorVariants
                        if (subVariants == nil){
                            ColorSwatch(sample: colorSample).frame(height:60)
                        }
                        else {
                            NavigationLink(
                                destination: ColorSampleList(sample: colorSample),
                                label: {
                                    ColorSwatch(sample: colorSample).frame(height:60)
                                })
                        }
                    }
                }
            }

//                NavigationLink("Semantic Colors", tag: 1, selection: $selected) {
//                    ColorSampleList(sample: AstroColorSamples.astroSemantic)
//                }.listRowBackground(selected == 1 ? Color.astroUISecondaryBackground : Color.astroUIBackground)
//
//                NavigationLink("Core Colors", tag: 2, selection: $selected) {
//                    ColorSampleList(sample: AstroColorSamples.astroCore)
//                }.listRowBackground(selected == 2 ? Color.astroUISecondaryBackground : Color.astroUIBackground)
            }
            .background(Color.astroUIBackground)
//            .listStyle(.plain)
            .navigationBarTitle("Colors")
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
