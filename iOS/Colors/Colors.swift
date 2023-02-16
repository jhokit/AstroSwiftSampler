//
//  Colors.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/13/22.
//

import SwiftUI
import AstroSwiftUtilities

struct Colors: View {
    @State private var selected: Int? = nil
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @State private var showingSheet = false
    
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
                            if (subVariants == nil) {
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
                }.padding()
            }
            .background(Color.astroUIBackground)
            .navigationTitle("Colors")
            .toolbar {
                ToolbarItem(){
                    Button("Layers")  {showingSheet.toggle()}
                }
                ColorSchemeAutomaticToolbarContent()
            }
            .sheet(isPresented: $showingSheet) {
                LayersView()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem {
            Image(systemName: "paintpalette.fill")
            Text("Colors")
        }
        
        
    }
}


struct LayersView: View {
    @Environment(\.dismiss) var dismiss
    @ScaledMetric var cellHeight = 80
    @ScaledMetric var insetPadding = 20
    var defaultSample = ColorSample(name:"Test",color: Color.red) // used when a sample fails to load
    var body: some View {
        NavigationView{
            VStack(){
                // Background Stack
                ZStack(alignment: .bottom){
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants?[0] ?? defaultSample)
                        .frame(height:cellHeight * 3)
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants?[1] ?? defaultSample)
                        .frame(height:cellHeight * 2)
                        .padding([.leading,.trailing,.bottom],insetPadding)
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants?[2] ?? defaultSample)
                        .frame(height:cellHeight)
                        .padding([.leading,.trailing,.bottom],insetPadding*2)
                }
                
                // Grouped Background Stack
                ZStack(alignment: .bottom){
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants?[3] ?? defaultSample)
                        .frame(height:cellHeight * 3)
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants?[4] ?? defaultSample)
                        .frame(height:cellHeight * 2)
                        .padding([.leading,.trailing,.bottom],insetPadding)
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants?[5] ?? defaultSample)
                        .frame(height:cellHeight)
                        .padding([.leading,.trailing,.bottom],insetPadding*2)
                }
                Spacer()
            }
            .background(Color.astroUIBackground)
            .navigationBarTitle("Layers")
            .toolbar {
                ToolbarItem(){
                    Button("Done") {dismiss()}
                }

            }
        }
    }
}


struct LayerTile: View {
    var sample:ColorSample
    @ScaledMetric(relativeTo:.body) var radius = Sizes.cornerRadius
    
    var body: some View {
        HStack{
            VStack{
                Text(sample.name)
                    .padding(6)
                    .foregroundColor(Color(.label))
                    .font(.body)
                    .background(.thinMaterial).cornerRadius(radius)
                Spacer()
            }
            Spacer()
        }
        .padding(.leading,10)
        .padding([.top,.bottom],8)
        .background(sample.color)
        .cornerRadius(radius)
    }
}



struct LayerTile_Previews: PreviewProvider {
    static var previews: some View {
        LayerTile(sample: ColorSample(name:"Test",color: Color.red))
        
    }
}

struct LayersView_Previews: PreviewProvider {
    static var previews: some View {
        LayersView()
            .preferredColorScheme(.dark)
        LayersView()
    }
}
//
//struct Colors_Previews: PreviewProvider {
//    static var previews: some View {
//        Colors()
//    }
//}
