//
//  UIElements.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
//

import SwiftUI
import AstroSwiftFoundation

struct UIElements: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var toggleValue: Bool = true
    @State private var selected: Int? = nil
    @State private var day: String = ""
    private var prog = Progress(totalUnitCount: 2)
    @State private var isShowingSpinner = false
    @State private var isShowingAlert = false
    @ObservedObject private var fruits = Fruits()
    @State private var status:AstroStatus = AstroStatus.Normal
    
    var body: some View {
        HStack{ // HStack to divide the screen in half, a traditional settings screen design on tvOS
            
            // Left side, giant image filler
            ZStack {
                Image(systemName: "slider.horizontal.below.rectangle").resizable().frame(width:400, height:400).scaledToFill()
            }.frame(width:1920/2, height:400)
            
            // Right side, a form of many UI Elements
            Form{
                // Status
                HStack{
                    Text("Status")
                    Spacer()
                    Status(instatus:$status)
                }
                
                // Toggle
                Toggle(isOn: $toggleValue) {
                    Text("Toggle")
                }
                
                // Two kinds of progress
                ProgressView(prog)//.padding(.bottom, 30)
                ProgressView()
                
                // Link
                Link("External Link", destination: URL(string: "https://www.youtube.com/watch?v=iaJNk8gDxwU")!)
                
                // Button and Alert
                Button(LocalizedStringKey("Show Alert")) {
                    isShowingAlert = true
                }
            }
            .onAppear(perform: {prog.becomeCurrent(withPendingUnitCount: 1) ; prog.resignCurrent()})
            .alert("Sample Alert", isPresented: $isShowingAlert) {
                Button("Continue", role: .cancel) {}
            } message: {
                Text("Hello")
            }
            
        }.navigationBarTitle("Form")
        .background(Color.astroUIBackground) // Set the background color for the whole page
        .tabItem {
            Image(systemName: "slider.horizontal.below.rectangle")
            Text("UI Elements")
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



