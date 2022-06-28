//
//  UIElements.swift
//  Astro Swift Sampler WatchKit Extension
//
//  Created by rocketjeff on 5/27/22.
//

import SwiftUI

import SwiftUI
import AstroSwiftFoundation

struct Components: View {
    @State var toggleValue: Bool = true
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    @State private var isShowingAlert = false
    @State private var sliderValue: Double = 100
    
    var body: some View {
        
        Form {
            Group{
                Section("Astro Components"){
                    VStack{
                        HStack{
                            Text("Status")
                            Spacer()
                        }
                        HStack{
                            Status(AstroStatus.off)
                            Status(AstroStatus.standby)
                            Status(AstroStatus.normal)
                        }.padding()
                        HStack{
                            Status(AstroStatus.caution)
                            Status(AstroStatus.serious)
                            Status(AstroStatus.critical)
                        }.padding()
                        
                    }
                    VStack{
                        HStack{
                            Text("Status Tag")
                            Spacer()
                        }
                        VStack{
                            Tag(text:AstroStatus.off.description,status: .off)
                            Tag(text:AstroStatus.standby.description,status: .standby)
                            Tag(text:AstroStatus.caution.description,status: .caution)
                            Tag(text:AstroStatus.normal.description,status: .normal)
                            Tag(text:AstroStatus.serious.description,status: .serious)
                            Tag(text:AstroStatus.critical.description,status: .critical)
                        }.padding()
                        
                    }
                    
                    VStack{
                        HStack{
                            Text("Tag")
                            Spacer()
                        }
                        VStack{
                            Tag(text:"Hello")
                        }.padding()
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
                        VStack(){
                            ClassificationMarker(.unclassified)
                            ClassificationMarker(.cui)
                            ClassificationMarker(.confidential)
                            ClassificationMarker(.secret)
                            ClassificationMarker(.topSecret)
                            ClassificationMarker(.topSecretSCI)
                        }

                    }

                }
                
                Section("System Components"){
                    
                    // Toggle and Status
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }
                    
                    // Slider - Still trying to get background color to match
                    // looks wrong even on a standard color list or form
                    //                Slider(value: $sliderValue, in: 0...200) {
                    //                    Text("Slider")
                    //                } minimumValueLabel: {
                    //                    Image(systemName: "tortoise")
                    //                } maximumValueLabel: {
                    //                    Image(systemName: "hare")
                    //                }
                    //
                    // Two kinds of progress
                    ProgressView("Progress", value: progressValue, total: progressTotal)
                    ProgressView()
                    
                    // Link
                    Link("External Link", destination: URL(string: "https://www.astrouxds.com")!)
                    
                    
                    // Button and Alert
                    Button(LocalizedStringKey("Show Alert")) {
                        isShowingAlert = true
                    }
                }
            }// Just setting listRowBackground to a Color doesn't work on AppleWatch, it removes the row the shape.
            // Must recreate the row background shape, foreground, and background.
            // This works on Sections or Groups within a List, but not on the List itself
            .listRowBackground(RoundedRectangle(cornerRadius: 10.0, style:.continuous)
                .background(Color.clear)
                .foregroundColor(.astroUIBackground))
        }
        .alert("Sample Alert", isPresented: $isShowingAlert) {
            Button("Continue", role: .cancel) {}
        } message: {
            Text("Hello")
        }
        
        .navigationTitle("Components")
    }
    
}


struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components()
    }
}
