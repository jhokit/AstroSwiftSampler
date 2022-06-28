//
//  UIElements.swift
//  AstroSwiftSampler (macOS)
//
//  Created by rocketjeff on 5/24/22.
//

import SwiftUI
import AstroSwiftFoundation

struct Components: View {
    @State var toggleValue: Bool = true
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    @State private var isShowingAlert = false
    
    var body: some View {
        
        VStack {
            Form {
                // Astro Components
                VStack(alignment: .leading,spacing:15){
                    // Status
                    Text("Status")
                    HStack{
                        Status(AstroStatus.off)
                        Status(AstroStatus.standby)
                        Status(AstroStatus.normal)
                        Status(AstroStatus.caution)
                        Status(AstroStatus.serious)
                        Status(AstroStatus.critical)
                        Spacer()
                    }
                    
                    // Status Tag
                    VStack(alignment: .leading){
                        Text("Status Tag")
                        HStack(spacing:15){
                            Tag(text:AstroStatus.off.description,status: .off)
                            Tag(text:AstroStatus.standby.description,status: .standby)
                            Tag(text:AstroStatus.caution.description,status: .caution)
                            Spacer()
                        }
                        
                        HStack(spacing:15){
                            Tag(text:AstroStatus.normal.description,status: .normal)
                            Tag(text:AstroStatus.serious.description,status: .serious)
                            Tag(text:AstroStatus.critical.description,status: .critical)
                            Spacer()
                        }
                    }
                    
                    //Tag
                    VStack(alignment: .leading){
                        Text("Tag")
                        HStack{
                            Tag(text:"Hello")
                            Spacer()
                        }
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
                        HStack(spacing:15){
                            ClassificationMarker(.unclassified)
                            ClassificationMarker(.cui)
                            ClassificationMarker(.confidential)
                            Spacer()
                        }
                        
                        HStack(spacing:15){
                            ClassificationMarker(.secret)
                            ClassificationMarker(.topSecret)
                            ClassificationMarker(.topSecretSCI)
                            Spacer()
                        }

                    }

                }
            }
            .padding()
            
            Divider()

            // System Components
            VStack(alignment: .leading,spacing:15){
                
                // Toggle
                Toggle(isOn: $toggleValue) {
                    Text("Toggle")
                }
                
                // Two kinds of progress
                ProgressView("Progress", value: progressValue, total: progressTotal)
                ProgressView().padding(.bottom, 8)
                
                // Link
                Link("External Link", destination: URL(string: "https://www.astrouxds.com")!)
                
                
                // Button and Alert
                Button(LocalizedStringKey("Show Alert")) {
                    isShowingAlert = true
                }
                
            }.padding()
            .alert("Sample Alert", isPresented: $isShowingAlert) {
                Button("Continue", role: .cancel) {}
            } message: {
                Text("Hello")
            }
            
            
            Spacer()
        }.background(Color.astroUIBackground) // Set the background color for the whole page
        
        
    }
}
