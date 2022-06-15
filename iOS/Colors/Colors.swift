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
            .navigationBarTitle("Colors")
            .toolbar {
                ToolbarItem(){
                    Button("Layers")  {showingSheet.toggle()}
                }
            }
            .sheet(isPresented: $showingSheet) {
                LayersView()
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
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
    
    var body: some View {
        NavigationView{
            VStack(){
                // Background Stack
                ZStack(alignment: .bottom){
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants![0])
                        .frame(height:cellHeight * 3)
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants![1])
                        .frame(height:cellHeight * 2)
                        .padding([.leading,.trailing,.bottom],insetPadding)
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants![2])
                        .frame(height:cellHeight)
                        .padding([.leading,.trailing,.bottom],insetPadding*2)
                }
                
                
                // Grouped Background Stack
                ZStack(alignment: .bottom){
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants![3])
                        .frame(height:cellHeight * 3)
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants![4])
                        .frame(height:cellHeight * 2)
                        .padding([.leading,.trailing,.bottom],insetPadding)
                    LayerTile(sample: AstroColorSamples.astroSemantic.colorVariants![5])
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
