//
//  UIElements.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
//

import SwiftUI
import AstroSwiftFoundation

struct Components: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var toggleValue: Bool = true
    @State private var selected: Int? = nil
    @State private var day: String = ""
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    @State private var isShowingSpinner = false
    @State private var isShowingAlert = false
    @ObservedObject private var fruits = Fruits()
    @State private var status:AstroStatus = AstroStatus.Normal
    
    var body: some View {
        HStack{ // HStack to divide the screen in half, a traditional settings screen design on tvOS
            
            // Left side, giant image filler
            ZStack {
                Image(systemName: "switch.2").resizable().frame(width:400, height:400).scaledToFill().foregroundColor(Color(UIColor.secondaryLabel))
            }.frame(width:1920/2, height:400)
            
            // Right side, a form of many Components
            Form{
                
                Section("Astro Components"){
                    HStack{
                        Text("Status")
                        Spacer()
                        Status(AstroStatus.Off)
                        Status(AstroStatus.Standby)
                        Status(AstroStatus.Normal)
                        Status(AstroStatus.Caution)
                        Status(AstroStatus.Serious)
                        Status(AstroStatus.Critical)
                    }
                    
                    let columns:[GridItem] = [GridItem(.flexible(),alignment: .trailing),       GridItem(.flexible(),alignment: .trailing),GridItem(.flexible(),alignment: .trailing)]
                    VStack{
                        HStack{
                            Text("Status Tag")
                            Spacer()
                        }
                        LazyVGrid(columns:columns) {
                            Tag(text:AstroStatus.Off.description,status: .Off)
                            Tag(text:AstroStatus.Standby.description,status: .Standby)
                            Tag(text:AstroStatus.Caution.description,status: .Caution)
                            Tag(text:AstroStatus.Normal.description,status: .Normal)
                            Tag(text:AstroStatus.Serious.description,status: .Serious)
                            Tag(text:AstroStatus.Critical.description,status: .Critical)
                        }
                    }

                    HStack{
                        Text("Tag")
                        Spacer()
                        Tag(text:"Hello")
                    }
                }

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
        .onChange(of: toggleValue) { newValue in // Link the change of the toggle control to the status control
            if (toggleValue){
                status = .Normal
            }
            else {
                status = .Off
            }
        }
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components()
    }
}


