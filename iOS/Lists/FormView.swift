//
//  FormView.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct FormView: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var toggleValue: Bool = true
    @State private var sliderValue: Double = 100
    @State private var day: String = ""
    private var prog = Progress(totalUnitCount: 2)

    var body: some View {
        Form{
            Section(header: Text("Text Fields"))
            {
                TextField("Name", text: $name)
                SecureField("Password", text: $password)
            }.listRowBackground(Color.astroUISecondaryGroupedBackground)
            
            Section(header: Text("Controls"))
            {
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
                
                ProgressView(prog)//.padding(.bottom, 30)
                Link("Wikipedia Link", destination: URL(string: "https://www.wikipedia.org")!)
                
                Menu("Days Menu") {
                              Button("Monday") { self.day = "Monday" }
                              Button("Tuesday") { self.day = "Tuesday" }
                              Button("Wednesday") { self.day = "Wednesday" }
                              Button("Thursday") { self.day = "Thursday" }
                              Button("Friday") { self.day = "Friday" }
                          }
                
            }.listRowBackground(Color.astroUISecondaryGroupedBackground)
        }
        .onAppear(perform: {prog.becomeCurrent(withPendingUnitCount: 1) ; prog.resignCurrent()})
        .background(Color.astroUIGroupedBackground) // set the background color for both sections
        .navigationBarTitle("Form with Controls")
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .preferredColorScheme(.dark)
    }
}
