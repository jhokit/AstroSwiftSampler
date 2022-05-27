//
//  UIElements.swift
//  AstroSwiftSampler (macOS)
//
//  Created by rocketjeff on 5/24/22.
//

import SwiftUI
import AstroSwiftFoundation

struct UIElements: View {
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
                // Text
                Group{
                    TextField("Name:", text: $name).frame(maxWidth:300)
                    SecureField("Password:", text: $password).frame(maxWidth:300)
                    Divider()
                }

                // Toggle and Status
                Group{
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }
                    
                    HStack{
                    Text("Status")
                    Status(instatus:$status)
                    Spacer()
                            
                    }
                    Divider()
                }

                // Two kinds of progress
                Group{
                    ProgressView("Progress", value: progressValue, total: progressTotal)
                    ProgressView().padding(.bottom, 8)
                    Divider()
                }
                
                // Link
                Group{
                    Link("External Link", destination: URL(string: "https://www.astrouxds.com")!)
                    Divider()
                }
                
                
                // Button and Alert
                Group{
                    Button(LocalizedStringKey("Show Alert")) {
                        isShowingAlert = true
                    }
                }

            }.padding()
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
            }.padding()
            Spacer()
        } .background(Color.astroUIBackground) // Set the background color for the whole page

        
    }
}
