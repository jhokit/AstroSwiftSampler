//
//  UIElements.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
//

import SwiftUI
import AstroSwiftFoundation
import AstroSwiftUtilities

struct Components: View {
    @State var toggleValue: Bool = true
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    @State private var isShowingAlert = false
    
    var body: some View {
        HStack{
            // Left side, a form of Astro Components
            // An uncomfortable number of hard coded padding and spacing numbers here, to make it fit on one screen.
            // Revisit in tvOS 16, where focus and scrolling are improved.
            Form{
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
                    
                    HStack{
                        Text("Status Tag")
                        Spacer()
                        HStack(){
                            VStack(alignment:.center) {
                                Tag(text:AstroStatus.off.description,status: .off)
                                Tag(text:AstroStatus.caution.description,status: .caution)
                            }
                            VStack(alignment:.center){
                                Tag(text:AstroStatus.standby.description,status: .standby)
                                Tag(text:AstroStatus.serious.description,status: .serious)
                            }
                            VStack(alignment:.center){
                                Tag(text:AstroStatus.normal.description,status: .normal)
                                Tag(text:AstroStatus.critical.description,status: .critical)
                            }
                        }
                    }.padding([.top,.bottom],4)
                    
                    HStack{
                        Text("Tag")
                        Spacer()
                        Tag(text:"Hello")
                    }
                    
                    HStack{
                        Text("Clock")
                        Spacer()
                        // standard Astro Clock, equivalent to AstroClock(verbatimFormatter: AstroClock.astroDayTime)
                        VStack(alignment: .trailing,spacing: 12){
                            AstroClock()
                            AstroClock(formatter: Date.FormatStyle())
                        }
                    }
                    
                    HStack{
                        Text("Interval Timer")
                        Spacer()
                        VStack(alignment: .trailing,spacing: 12){
                            IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), options: .all)
                            IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), formatter: Date.IntervalFormatStyle())
                        }

                    }
                    
                    VStack(spacing:8){
                        HStack{
                            Text("Classification Banners")
                            Spacer()
                        }
                        HStack(spacing:4){
                            VStack() {
                                ClassificationBanner(.unclassified)
                                ClassificationBanner(.secret)
                            }
                            VStack(){
                                ClassificationBanner(.cui)
                                ClassificationBanner(.topSecret)
                            }
                            VStack(){
                                ClassificationBanner(.confidential)
                                ClassificationBanner(.topSecretSCI)
                            }
                        }

                    }.padding([.top,.bottom],4)
                    
                    HStack{
                        Text("Classification Markers")
                        Spacer()
                        HStack(){
                            VStack(alignment:.center) {
                                ClassificationMarker(.unclassified)
                                ClassificationMarker(.secret)
                            }
                            VStack(alignment:.center){
                                ClassificationMarker(.cui)
                                ClassificationMarker(.topSecret)
                            }
                            VStack(alignment:.center){
                                ClassificationMarker(.confidential)
                                ClassificationMarker(.topSecretSCI)
                            }
                        }
                    }.padding([.top,.bottom],4)
                    
                }
            }
            
            // Right Side, a form of system components
            Form{
                Section("System Components"){
                    // Toggle
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }
                    
                    // Two kinds of progress
                    ProgressView("Progress", value: progressValue, total: progressTotal)
                    ProgressView()
                    
                    // Link
                    Link("External Link", destination: URL(string: "https://www.youtube.com/watch?v=iaJNk8gDxwU")!)
                    
                    // Button and Alert
                    Button(LocalizedStringKey("Show Alert")) {
                        isShowingAlert = true
                    }
                    Text(versionString())
                }
            }
            .alert("Sample Alert", isPresented: $isShowingAlert) {
                Button("Continue", role: .cancel) {}
            } message: {
                Text("Hello")
            }
            
        }.navigationBarTitle("Form")
            .background(Color.astroUIBackground) // Set the background color for the whole page
            .tabItem {
                Image(systemName: "switch.2")
                Text("Components")
            }
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components()
    }
}


