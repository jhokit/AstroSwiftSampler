//
//  UIElements.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/13/22.
//

import SwiftUI
import AstroSwiftFoundation

struct Components: View {
    @State private var selected: Int? = nil
    @State var toggleValue: Bool = true
    @State private var sliderValue: Double = 100
    @State private var isShowingAlert = false
    @ObservedObject private var fruits = Fruits()
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5

    var body: some View {
        /* Components */
        NavigationView{
            Form {
                Section("Astro Components"){
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
           
                    let columns:[GridItem] = [GridItem(.flexible(),alignment: .trailing), GridItem(.flexible(),alignment: .trailing)]
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
                    
                    HStack{
                        Text("Tag")
                        Spacer()
                        Tag(text:"Hello")
                    }

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
                
                Section("System Components"){
                    // Toggle and Status
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }

                    Slider(value: $sliderValue, in: 0...200) {
                        Text("Slider")
                    } minimumValueLabel: {
                        Image(systemName: "tortoise")
                    } maximumValueLabel: {
                        Image(systemName: "hare")
                    }
                    

                    ProgressView("Progress", value: progressValue, total: progressTotal)

                    ProgressView()
                    
                    Link("External Link", destination: URL(string: "https://www.astrouxds.com")!)
                    
                    Menu("Menu") {
                        ForEach(fruits.fruits){ fruit in
                            Button(fruit.name) {}
                        }
                    }
                    
                    Button(LocalizedStringKey("Show Alert")) {
                        isShowingAlert = true
                    }
                    
                }.listRowBackground(Color.astroUISecondaryGroupedBackground)
                
                Section("Lists"){
                    NavigationLink("Plain", tag: 2, selection: $selected) {
                        PlainList()
                    }.listRowBackground(selected == 2 ? Color.astroUITertiaryGroupedBackground : Color.astroUISecondaryGroupedBackground)
                    
                    NavigationLink("Grouped", tag: 3, selection: $selected) {
                        GroupedList()
                    }.listRowBackground(selected == 3 ? Color.astroUITertiaryGroupedBackground : Color.astroUISecondaryGroupedBackground)
                    
                    NavigationLink("Inset", tag: 4, selection: $selected) {
                        InsetList()
                    }.listRowBackground(selected == 4 ? Color.astroUITertiaryGroupedBackground : Color.astroUISecondaryGroupedBackground)
                    
                    NavigationLink("Inset Grouped", tag: 5, selection: $selected) {
                        InsetGroupedList()
                    }.listRowBackground(selected == 5 ? Color.astroUITertiaryGroupedBackground : Color.astroUISecondaryGroupedBackground)
                    
                    NavigationLink("Form", tag: 6, selection: $selected) {
                        FormView()
                    }.listRowBackground(selected == 6 ? Color.astroUITertiaryGroupedBackground : Color.astroUISecondaryGroupedBackground)
                }.listRowBackground(Color.astroUISecondaryGroupedBackground)

            }
            .alert("Sample Alert", isPresented: $isShowingAlert) {
                Button("Continue", role: .cancel) {}
            } message: {
                Text("Hello")
            }
            .background(Color.astroUIGroupedBackground) // set the background color for both sections
            .listStyle(.plain)
            .navigationBarTitle("Components")
        }
        .tabItem {
            Image(systemName: "switch.2")
            Text("Components")
        }
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Components()
                .preferredColorScheme(.light)
                
            Components()
        }
    }
}
