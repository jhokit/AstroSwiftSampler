//
//  UIElements.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/13/22.
//

import SwiftUI
import AstroSwiftFoundation

struct Components: View {
    
    @State private var isShowingAlert = false
    @State var someSize:DynamicTypeSize = .large
    
    var body: some View {
        /* Components */
        NavigationSplitView{
            Form {
                AstroComponents()
                
                SystemComponents(isShowingAlert: $isShowingAlert)
                
                Lists()
                
                // show the app version in a section
                Section(){
                    Text(versionString())
                }.listRowBackground(Color.astroUISecondaryGroupedBackground)
            }
            .toolbar{
                AccessibilyToolbarContent()
            }
            
            
            // set the background color for all sections
            .background(Color.astroUIGroupedBackground)
            .scrollContentBackground(.hidden) // required on iOS 16 to let background color show
            .navigationBarTitle("Components")
        } detail: {
            PlainList() // show this by default
            // all other detail views are pushed directly by NavigationLink(s)
        }
        .tabItem {
            Image(systemName: "switch.2")
            Text("Components")
        }
        .alert("Sample Alert", isPresented: $isShowingAlert) {
            Button("Continue", role: .cancel) {}
        } message: {
            Text("Hello")
        }
    }
}

struct AstroComponents: View {
    // column definition shared by two grids in this view
    let columns:[GridItem] = [GridItem(.flexible(),alignment: .trailing), GridItem(.flexible(),alignment: .trailing)]
    
    var body: some View {
        Section("Astro Components"){
            // horizontal row of status symbols
            HStack{
                Text("Status")
                Spacer()
                Status(AstroStatus.off)
                Status(AstroStatus.standby)
                Status(AstroStatus.normal)
                Status(AstroStatus.caution)
                Status(AstroStatus.serious)
                Status(AstroStatus.critical)
            }
            
            // two columns of status tags
            VStack{
                HStack{
                    Text("Status Tag")
                    Spacer()
                }
                LazyVGrid(columns:columns) {
                    Tag(text:AstroStatus.off.description,status: .off)
                    Tag(text:AstroStatus.standby.description,status: .standby)
                    Tag(text:AstroStatus.caution.description,status: .caution)
                    Tag(text:AstroStatus.normal.description,status: .normal)
                    Tag(text:AstroStatus.serious.description,status: .serious)
                    Tag(text:AstroStatus.critical.description,status: .critical)
                }
            }
            
            // single non-status tag
            HStack{
                Text("Tag")
                Spacer()
                Tag(text:"Hello")
            }
            
            // full width stack of classification banners
            VStack{
                HStack{
                    Text("Classification Banners")
                    Spacer()
                }
                ClassificationBanner(.unclassified)
                ClassificationBanner(.cui)
                ClassificationBanner(.confidential)
                ClassificationBanner(.secret)
                ClassificationBanner(.topSecret)
                ClassificationBanner(.topSecretSCI)
            }
            
            // two columns of classification markers
            VStack{
                HStack{
                    Text("Classification Markers")
                    Spacer()
                }
                LazyVGrid(columns:columns) {
                    ClassificationMarker(.unclassified)
                    ClassificationMarker(.cui)
                    ClassificationMarker(.confidential)
                    ClassificationMarker(.secret)
                    ClassificationMarker(.topSecret)
                    ClassificationMarker(.topSecretSCI)
                }
            }
        }.listRowBackground(Color.astroUISecondaryGroupedBackground)
    }
}

struct SystemComponents: View {
    @State var toggleValue: Bool = true
    @State private var sliderValue: Double = 100
    @ObservedObject private var fruits = Fruits()
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    @Binding var isShowingAlert:Bool
    
    var body: some View {
        Section("System Components"){
            // Toggle
            Toggle(isOn: $toggleValue) {
                Text("Toggle")
            }
            
            // Slider
            Slider(value: $sliderValue, in: 0...200) {
                Text("Slider")
            } minimumValueLabel: {
                Image(systemName: "tortoise")
            } maximumValueLabel: {
                Image(systemName: "hare")
            }
            
            // Two kinds of progress
            ProgressView("Progress", value: progressValue, total: progressTotal)
            ProgressView() // This view often dissapears when scrolled offscreen and back onscreen
            
            // Link
            Link("External Link", destination: URL(string: "https://www.astrouxds.com")!)
            
            // Menu
            Menu("Menu") {
                ForEach(fruits.fruits){ fruit in
                    Button(fruit.name) {}
                }
            }
            
            // Button
            Button(LocalizedStringKey("Show Alert")) {
                isShowingAlert = true
            }
        }.listRowBackground(Color.astroUISecondaryGroupedBackground)
    }
}

struct Lists: View {
    var body: some View {
        Section("Lists"){
            // Note that iOS, unlike macOS, automatically handles selection.
            // On iPad in split view mode,iOS 16 and later, it does show a persistent selection.
            // If the background color has been set, as we do below with .listRowBackground,
            // iPadOS shows the selection as a frame around the row in AccentColor.
            // (If the background color is not set, selection is shown by inverting the row in AccentColor).
            List(){
                NavigationLink("Plain") {
                    PlainList()
                }
                NavigationLink("Grouped") {
                    GroupedList()
                }
                NavigationLink("Inset") {
                    InsetList()
                }
                NavigationLink("Inset Grouped") {
                    InsetGroupedList()
                }
                NavigationLink("Form") {
                    FormView()
                }
            }.listRowBackground(Color.astroUISecondaryGroupedBackground)
        }
    }
}

//struct Components_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            Components()
//                .preferredColorScheme(.light)
//            Components()
//        }
//    }
//}

