//
//  Colors.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/13/22.
//

import SwiftUI

struct Colors: View {
    @State private var selected: Int? = nil
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        let columns:[GridItem] = Array(repeating: .init(.flexible()), count: (horizontalSizeClass == .compact) ? 1 : 3)

        NavigationView{
            ScrollView{
                LazyVGrid(columns:columns) {
                Section("Semantic") {
                    ForEach(AstroColorSamples.astroSemantic.colorVariants!, id: \.id) { colorSample in
                        ColorTile(sample: colorSample)
                    }
                }
                    
                    Section("Status") {
                        ForEach(AstroColorSamples.astroStatus.colorVariants!, id: \.id) { colorSample in
                            ColorTile(sample: colorSample)
                        }
                    }

           
                    Section("Classification") {
                        ForEach(AstroColorSamples.astroClassification.colorVariants!, id: \.id) { colorSample in
                            ColorTile(sample: colorSample)
                        }
                    }

                    Section("Core") {
                        ForEach(AstroColorSamples.astroCore.colorVariants!, id: \.id) { colorSample in
                            let subVariants = colorSample.colorVariants
                            if (subVariants == nil){
                                ColorTile(sample: colorSample)
                            }
                            else {
                                NavigationLink(
                                    destination: ColorGrid(sample: colorSample),
                                    label: {
                                        ColorTile(sample: colorSample)
                                    })
                            }
                        }
                    }

                
           
                
            }

            }
            .background(Color.astroUIBackground)
//            .listStyle(.plain)
            .navigationBarTitle("Colors")
        }.navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
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
