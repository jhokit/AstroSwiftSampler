//
//  UIElements.swift
//  AstroSwiftSampler (macOS)
//
//  Created by rocketjeff on 5/24/22.
//

import SwiftUI
import AstroSwiftFoundation

struct Components: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var toggleValue: Bool = true
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    @State private var isShowingAlert = false
    @State private var status:AstroStatus = AstroStatus.Normal
    
    var body: some View {
        
        VStack {
            Form {
                // Astro Components
                VStack(alignment: .leading,spacing:15){
                    // Status
                    Text("Status")
                    HStack{
                        Status(AstroStatus.Off)
                        Status(AstroStatus.Standby)
                        Status(AstroStatus.Normal)
                        Status(AstroStatus.Caution)
                        Status(AstroStatus.Serious)
                        Status(AstroStatus.Critical)
                        Spacer()
                    }
                    
                    // Status Tag
                    VStack(alignment: .leading){
                        Text("Status Tag")
                        HStack(spacing:15){
                            Tag(text:AstroStatus.Off.description,status: .Off)
                            Tag(text:AstroStatus.Standby.description,status: .Standby)
                            Tag(text:AstroStatus.Caution.description,status: .Caution)
                            Spacer()
                        }
                        
                        HStack(spacing:15){
                            Tag(text:AstroStatus.Normal.description,status: .Normal)
                            Tag(text:AstroStatus.Serious.description,status: .Serious)
                            Tag(text:AstroStatus.Critical.description,status: .Critical)
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
