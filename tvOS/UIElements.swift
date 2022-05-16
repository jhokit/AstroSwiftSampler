//
//  UIElements.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
//

import SwiftUI

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

    var body: some View {
        HStack{
            ZStack {
                Image(systemName: "slider.horizontal.below.rectangle").resizable().frame(width:400, height:400).scaledToFill()
            }.frame(width:1920/2, height:400)
    
        Form{
//            TextField("Name", text: $name)
//            SecureField("Password", text: $password)
            
            Toggle(isOn: $toggleValue) {
                Text("Toggle")
            }
            
            ProgressView(prog)//.padding(.bottom, 30)
            ProgressView()
            
            Link("External Link", destination: URL(string: "https://www.wikipedia.org")!)
            
            Button(LocalizedStringKey("Show Alert")) {
                isShowingAlert = true
            }

        }
        .background(Color.astroUIBackground) // set the background color for both sections
        .navigationBarTitle("Form")
        .onAppear(perform: {prog.becomeCurrent(withPendingUnitCount: 1) ; prog.resignCurrent()})
        .alert("Sample Alert", isPresented: $isShowingAlert) {
            Button("Continue", role: .cancel) {}
        } message: {
            Text("Hello")
        }
      
        }  .tabItem {
            Image(systemName: "slider.horizontal.below.rectangle")
            Text("UI Elements")
        }
    }
}



