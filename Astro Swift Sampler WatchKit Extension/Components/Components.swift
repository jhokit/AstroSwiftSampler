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
    @State var name: String = ""
    @State var password: String = ""
    @State var toggleValue: Bool = true
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    @State private var isShowingAlert = false
    @State private var status:AstroStatus = AstroStatus.Normal
    
    var body: some View {
        
            List {
                // Text
                Group{
                    TextField("Name:", text: $name).frame(maxWidth:300)
                    SecureField("Password:", text: $password).frame(maxWidth:300)

                    // Toggle and Status
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }
                    
                    HStack{
                    Text("Status")
                        Status($status)
                    Spacer()
                    }

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
                .listRowBackground(RoundedRectangle(cornerRadius: 10.0, style:.continuous) // apply Astro color and re-apply shape, this works on Group but not List
                .background(Color.clear)
                .foregroundColor(.astroUIBackground))
            }
            .alert("Sample Alert", isPresented: $isShowingAlert) {
                Button("Continue", role: .cancel) {}
            } message: {
                Text("Hello")
            }
            .onChange(of: toggleValue) { newValue in // Link the change of the toggle control to the status control
                if (toggleValue){
                    status = .Normal
                }
                else {
                    status = .Off
                }
            }
            .navigationTitle("Components")
    }
        
}
